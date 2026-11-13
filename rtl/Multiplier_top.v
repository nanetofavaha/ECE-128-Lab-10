`timescale 1ns / 1ps
module Multiplier_top(
    input clk, reset,
    input [2:0] addr1_ROM, addr2_ROM, addr_RAM,
    output [7:0] result
);
    wire [2:0] rom_addr, state;
    wire [3:0] rom_data, a, b;
    wire [7:0] product;
    wire w_rf, w_ram, DA, SA, SB;

    cu control (.clk(clk), .reset(reset), .adr1(addr1_ROM), .adr2(addr2_ROM),
                .w_rf(w_rf), .adr(rom_addr), .DA(DA), .SA(SA), .SB(SB),
                .st_out(state), .w_ram(w_ram));
    ROM rom (.ROM_data(rom_data), .ROM_addr(rom_addr));
    RF operands (.A(a), .B(b), .SA(SA), .SB(SB), .D(rom_data),
                 .DA(DA), .W(w_rf), .rst(reset), .clk(clk));
    multiplier_comb multiply (.a(a), .b(b), .p(product));
    MEM ram (.i_clk(clk), .i_rst(reset), .i_addr(addr_RAM),
             .i_write_data(product), .i_write_en(w_ram), .o_read_data(result));
endmodule
