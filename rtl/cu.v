`timescale 1ns / 1ps
module cu(
    input clk, reset,
    input [2:0] adr1, adr2,
    output reg w_rf,
    output reg [2:0] adr,
    output reg DA,
    output SA, SB,
    output [2:0] st_out,
    output reg w_ram
);
    parameter S0_idle = 3'd0,
              S1_send_adr1 = 3'd1,
              S2_send_adr2 = 3'd2,
              S3_multiply = 3'd3,
              S4_write_ram = 3'd4,
              S5_read_ram = 3'd5;
    reg [2:0] PS, NS;

    assign SA = 1'b0; // Register 0 always supplies operand A.
    assign SB = 1'b1; // Register 1 always supplies operand B.
    assign st_out = PS;

    always @(posedge clk or posedge reset) begin
        if (reset)
            PS <= S0_idle;
        else
            PS <= NS;
    end

    always @(*) begin
        NS = S0_idle;
        w_rf = 0;
        w_ram = 0;
        adr = 0;
        DA = 0;
        case (PS)
            S0_idle: NS = S1_send_adr1;
            S1_send_adr1: begin
                adr = adr1;
                w_rf = 1;
                NS = S2_send_adr2;
            end
            S2_send_adr2: begin
                adr = adr2;
                DA = 1;
                w_rf = 1;
                NS = S3_multiply;
            end
            S3_multiply: NS = S4_write_ram;
            S4_write_ram: begin
                w_ram = 1;
                NS = S5_read_ram;
            end
            S5_read_ram: NS = S5_read_ram;
            default: NS = S0_idle;
        endcase
    end
endmodule
