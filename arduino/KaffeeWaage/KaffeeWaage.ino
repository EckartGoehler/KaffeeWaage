// Eine Küchenwaage, mit Wägezelle für HX711 AD, 5kg, und Display-Ausgabe auf AZdelivery 1.3" Display
// $Id:$

#include <Wire.h> 
#include <EEPROM.h>
#include <U8g2lib.h>

#include "stdio.h" // snprintf
#include "HX711.h"


//#define DEBUG 1

#ifdef DEBUG
  #define DEBUG_OUTPUT "%d"
#else
 #define DEBUG_OUTPUT " "
#endif 
 
#define EEPROM_SCALE_ADDR  (0 * sizeof(double))
#define EEPROM_SIGMA_ADDR  (1 * sizeof(double))
#define EEPROM_OFFSET_ADDR (2 * sizeof(double))


#define DISPLAYED_WEIGHT_FRACTION 10

// HX711 circuit wiring
const int LOADCELL_DOUT_PIN = 2;
const int LOADCELL_SCK_PIN = 3;

// the loadcell ADC access class
HX711 scale;

// the display output
U8G2_SH1106_128X64_NONAME_F_HW_I2C u8g2(U8G2_R0, /* reset=*/U8X8_PIN_NONE);


double scaling = 1./(1000./379351.56);
const int tare_average_num = 20;

// last measured weight:
double last_weight = 0;

// running average:
int measurement_averaged_num = 0;

// current averaged number:
double weight_averaged = 0;

const int MAX_AVERAGE = 10;

// sqrt(variance) of single weight measurement [g], estimate a priori
double single_weight_sigma = 0.1;


void u8g2_prepare(void) {
  u8g2.setFont(u8g2_font_6x10_tf);
  u8g2.setFontRefHeightExtendedText();
  u8g2.setDrawColor(1);
  u8g2.setFontPosTop();
  u8g2.setFontDirection(0);
}


void setup()
{
  // output of LED to report measurement update
  pinMode(LED_BUILTIN, OUTPUT);

  // read scaling factor from EEPROM, if there is any:
  if (EEPROM.read(EEPROM_SCALE_ADDR) != 255) {
    EEPROM.get(EEPROM_SCALE_ADDR,scaling);
  }

  // read sigma from EEPROM, if there is any:
  if (EEPROM.read(EEPROM_SIGMA_ADDR) != 255) {
    double raw_sigma;
    EEPROM.get(EEPROM_SIGMA_ADDR,raw_sigma);
    single_weight_sigma = raw_sigma / scaling;
  }
  

	// initialize the LCD
	u8g2.begin();

  u8g2_prepare();

  u8g2.clearBuffer();
  u8g2.drawStr(0,0,"Tarieren");
  u8g2.sendBuffer();
  // Initialize library with data output pin, clock input pin and gain factor.
  // Channel selection is made by passing the appropriate gain:
  // - With a gain factor of 64 or 128, channel A is selected
  // - With a gain factor of 32, channel B is selected
  // By omitting the gain factor parameter, the library
  // default "128" (Channel A) is used here.
  scale.begin(LOADCELL_DOUT_PIN, LOADCELL_SCK_PIN);

  scale.set_scale(scaling);    // this value is obtained by calibrating the scale with known weights; see the README for details
  scale.tare(5);
  scale.tare(tare_average_num);                // reset the scale to 0
}

bool blink_on = false;

void loop()
{
  if (measurement_averaged_num == MAX_AVERAGE) {
    digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  } else {
    digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
  }

  
  // fetch new value, averaged:
  double single_weight = scale.get_units(1);

  // weight apparently changed
  if (fabs(single_weight - last_weight) > 5 * single_weight_sigma) {
    measurement_averaged_num = 0;
  }

  last_weight = single_weight;

  if (measurement_averaged_num == 0) {
     weight_averaged =single_weight;
     measurement_averaged_num = 1;
  } else if (measurement_averaged_num < MAX_AVERAGE) {
    // increase average:
    weight_averaged = (weight_averaged * measurement_averaged_num + single_weight) / (measurement_averaged_num + 1);
    measurement_averaged_num ++;
  } else {
    // running mean:
    weight_averaged = weight_averaged + (single_weight - weight_averaged)/ MAX_AVERAGE;
  }

  double output_weight = weight_averaged;

  // print out value:
  char out[17];
  bool is_positive;
  if (static_cast<int32_t>(output_weight * DISPLAYED_WEIGHT_FRACTION) >= 0) {
    is_positive = true;
  }
  else {
    is_positive = false;
    output_weight = - output_weight;
  }

  int32_t weight_full = static_cast<int32_t>(output_weight);
  int32_t weight_fraction = static_cast<int32_t>(output_weight * DISPLAYED_WEIGHT_FRACTION) - static_cast<int32_t>(output_weight) * DISPLAYED_WEIGHT_FRACTION;
    
  
  snprintf(out,sizeof(out), "%c%4ld.%02ldg " DEBUG_OUTPUT "          ", 
            is_positive ? ' ' : '-',
            weight_full, 
            weight_fraction
#ifdef DEBUG            
            ,measurement_averaged_num
#endif
            );

  u8g2.clearBuffer();
  u8g2.drawStr(0,0,out);
  u8g2.sendBuffer();

}
