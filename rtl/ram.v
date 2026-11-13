`timescale 1ns / 1ps
// Lecture slide 11, widened to eight bits per word for Lab 9.
module MEM(i_clk, i_rst, i_write_en, i_addr, i_write_data, o_read_data);
    input i_clk, i_rst, i_write_en;
    input [2:0] i_addr;
    input [7:0] i_write_data;
    output reg [7:0] o_read_data;

    reg [7:0] mem [0:7]; // Eight locations, each holding eight bits.

    always @(posedge i_clk) begin
        if (i_rst) begin
            mem[0] <= 8'd0;
            mem[1] <= 8'd0;
            mem[2] <= 8'd0;
            mem[3] <= 8'd0;
            mem[4] <= 8'd0;
            mem[5] <= 8'd0;
            mem[6] <= 8'd0;
            mem[7] <= 8'd0;
            o_read_data <= 8'd0; // Explicit output reset, added to the slide.
        end else begin
            if (i_write_en)
                mem[i_addr] <= i_write_data;
            else
                o_read_data <= mem[i_addr];
        end
    end
endmodule
