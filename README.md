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
* [9V Battery](https://www.amazon.com/Amazon-Basics-Performance-All-Purpose-Batteries/dp/B00MH4QM1S/ref=sr_1_5?keywords=9v+battery&qid=1639682927&rdc=1&sr=8-5)

# Dependencies

* [Vivado]()
* [Icarus/System Verilog]()
* [GTK Wave]()

# Code 

The code for this project is split up into multiple modules and test files in order to make this program more readable and debuggable. The file used to run the program is `main.sv`. This file controls the interfacing between the analog input of the potentiometer and processing to digital output to the H-bridge which will then drive the motor. The main module draws from other modules in order to work. First, `pot.sv` will process the analog signal of the potentiometer. Next, `pwm.sv` generates a PWM signal that will be used to drive the motor. The PWM code is fairly simple, outputting the lowest possible signal when the count is zero and highest when the count reaches a maximum. If you are encountering issues with the PWM use the `test_pwm.sv` and check the waveforms. Then, `pulse_generator.sv` outputs a pulse over a single clock cucle over a given number of ticks. In order to ensure things run smoothly, check `main.xdc` to see if all the pins are correctly assigned. If problems persist, use the test files to check if all signals are being outputted correctly.  

# Wiring 

The wiring for this project can be difficult so re-checking with the datasheet for these parts is essential, especially if you are using part replacements. It is also recommended you check Arduino tutorials for using the H-bridge wiring since there are fewer examples of it working with an FPGA. Also note that the FPGA is wired to power and ground but not shown in the schematic.

<img src="pics/Circuit Diagram.png"  />

**Fig. 1 Wiring diagram of all the necessary components for this project. Note that the wiring schematic provided for the parts are not to scale.**
# How To
1. Set up the FPGA, Potentiometer, H bridge motor controller, and motor according to the circuit diagram.
2. Download and install dependencies as listed above.
3. Run make_main.bit, make_program_fpga_vivado, and make program_fpga_diligent then turn the potentiometer to watch the motor spin!

# XADC
The Xilinx Analog to Digital Converter is very tricky (i.e., we didn't...). However here is what we figured out and hopefully you will have more luck. 

First you want to down this first zip file on this [page](https://github.com/Digilent/Cmod-A7-15T-XADC/releases/tag/v2018.2-1). Then open vivado with 

`vivado Cmod-A7-15T-XADC.xpr`

Then you can double click on the `wiz`file to edit. Change to single channel mode, disable alarms, and select VPVN input under channel select. Click ok and make sure Vivado doesn't crash regenerating the `ip`

After that it's very important that you synthesize and program the FPGA using Vivado. Using commandline interfaces will not incorporate the wizard and your XADC module will not work!

# Sources

* [Using Motor Driver with Arduino](https://create.arduino.cc/projecthub/ryanchan/how-to-use-the-l298n-motor-driver-b124c5)
* [XADC Documentation](https://www.xilinx.com/support/documentation/user_guides/ug480_7Series_XADC.pdf)
* [XADC Example Code](https://github.com/Digilent/Cmod-A7-15T-XADC?_ga=2.109299079.386762158.1639440346-1772712610.1632953568)
* [FPGA Wiring Schematic](https://digilent.com/reference/_media/reference/programmable-logic/cmod-a7/cmod_a7_sch_rev_c0.pdf)
* [Computer Architecture Repo](https://github.com/avinash-nonholonomy/olin-cafe-f21)
