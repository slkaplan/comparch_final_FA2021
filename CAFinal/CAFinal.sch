EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L FPGA_Xilinx_Artix7:XC7A15T-CPG236 U?
U 1 1 61BB82F7
P 5750 4800
F 0 "U?" H 5750 1825 50  0000 C CNN
F 1 "XC7A15T-CPG236" H 5750 1734 50  0000 C CNN
F 2 "" H 5750 4800 50  0001 C CNN
F 3 "" H 5750 4800 50  0000 C CNN
	1    5750 4800
	1    0    0    -1  
$EndComp
$Comp
L Motor:Motor_DC M?
U 1 1 61BD2476
P 10500 3350
F 0 "M?" H 10658 3346 50  0000 L CNN
F 1 "Motor_DC" H 10658 3255 50  0000 L CNN
F 2 "" H 10500 3260 50  0001 C CNN
F 3 "~" H 10500 3260 50  0001 C CNN
	1    10500 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV?
U 1 1 61BD2C03
P 8650 1950
F 0 "RV?" H 8580 1904 50  0000 R CNN
F 1 "R_POT" H 8580 1995 50  0000 R CNN
F 2 "" H 8650 1950 50  0001 C CNN
F 3 "~" H 8650 1950 50  0001 C CNN
	1    8650 1950
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 61BF3915
P 8350 1950
F 0 "R?" V 8143 1950 50  0000 C CNN
F 1 "R 1.2 kOhm" V 8234 1950 50  0000 C CNN
F 2 "" V 8280 1950 50  0001 C CNN
F 3 "~" H 8350 1950 50  0001 C CNN
	1    8350 1950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7750 3400 8100 3400
Wire Wire Line
	8100 3400 8100 3100
Wire Wire Line
	8100 3100 8600 3100
Wire Wire Line
	7750 3500 8150 3500
Wire Wire Line
	8150 3500 8150 3200
Wire Wire Line
	8150 3200 8600 3200
Wire Wire Line
	7750 3600 8200 3600
Wire Wire Line
	8200 3600 8200 3300
Wire Wire Line
	8200 3300 8600 3300
$Comp
L Device:Battery_Cell BT?
U 1 1 61C08389
P 9550 2500
F 0 "BT?" V 9805 2550 50  0000 C CNN
F 1 "Battery_Cell" V 9714 2550 50  0000 C CNN
F 2 "" V 9550 2560 50  0001 C CNN
F 3 "~" V 9550 2560 50  0001 C CNN
	1    9550 2500
	0    -1   -1   0   
$EndComp
$Comp
L Driver_Motor:L298HN U?
U 1 1 61BD1417
P 9200 3600
F 0 "U?" H 9200 4481 50  0000 C CNN
F 1 "L298HN" H 9200 4390 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-15_P2.54x2.54mm_StaggerOdd_Lead4.58mm_Vertical" H 9250 2950 50  0001 L CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00000240.pdf" H 9350 3850 50  0001 C CNN
	1    9200 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 3400 10200 3400
Wire Wire Line
	10200 3400 10200 3150
Wire Wire Line
	10200 3150 10500 3150
Wire Wire Line
	9800 3500 10200 3500
Wire Wire Line
	10200 3500 10200 3700
Wire Wire Line
	10200 3700 10500 3700
Wire Wire Line
	10500 3700 10500 3650
Wire Wire Line
	9300 2900 9300 2500
Wire Wire Line
	9300 2500 9350 2500
Wire Wire Line
	9650 2500 11050 2500
Wire Wire Line
	11050 2500 11050 4450
Wire Wire Line
	11050 4450 9200 4450
Wire Wire Line
	9200 4450 9200 4300
Wire Wire Line
	8200 1950 7850 1950
Wire Wire Line
	7850 1950 7850 2700
Wire Wire Line
	7850 2700 7750 2700
$Comp
L power:+5V #PWR?
U 1 1 61C2630A
P 8650 1800
F 0 "#PWR?" H 8650 1650 50  0001 C CNN
F 1 "+5V" H 8665 1973 50  0000 C CNN
F 2 "" H 8650 1800 50  0001 C CNN
F 3 "" H 8650 1800 50  0001 C CNN
	1    8650 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61C27091
P 8650 2100
F 0 "#PWR?" H 8650 1850 50  0001 C CNN
F 1 "GND" H 8655 1927 50  0000 C CNN
F 2 "" H 8650 2100 50  0001 C CNN
F 3 "" H 8650 2100 50  0001 C CNN
	1    8650 2100
	1    0    0    -1  
$EndComp
$EndSCHEMATC
