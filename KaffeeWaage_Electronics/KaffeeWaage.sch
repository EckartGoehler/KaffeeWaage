EESchema Schematic File Version 4
LIBS:Küchenwaage-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Kuechen-Waage"
Date "2019-08-20"
Rev "1.0"
Comp "egsoft"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 8700 1100 0    60   ~ 0
1(Tx)
Text Label 8700 1200 0    60   ~ 0
0(Rx)
Text Label 8700 1300 0    60   ~ 0
Reset
Text Label 8700 1500 0    60   ~ 0
2
Text Label 8700 1600 0    60   ~ 0
3(**)
Text Label 8700 1700 0    60   ~ 0
4
Text Label 8700 1800 0    60   ~ 0
5(**)
Text Label 8700 1900 0    60   ~ 0
6(**)
Text Label 8700 2000 0    60   ~ 0
7
Text Label 8700 2100 0    60   ~ 0
8
Text Label 8700 2200 0    60   ~ 0
9(**)
Text Label 8700 2300 0    60   ~ 0
10(**/SS)
Text Label 8700 2400 0    60   ~ 0
11(**/MOSI)
Text Label 8700 2500 0    60   ~ 0
12(MISO)
Text Label 10550 2500 0    60   ~ 0
13(SCK)
Text Label 10550 2200 0    60   ~ 0
A0
Text Label 10550 2100 0    60   ~ 0
A1
Text Label 10550 2000 0    60   ~ 0
A2
Text Label 10550 1900 0    60   ~ 0
A3
Text Label 10550 1800 0    60   ~ 0
A4
Text Label 10550 1700 0    60   ~ 0
A5
Text Label 10550 1600 0    60   ~ 0
A6
Text Label 10550 1500 0    60   ~ 0
A7
Text Label 10550 2300 0    60   ~ 0
AREF
Text Label 10550 1300 0    60   ~ 0
Reset
Text Notes 10800 1000 0    60   ~ 0
Holes
Text Notes 8500 575  0    60   ~ 0
Shield for Arduino Nano
Text Label 10250 950  1    60   ~ 0
Vin
Wire Notes Line
	8475 650  9675 650 
Wire Notes Line
	9675 650  9675 475 
$Comp
L Connector_Generic:Conn_01x01 P3
U 1 1 56D73ADD
P 10800 650
F 0 "P3" V 10900 650 50  0000 C CNN
F 1 "CONN_01X01" V 10900 650 50  0001 C CNN
F 2 "Socket_Arduino_Nano:1pin_Nano" H 10800 650 50  0001 C CNN
F 3 "" H 10800 650 50  0000 C CNN
	1    10800 650 
	0    -1   -1   0   
$EndComp
NoConn ~ 10800 850 
$Comp
L Connector_Generic:Conn_01x01 P4
U 1 1 56D73D86
P 10900 650
F 0 "P4" V 11000 650 50  0000 C CNN
F 1 "CONN_01X01" V 11000 650 50  0001 C CNN
F 2 "Socket_Arduino_Nano:1pin_Nano" H 10900 650 50  0001 C CNN
F 3 "" H 10900 650 50  0000 C CNN
	1    10900 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P5
U 1 1 56D73DAE
P 11000 650
F 0 "P5" V 11100 650 50  0000 C CNN
F 1 "CONN_01X01" V 11100 650 50  0001 C CNN
F 2 "Socket_Arduino_Nano:1pin_Nano" H 11000 650 50  0001 C CNN
F 3 "" H 11000 650 50  0000 C CNN
	1    11000 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P6
U 1 1 56D73DD9
P 11100 650
F 0 "P6" V 11200 650 50  0000 C CNN
F 1 "CONN_01X01" V 11200 650 50  0001 C CNN
F 2 "Socket_Arduino_Nano:1pin_Nano" H 11100 650 50  0001 C CNN
F 3 "" H 11100 650 50  0000 C CNN
	1    11100 650 
	0    -1   -1   0   
$EndComp
NoConn ~ 10900 850 
NoConn ~ 11000 850 
NoConn ~ 11100 850 
$Comp
L Connector_Generic:Conn_01x15 P1
U 1 1 56D73FAC
P 9550 1800
F 0 "P1" H 9550 2600 50  0000 C CNN
F 1 "Digital" V 9650 1800 50  0000 C CNN
F 2 "Socket_Arduino_Nano:Socket_Strip_Arduino_1x15" H 9550 1800 50  0001 C CNN
F 3 "" H 9550 1800 50  0000 C CNN
	1    9550 1800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x15 P2
U 1 1 56D740C7
P 9950 1800
F 0 "P2" H 9950 2600 50  0000 C CNN
F 1 "Analog" V 10050 1800 50  0000 C CNN
F 2 "Socket_Arduino_Nano:Socket_Strip_Arduino_1x15" H 9950 1800 50  0001 C CNN
F 3 "" H 9950 1800 50  0000 C CNN
	1    9950 1800
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 56D7422C
P 9250 2600
F 0 "#PWR01" H 9250 2350 50  0001 C CNN
F 1 "GND" H 9250 2450 50  0000 C CNN
F 2 "" H 9250 2600 50  0000 C CNN
F 3 "" H 9250 2600 50  0000 C CNN
	1    9250 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 1400 9250 1400
Wire Wire Line
	9250 1400 9250 2600
Wire Wire Line
	9350 1100 8700 1100
Wire Wire Line
	8700 1200 9350 1200
Wire Wire Line
	9350 1300 8700 1300
Wire Wire Line
	8700 1500 9350 1500
Wire Wire Line
	9350 1600 8700 1600
Wire Wire Line
	8700 1700 9350 1700
Wire Wire Line
	9350 1800 8700 1800
Wire Wire Line
	8700 1900 9350 1900
Wire Wire Line
	9350 2000 8700 2000
Wire Wire Line
	8700 2100 9350 2100
Wire Wire Line
	9350 2200 8700 2200
Wire Wire Line
	8700 2300 9350 2300
Wire Wire Line
	9350 2400 8700 2400
Wire Wire Line
	8700 2500 9350 2500
$Comp
L power:GND #PWR0101
U 1 1 56D746ED
P 10250 2600
F 0 "#PWR0101" H 10250 2350 50  0001 C CNN
F 1 "GND" H 10250 2450 50  0000 C CNN
F 2 "" H 10250 2600 50  0000 C CNN
F 3 "" H 10250 2600 50  0000 C CNN
	1    10250 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 2600 10250 1200
Wire Wire Line
	10250 1200 10150 1200
Wire Wire Line
	10150 1100 10250 1100
Wire Wire Line
	10250 1100 10250 950 
$Comp
L power:+5V #PWR03
U 1 1 56D747E8
P 10350 950
F 0 "#PWR03" H 10350 800 50  0001 C CNN
F 1 "+5V" V 10350 1150 28  0000 C CNN
F 2 "" H 10350 950 50  0000 C CNN
F 3 "" H 10350 950 50  0000 C CNN
	1    10350 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 950  10350 1400
Wire Wire Line
	10350 1400 10150 1400
$Comp
L power:+3V3 #PWR04
U 1 1 56D74854
P 10450 950
F 0 "#PWR04" H 10450 800 50  0001 C CNN
F 1 "+3.3V" V 10450 1150 28  0000 C CNN
F 2 "" H 10450 950 50  0000 C CNN
F 3 "" H 10450 950 50  0000 C CNN
	1    10450 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 950  10450 2400
Wire Wire Line
	10450 2400 10150 2400
Wire Wire Line
	10550 1300 10150 1300
Wire Wire Line
	10150 1500 10550 1500
Wire Wire Line
	10550 1600 10150 1600
Wire Wire Line
	10550 1700 10150 1700
Wire Wire Line
	10150 1800 10550 1800
Wire Wire Line
	10550 1900 10150 1900
Wire Wire Line
	10550 2000 10150 2000
Wire Wire Line
	10150 2100 10550 2100
Wire Wire Line
	10550 2200 10150 2200
Wire Wire Line
	10550 2300 10150 2300
Wire Wire Line
	10150 2500 10550 2500
Wire Notes Line
	11200 1050 10650 1050
Wire Notes Line
	10650 1050 10650 500 
Wire Notes Line
	11250 2850 8500 2850
Text Notes 9650 1100 0    60   ~ 0
1
Wire Notes Line
	11200 3900 11200 2850
Wire Notes Line
	8450 500  8450 3900
Wire Notes Line
	9150 3050 9150 2850
Text Notes 8500 3000 0    50   ~ 0
Arduino Power
Wire Notes Line
	8450 3050 9150 3050
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise J1
U 1 1 5D5C5C71
P 9500 3400
F 0 "J1" H 9550 3717 50  0000 C CNN
F 1 "Power_Connector" H 9550 3626 50  0000 C CNN
F 2 "" H 9500 3400 50  0001 C CNN
F 3 "~" H 9500 3400 50  0001 C CNN
	1    9500 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5D5C6B3D
P 10000 3500
F 0 "#PWR0102" H 10000 3250 50  0001 C CNN
F 1 "GND" H 10005 3327 50  0000 C CNN
F 2 "" H 10000 3500 50  0001 C CNN
F 3 "" H 10000 3500 50  0001 C CNN
	1    10000 3500
	1    0    0    -1  
$EndComp
Text Label 9950 3400 0    50   ~ 0
11(**/MOSI)
$Comp
L power:+5V #PWR0103
U 1 1 5D5C80A4
P 10000 3300
F 0 "#PWR0103" H 10000 3150 50  0001 C CNN
F 1 "+5V" H 10015 3473 50  0000 C CNN
F 2 "" H 10000 3300 50  0001 C CNN
F 3 "" H 10000 3300 50  0001 C CNN
	1    10000 3300
	1    0    0    -1  
$EndComp
Text Label 9250 3300 2    50   ~ 0
12(MISO)
Text Label 9250 3400 2    50   ~ 0
13(SCK)
Text Label 9250 3500 2    50   ~ 0
Reset
Wire Wire Line
	9800 3500 10000 3500
Wire Wire Line
	9800 3400 9950 3400
Wire Wire Line
	9250 3400 9300 3400
Wire Wire Line
	9250 3300 9300 3300
Wire Wire Line
	9250 3500 9300 3500
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 5D5F489B
P 7200 1550
F 0 "J2" H 7280 1542 50  0000 L CNN
F 1 "Conn_HX711" H 7280 1451 50  0000 L CNN
F 2 "" H 7200 1550 50  0001 C CNN
F 3 "~" H 7200 1550 50  0001 C CNN
	1    7200 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 5D5F54D5
P 6850 1450
F 0 "#PWR0104" H 6850 1300 50  0001 C CNN
F 1 "+5V" H 6865 1623 50  0000 C CNN
F 2 "" H 6850 1450 50  0001 C CNN
F 3 "" H 6850 1450 50  0001 C CNN
	1    6850 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 1450 7000 1450
$Comp
L power:GND #PWR0105
U 1 1 5D5F5FAB
P 6900 1750
F 0 "#PWR0105" H 6900 1500 50  0001 C CNN
F 1 "GND" H 6905 1577 50  0000 C CNN
F 2 "" H 6900 1750 50  0001 C CNN
F 3 "" H 6900 1750 50  0001 C CNN
	1    6900 1750
	1    0    0    -1  
$EndComp
Text Label 6900 1550 2    50   ~ 0
3(**)
Text Label 6900 1650 2    50   ~ 0
2
Wire Wire Line
	6900 1550 7000 1550
Wire Wire Line
	6900 1650 7000 1650
Wire Notes Line
	6050 700  7300 700 
Wire Notes Line
	7300 700  7300 450 
Text Notes 6200 600  0    50   ~ 0
HX711 Amplifier
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 5D5FD30D
P 7150 3350
F 0 "J3" H 7229 3342 50  0000 L CNN
F 1 "Conn_LCD" H 7229 3251 50  0000 L CNN
F 2 "" H 7150 3350 50  0001 C CNN
F 3 "~" H 7150 3350 50  0001 C CNN
	1    7150 3350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 5D5FD313
P 6900 3200
F 0 "#PWR0106" H 6900 3050 50  0001 C CNN
F 1 "+5V" H 6915 3373 50  0000 C CNN
F 2 "" H 6900 3200 50  0001 C CNN
F 3 "" H 6900 3200 50  0001 C CNN
	1    6900 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5D5FD31A
P 6400 3400
F 0 "#PWR0107" H 6400 3150 50  0001 C CNN
F 1 "GND" H 6405 3227 50  0000 C CNN
F 2 "" H 6400 3400 50  0001 C CNN
F 3 "" H 6400 3400 50  0001 C CNN
	1    6400 3400
	1    0    0    -1  
$EndComp
Text Label 6800 3550 2    50   ~ 0
A5
Wire Wire Line
	6800 3550 6950 3550
Text Label 6800 3450 2    50   ~ 0
A4
Wire Wire Line
	6800 3450 6950 3450
Wire Wire Line
	6400 3400 6400 3250
Wire Notes Line
	6050 3900 11200 3900
Wire Notes Line
	6050 500  6050 3900
Wire Notes Line
	6050 3050 6850 3050
Wire Notes Line
	6850 3050 6850 2850
Text Notes 6150 2950 0    50   ~ 0
LCD-Connector
$Comp
L Device:Battery_Cell BT1
U 1 1 5D61A09E
P 3500 1600
F 0 "BT1" H 3618 1696 50  0000 L CNN
F 1 "Battery_Cell" H 3618 1605 50  0000 L CNN
F 2 "" V 3500 1660 50  0001 C CNN
F 3 "~" V 3500 1660 50  0001 C CNN
	1    3500 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 5D61A1DC
P 4250 1050
F 0 "#PWR0108" H 4250 900 50  0001 C CNN
F 1 "+5V" H 4265 1223 50  0000 C CNN
F 2 "" H 4250 1050 50  0001 C CNN
F 3 "" H 4250 1050 50  0001 C CNN
	1    4250 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5D61A219
P 3500 1850
F 0 "#PWR0109" H 3500 1600 50  0001 C CNN
F 1 "GND" H 3505 1677 50  0000 C CNN
F 2 "" H 3500 1850 50  0001 C CNN
F 3 "" H 3500 1850 50  0001 C CNN
	1    3500 1850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPDT SW1
U 1 1 5D61B4B7
P 3900 1150
F 0 "SW1" H 3900 1435 50  0000 C CNN
F 1 "SW_SPDT" H 3900 1344 50  0000 C CNN
F 2 "" H 3900 1150 50  0001 C CNN
F 3 "" H 3900 1150 50  0001 C CNN
	1    3900 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 1400 3500 1150
Wire Wire Line
	3500 1150 3700 1150
Wire Wire Line
	4100 1050 4250 1050
Wire Notes Line
	2950 2850 2950 500 
Wire Notes Line
	2950 2850 8450 2850
Wire Notes Line
	2950 700  4500 700 
Wire Notes Line
	4500 700  4500 500 
Text Notes 3350 600  0    50   ~ 0
Power Supply
NoConn ~ 4100 1250
NoConn ~ 8700 2300
NoConn ~ 8700 2200
NoConn ~ 8700 2100
NoConn ~ 8700 2000
NoConn ~ 8700 1900
NoConn ~ 8700 1800
NoConn ~ 8700 1700
NoConn ~ 8700 1100
NoConn ~ 8700 1200
NoConn ~ 10250 950 
NoConn ~ 10550 1500
NoConn ~ 10550 1600
NoConn ~ 10550 1900
NoConn ~ 10550 2000
NoConn ~ 10550 2100
NoConn ~ 10550 2200
NoConn ~ 10550 2300
NoConn ~ 10450 950 
Wire Wire Line
	9800 3300 10000 3300
Wire Wire Line
	6900 1750 7000 1750
Wire Wire Line
	3500 1700 3500 1850
Wire Wire Line
	6400 3250 6950 3250
Wire Wire Line
	6900 3200 6900 3350
Wire Wire Line
	6900 3350 6950 3350
NoConn ~ 10550 2500
$EndSCHEMATC
