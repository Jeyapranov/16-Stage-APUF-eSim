EESchema Schematic File Version 2
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:power
LIBS:eSim_Plot
LIBS:transistors
LIBS:conn
LIBS:eSim_User
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:eSim_Analog
LIBS:eSim_Devices
LIBS:eSim_Digital
LIBS:eSim_Hybrid
LIBS:eSim_Miscellaneous
LIBS:eSim_Power
LIBS:eSim_Sources
LIBS:eSim_Subckt
LIBS:eSim_Nghdl
LIBS:eSim_Ngveri
LIBS:eSim_SKY130
LIBS:eSim_SKY130_Subckts
LIBS:buffer-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
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
L mosfet_p M2
U 1 1 6978D109
P 5660 3075
F 0 "M2" H 5610 3125 50  0000 R CNN
F 1 "mosfet_p" H 5710 3225 50  0000 R CNN
F 2 "" H 5910 3175 29  0000 C CNN
F 3 "" H 5710 3075 60  0000 C CNN
	1    5660 3075
	1    0    0    1   
$EndComp
$Comp
L mosfet_n M1
U 1 1 6978D1FA
P 5610 3600
F 0 "M1" H 5610 3450 50  0000 R CNN
F 1 "mosfet_n" H 5710 3550 50  0000 R CNN
F 2 "" H 5910 3300 29  0000 C CNN
F 3 "" H 5710 3400 60  0000 C CNN
	1    5610 3600
	1    0    0    -1  
$EndComp
$Comp
L mosfet_p M4
U 1 1 6978DBFB
P 6740 3055
F 0 "M4" H 6690 3105 50  0000 R CNN
F 1 "mosfet_p" H 6790 3205 50  0000 R CNN
F 2 "" H 6990 3155 29  0000 C CNN
F 3 "" H 6790 3055 60  0000 C CNN
	1    6740 3055
	1    0    0    1   
$EndComp
$Comp
L mosfet_n M3
U 1 1 6978DC01
P 6690 3580
F 0 "M3" H 6690 3430 50  0000 R CNN
F 1 "mosfet_n" H 6790 3530 50  0000 R CNN
F 2 "" H 6990 3280 29  0000 C CNN
F 3 "" H 6790 3380 60  0000 C CNN
	1    6690 3580
	1    0    0    -1  
$EndComp
Wire Wire Line
	5810 3275 5810 3600
Wire Wire Line
	5510 3075 5350 3075
Wire Wire Line
	5350 3075 5350 3800
Wire Wire Line
	5350 3800 5510 3800
Wire Wire Line
	5810 2520 5810 2875
Wire Wire Line
	5810 3425 6430 3425
Connection ~ 5810 3425
Wire Wire Line
	5810 4000 5810 4215
Wire Wire Line
	5350 3445 5090 3445
Connection ~ 5350 3445
Wire Wire Line
	5910 3950 5910 4050
Wire Wire Line
	5910 4050 5810 4050
Connection ~ 5810 4050
Wire Wire Line
	5910 2925 5910 2805
Wire Wire Line
	5910 2805 5810 2805
Connection ~ 5810 2805
Wire Wire Line
	6890 3255 6890 3580
Wire Wire Line
	6590 3055 6430 3055
Wire Wire Line
	6430 3055 6430 3780
Wire Wire Line
	6430 3780 6590 3780
Wire Wire Line
	6890 3405 7250 3405
Connection ~ 6890 3405
Connection ~ 6430 3425
Wire Wire Line
	6990 3930 6990 4030
Wire Wire Line
	6990 4030 6890 4030
Connection ~ 6890 4030
Wire Wire Line
	6990 2905 6990 2785
Wire Wire Line
	6990 2785 6890 2785
Connection ~ 6890 2785
Wire Wire Line
	6890 3980 6890 4215
$Comp
L GND #PWR02
U 1 1 6978DC11
P 6450 4275
F 0 "#PWR02" H 6450 4025 50  0001 C CNN
F 1 "GND" H 6450 4125 50  0000 C CNN
F 2 "" H 6450 4275 50  0001 C CNN
F 3 "" H 6450 4275 50  0001 C CNN
	1    6450 4275
	1    0    0    -1  
$EndComp
$Comp
L DC v2
U 1 1 697AFDD4
P 6385 2055
F 0 "v2" H 6185 2155 60  0000 C CNN
F 1 "DC" H 6185 2005 60  0000 C CNN
F 2 "R1" H 6085 2055 60  0000 C CNN
F 3 "" H 6385 2055 60  0000 C CNN
	1    6385 2055
	-1   0    0    1   
$EndComp
Wire Wire Line
	5810 2520 6890 2520
Wire Wire Line
	6890 2520 6890 2855
Wire Wire Line
	6385 2505 6385 2520
Connection ~ 6385 2520
$Comp
L GND #PWR03
U 1 1 697B0297
P 6385 1605
F 0 "#PWR03" H 6385 1355 50  0001 C CNN
F 1 "GND" H 6385 1455 50  0000 C CNN
F 2 "" H 6385 1605 50  0001 C CNN
F 3 "" H 6385 1605 50  0001 C CNN
	1    6385 1605
	-1   0    0    1   
$EndComp
$Comp
L PORT U1
U 1 1 697AFA4F
P 4840 3445
F 0 "U1" H 4890 3545 30  0000 C CNN
F 1 "PORT" H 4840 3445 30  0000 C CNN
F 2 "" H 4840 3445 60  0000 C CNN
F 3 "" H 4840 3445 60  0000 C CNN
	1    4840 3445
	1    0    0    -1  
$EndComp
$Comp
L PORT U1
U 2 1 697AFBE6
P 7500 3405
F 0 "U1" H 7550 3505 30  0000 C CNN
F 1 "PORT" H 7500 3405 30  0000 C CNN
F 2 "" H 7500 3405 60  0000 C CNN
F 3 "" H 7500 3405 60  0000 C CNN
	2    7500 3405
	-1   0    0    1   
$EndComp
Text Label 5230 3445 0    60   ~ 0
in
Text Label 7085 3405 0    60   ~ 0
out
Wire Wire Line
	6890 4215 5810 4215
Wire Wire Line
	6450 4275 6450 4215
Connection ~ 6450 4215
$EndSCHEMATC
