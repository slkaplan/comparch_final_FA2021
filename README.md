# FPGA Implementation of Potentiometer Motor Control
## By: Sam Kaplan, Regan Mah, and Alana Huitric
### December 16, 2021

# Overview

The purpose of this project is to use a simple potentiometer in order to change the speed of a DC motor. The analog signal of the potentiometer will be taken in by the FPGA then processed such that the proper PWM signal can be sent through a H-bridge motor drive controller to the brushed DC motor.

# Parts
* [H Bridge Motor Driver](https://www.amazon.com/Qunqi-Controller-Module-Stepper-Arduino/dp/B014KMHSW6/ref=asc_df_B014KMHSW6/?tag=hyprod-20&linkCode=df0&hvadid=167139094796&hvpos=&hvnetw=g&hvrand=15513012047997898902&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9002080&hvtargid=pla-306436938191&psc=1)
* [Brushed DC Motor](https://www.pololu.com/product/2365)
* [CMOD A7 FPGA](https://digilent.com/shop/cmod-a7-breadboardable-artix-7-fpga-module/)
* [Potentiometer](https://www.amazon.com/MCIGICM-Breadboard-Trim-Potentiometer-Arduino/dp/B07S69443J/ref=sr_1_8?_encoding=UTF8&c=ts&keywords=Potentiometers&qid=1639676584&s=industrial&sr=1-8&ts_id=306810011)
* [1.2 kOhm Resistor](https://www.amazon.com/EDGELEC-Resistor-Tolerance-Resistance-Optional/dp/B07HDGCWCR/ref=sr_1_3?keywords=1.2+kohm+resistor&qid=1639677008&sr=8-3)
* [Single Core Wire](https://www.amazon.com/TUOFENG-Wire-Solid-different-colored-spools/dp/B07TX6BX47/ref=sr_1_2?keywords=single+core+wire&qid=1639677047&s=hi&sr=1-2)

# Dependencies


# Code 

The code for this project is split up into multiple modules and test files in order to make this program more readable and debuggable. The file used to run the program is `main.sv`. This file controls the interfacing between the analog input of the potentiometer and processing to digital output to the H-bridge which will then drive the motor. The main module draws from other modules in order to work. First, `potentiometer.sv` will process the analog signal of the potentiometer. Next, `pwm.sv` generates a PWM signal that will be used to drive the motor. Then, `pulse_generator.sv` outputs a pulse over a single clock cucle over a given number of ticks. In order to ensure things run smoothly, check `main.xdc` to see if all the pins are correctly assigned. If problems persist, use the test files to check if all signals are being outputted correctly.  

# Wiring 

# Sources
