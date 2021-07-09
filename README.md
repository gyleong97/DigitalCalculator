# Milestone 5&6: Digital Calculator
## Group Details
Group Name: J.E.M.

Lecturer: PM. Muhammad Mun'im Ahmad Zabidi

|Group Member    |   Matric ID   |  
|----------------|:-------------:|
| Leong Guang Ye |  A17KE0085 |
| Joyce Ng Ting Ming |    A17KE0077   |
| Chan Pei Ting | A17KE0046 |

## Introduction

This project is dedicated as a requirement to complete the course SKEL4273 CAD with HDL of Universiti Teknologi Malaysia (UTM), Johor Bahru, Malaysia.

The project applies the basic operations of digital calculator for two 1-digit inputs including addition, subtraction, multiplication and subtraction. The inputs are obtained from 4x4 matrix membrane keypad and the results will be displayed on 2-digit 7-segment display. This repository records the overall design flow of digital calculator with the aid of Altera Quartus Prime Lite 16.0 and powered on Altera Terasic DE1-SoC FPGA board.

## Software

1. Altera Quartus Prime Lite 16.0

## Hardware

1. Altera Terasic DE1-SoC FPGA
2. Breadboard
3. 4x4 Matrix Membrane Keypad
4. Jumper Wires (Male-to-male, Female-to-male)

## Algorithm of Digital Calculator in C Language

The algorithm is written in the way similar to the concept of 4-to-1 Multiplexer, where operations are decided by selector and the output results are calculated based on the input values.

![algorithm](https://user-images.githubusercontent.com/78777424/124568945-11bd6a00-de78-11eb-9179-512513030272.PNG)

## rtl-ASMchart
![rtlASMchart](https://user-images.githubusercontent.com/78777424/124569570-a758f980-de78-11eb-8670-cd4c6e48f9e8.PNG)

## Functional Block Diagram of Datapath Unit (DU)

Datapath unit has inputs obtained from keypad to calculate the ALU results. Operations within ALU block is determined by the selector.
If reset or clrX or clrY are triggered, X and Y will be zero.
If ldX or ldY are triggered, X and Y will be the input values.

![fbd of DU](https://user-images.githubusercontent.com/78777424/124569632-b344bb80-de78-11eb-9fb1-18f8f383609e.PNG)

## Functional Block Diagram of Control Unit (CU)

Control unit has three start switches for X (startX), Y (startY) and S (startS). Each switch indicates a step to input values and operations.

1. startX - To start register input for X.
2. startY - To start register input for Y.
3. startS - To start a selected operation to calculate and hold the values for X or Y.

![fbd of CU](https://user-images.githubusercontent.com/78777424/124569766-d0798a00-de78-11eb-8d6e-4b26a0b06eac.PNG)

## RTL-CS Table
![rtlcs](https://user-images.githubusercontent.com/78777424/124569890-f010b280-de78-11eb-8e12-bed007501e34.PNG)

## ASM Chart
![asmchart](https://user-images.githubusercontent.com/78777424/124569942-fe5ece80-de78-11eb-8600-da0b1764ef53.PNG)

## Integration of CU & DU

Integration of CU and DU modules are written in Verilog using structural modelling style. The output Z is directed to 7-segment displays while output done is directed to LED to indicate that the calculation is completed.

![fbd](https://user-images.githubusercontent.com/78777424/124570115-29e1b900-de79-11eb-8eae-773fc27c7155.PNG)

## IOBD of Connection of Digital Calculator with Keypad

1. clk will be driven by 50MHz internal clock of Altera Terasic DE1-SoC FPGA.
2. rst, startX, startY and startS are connected by switches.
3. done is directed to LED.
4. segment 1 and segment 2 are directed to 7-segment displays for output results of Z.

Keypad connection is connected in the way where Ro1 to Ro4 are as outputs from calculator and as inputs to keypad and calculator itself. Ci1 to Ci4 are inputs from keypad.

![iobd](https://user-images.githubusercontent.com/78777424/124570269-4d0c6880-de79-11eb-9b29-39896eb3d8ab.PNG)


## Simulation Report & Waveform
![image](https://user-images.githubusercontent.com/78777424/124570509-8c3ab980-de79-11eb-9ae6-6c825d81bbb4.png)


## RTL viewer of Top-Level Module

Pulser will generate bit 1 signal alternatively to each row of the keypad. To input a number or operator, decoder must detect bit 1 signal from exactly any one row and any one column from the keypad. Depending on the bit 1 signal sent from the pulser, when a button is pressed, it has a chance to be detected by decoder at certain time and output the corresponding number.

Decoder prescaler is needed to avoid missing detection of input by decoder. Prescaler also helps in giving stable 7-segment displays.

![image](https://user-images.githubusercontent.com/78777424/124570638-a8d6f180-de79-11eb-9365-93230c9b6b37.png)

## Pin Planner

The pin assignments referred [Altera Terasic DE1-SoC FPGA User Manual](https://www.intel.com/content/dam/altera-www/global/en_US/portal/dsn/42/doc-us-dsnbk-42-1004282204-de1-soc-user-manual.pdf)

![image](https://user-images.githubusercontent.com/78777424/124570714-ba1ffe00-de79-11eb-9cfd-6814a57207ac.png)
![image](https://user-images.githubusercontent.com/78777424/124571009-fb181280-de79-11eb-84b0-802f56123383.png)
![image](https://user-images.githubusercontent.com/78777424/124571075-0ec37900-de7a-11eb-97a4-cfbac1646034.png)

## Programmer
![image](https://user-images.githubusercontent.com/78777424/124570865-d6239f80-de79-11eb-93f3-ad0f0832c837.png)

## Hardware Connection
![image](https://user-images.githubusercontent.com/78777424/124570919-e2a7f800-de79-11eb-9690-6091164698b4.png)

## Video demonstration link: 
https://youtu.be/hT2JrUVO6RM 
