# ECE-128-Lab-10: Whole System Design

## Description

This lab focuses on designing and implementing a complete multiplication system using Verilog. The system integrates ROM, RAM, a register file, a combinational multiplier, and a finite state machine (FSM) control unit. Two 4-bit operands are read from ROM and multiplied to produce an 8-bit result, which is stored in RAM. The design was tested using behavioral simulations in Vivado and implemented on the Basys 3 FPGA board.

## Simulation

1. Open the project in Vivado
2. Add the Verilog source code and testbench files
3. Set `Multiplier_top_tb` as the simulation top module
4. Run Behavioral Simulation
5. Observe the waveforms to verify the multiplication results and RAM read/write operations

## FPGA Implementation

The complete multiplication system was implemented and tested on the Basys 3 FPGA board. Switches were used to select ROM and RAM addresses, while the LEDs and seven-segment display showed the multiplication results.

To implement the design on the FPGA:

1. Set `lab10_board_top` as the top module
2. Add the `basys3.xdc` constraints file
3. Run Synthesis and Implementation
4. Generate the bitstream and program the Basys 3 FPGA board
5. Use SW2–SW0 and SW5–SW3 to select the ROM operands and SW8–SW6 to select the RAM address
6. Press and release the reset button to perform the multiplication
7. Observe the LEDs and seven-segment display to verify the result

## Results

The simulation demonstrated successful multiplication and storage of results for three test cases: 12 × 6 = 72, 14 × 13 = 182, and 0 × 14 = 0. The FPGA implementation confirmed the functionality of the system using the LEDs and seven-segment display.

The synthesized design utilized 43 slice LUTs, 85 slice registers, and 26 slices.
