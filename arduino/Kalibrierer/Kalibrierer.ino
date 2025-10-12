/*
 * Program to calibrate the kitchen scale and write the calibration value to EEPROM
 * $Id:$
 * Eckart Goehler, August 2019
*/

#include "HX711.h"
#include <EEPROM.h>

// HX711 circuit wiring
const int LOADCELL_DOUT_PIN = 2;
const int LOADCELL_SCK_PIN = 3;

#define EEPROM_SCALE_ADDR  (0 * sizeof(double))
#define EEPROM_SIGMA_ADDR  (1 * sizeof(double))
#define EEPROM_OFFSET_ADDR (2 * sizeof(double))

HX711 scale;
double scaling = 1./(1000./416186.00);

// number of averages for offset estimation:
const uint8_t offset_num = 100; 
const uint8_t calibration_num = 100; 
const uint32_t sigma_num = 100;
const uint32_t gain_factor = 128; // could be 128 (default), 64 or 32 (channel B)


void setup() {
  Serial.begin(57600);
  scale.begin(LOADCELL_DOUT_PIN, LOADCELL_SCK_PIN,gain_factor);

  // load latest scaling
  if (EEPROM.read(EEPROM_SCALE_ADDR) != 255) {
    EEPROM.get(EEPROM_SCALE_ADDR,scaling);
  }


  // wait for ready
  Serial.println("Waiting to become ready");
  while(!scale.is_ready())
    /*wait*/;
  delay(5000);
  
  // tare, i.e. get offset
  Serial.println("Please remove calibration weight from the scale (except of possible offset to be removed). Press enter when ready.");
  while(Serial.available() == 0)
    /*wait*/;
  Serial.read();

  Serial.println("Running zero offset estimation");
  uint32_t offset_sum =0;
  for (uint8_t i=0; i < offset_num; i++) {
    while(!scale.is_ready())
      /*wait*/;
    offset_sum += scale.read();
  }

  double raw_offset = double(offset_sum)/offset_num;
  Serial.print("Estimated (raw) offset: "); Serial.print(raw_offset); Serial.println();

  Serial.println("Running sigma estimation");
  double sigma_sum = 0;
  double sigma_sqr_sum = 0;
  for (uint32_t i=0; i < sigma_num; i++) {
    double val;
    while(!scale.is_ready())
      /*wait*/;
    val =  scale.read();
    val -= raw_offset; // to keep numerics small
    sigma_sum += val;
    sigma_sqr_sum += val*val;
    Serial.print("Val: "); Serial.print(val); Serial.println();
  }

  double sigma_average = sigma_sum/sigma_num;  
  double sigma = (sigma_sqr_sum -  sigma_average*sigma_average * sigma_num) / (sigma_num -1);
  Serial.print("Sigma-average: ");Serial.print(sigma_average); Serial.println();
  Serial.print("Sigma-sum: "); Serial.print(sigma_sum); Serial.println();
  Serial.print("Sigma-sqr-sum: "); Serial.print(sigma_sqr_sum); Serial.println();

  double calibration_sigma_raw = sqrt(sigma);
  Serial.print("Estimated (raw)    sigma: "); Serial.print(calibration_sigma_raw); Serial.println();
  Serial.print("Estimated (scaled) sigma: "); Serial.print(calibration_sigma_raw/scaling); Serial.println();
  
  // quest for calibration weight    
  Serial.println("Please put calibration weight on scale and then enter its weight in gramm:");
  while(Serial.available() == 0)
    /*wait*/;
  double calibration_weight = Serial.parseInt();
  Serial.print("You entered a weight of "); Serial.print(calibration_weight); Serial.println("g");
  
  // average
  Serial.println("Running calibration");
  uint32_t calibration_measurement_sum = 0;
  for (uint8_t i=0; i < calibration_num; i++) {
    while(!scale.is_ready())
      /*wait*/;
    calibration_measurement_sum += scale.read();
  }

  double raw_calibration_measurement_average = double(calibration_measurement_sum)/calibration_num - raw_offset;
  Serial.print("Estimated (raw) calibration value: "); Serial.print(raw_calibration_measurement_average); Serial.println();

  double calibration_factor = raw_calibration_measurement_average / calibration_weight;
  Serial.print("Estimated (final) calibration factor: "); Serial.print(calibration_factor); Serial.println();  

  // write scaling to EEPROM
  EEPROM.put(EEPROM_SCALE_ADDR,calibration_factor);
  Serial.println("Saved scaling factor to EEPROM");

  // write raw sigma to EEPROM
  EEPROM.put(EEPROM_SIGMA_ADDR,calibration_sigma_raw);
  Serial.println("Saved raw sigma to EEPROM");

// write offset to EEPROM
  EEPROM.put(EEPROM_OFFSET_ADDR,raw_offset);
  Serial.println("Saved raw offset to EEPROM");  
  
}


void loop() {

/*
    float val= scale.get_units(5);
    char out[17];
    snprintf(out,sizeof(out), "%4d.%1dg",(int) val, (int)(val *10) % 10);
    Serial.println(out);

  //delay(1000);
  */
}
