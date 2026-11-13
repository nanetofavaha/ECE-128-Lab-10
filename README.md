# ECE 128 Lab 10 whole-system multiplier

The controller reads two Lab 9 ROM words into the hint's register file,
multiplies with the Lab 8 combinational multiplier, and writes and reads back
the product in Lab 9 RAM. See PRELAB.md and level1.svg for the diagrams and timing.
The Level 1 layout follows slide 21 of ECE128_L8_ROM_RAM.pdf.

## Run the simulation

Open vivado/Lab10.xpr. Select Run Simulation → Run Behavioral Simulation.
The simulation top is Multiplier_top_tb. It uses three explicit examples,
with expected answers in comments: 72, 182, and 0. Inspect result after
75 ns, 175 ns, and 275 ns respectively, once the clocked update has settled.
Expand uut to add state, rom_addr, rom_data, a, b, product and w_ram to the waveform.
The short testbench ends with $finish and does not print PASS messages.

From GitHub, choose Code → Download ZIP and extract the entire ZIP. Open vivado/Lab10.xpr in Vivado 2026.1 with Artix-7 support. Keep rtl, sim, and constraints beside the vivado folder. The project already sets both tops and includes the pin constraints; no manual source setup is needed.

## Program the Basys 3

The synthesis top is lab10_board_top. The board uses the 100 MHz clock and
the center button for reset. SW2–SW0 select operand A, SW5–SW3 select operand B,
and SW8–SW6 select the RAM address. LD7–LD0 show binary RAM readback and the
Lab 7 display modules show the same value in decimal.

Set all switches before pressing and releasing reset. Reset clears RAM.
The controller runs once and then stays in Read RAM. Keep the switches stable
throughout the demo. For 12 × 6 at RAM address 0, turn on SW0 and SW4 only.
Expect LD6 and LD3 on (hex 48), and the display to show 0072.

Open Hardware Manager → Open Target → Auto Connect → Program Device, then
select the lab10_board_top.bit file produced by Generate Bitstream in Vivado.
The pin assignments are based on Digilent's Basys-3-Master.xdc.

## Files and report

- rtl/: core, controller, register file, copied Lab 7–9 modules, and board top.
- sim/: one simple testbench. No memory data file is needed for the case ROM.
- constraints/: Basys 3 pin assignments and clock.
- reports/: actual synthesis/implementation utilization, timing and DRC.
- GitHub_Submission/: source copies and instructions for the group upload.

For the report, use the prelab diagrams, real simulation waveform screenshots,
actual board photos, utilization figures, and your group's own contribution
chart. The worksheet's “Real car scenario” and “each modeling method” are
not explained for this multiplier; confirm the intended comparison with the TA.
Compare the core and board design at the same synthesis stage; the board's
occupied slices come from implementation. Do not infer physical testing from
bitstream generation.
