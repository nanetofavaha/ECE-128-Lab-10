`timescale 1ns / 1ps
module Multiplier_top_tb;
    reg clk, reset;
    reg [2:0] addr1_ROM, addr2_ROM, addr_RAM;
    wire [7:0] result;

    Multiplier_top uut (.clk(clk), .reset(reset), .addr1_ROM(addr1_ROM),
                        .addr2_ROM(addr2_ROM), .addr_RAM(addr_RAM),
                        .result(result));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset = 1;
        addr1_ROM = 1; addr2_ROM = 2; addr_RAM = 0;
        #20; reset = 0; // 12 x 6 = 72, stored at address 0.

        #80; reset = 1;
        addr1_ROM = 7; addr2_ROM = 6; addr_RAM = 7;
        #20; reset = 0; // 14 x 13 = 182, stored at address 7.

        #80; reset = 1;
        addr1_ROM = 0; addr2_ROM = 7; addr_RAM = 3;
        #20; reset = 0; // 0 x 14 = 0, stored at address 3.

        #80; $finish;
    end
endmodule
