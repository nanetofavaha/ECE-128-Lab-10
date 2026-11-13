`timescale 1ns / 1ps
module lab10_board_top(
    input clk, reset,
    input [8:0] sw,
    output [7:0] led,
    output [3:0] anode,
    output [6:0] cathode,
    output dp
);
    wire [7:0] result;
    wire [15:0] digits;
    wire display_ready;
    reg [7:0] previous_result;

    Multiplier_top core (.clk(clk), .reset(reset),
                         .addr1_ROM(sw[2:0]), .addr2_ROM(sw[5:3]),
                         .addr_RAM(sw[8:6]), .result(result));
    assign led = result;
    assign dp = 1'b1;

    // Start decimal conversion when the RAM readback changes.
    always @(posedge clk) begin
        if (reset)
            previous_result <= 0;
        else
            previous_result <= result;
    end

    Bin2BCD convert (.clk(clk), .reset(reset),
                    .en(result != previous_result), .bin_in({4'd0, result}),
                    .rdy(display_ready), .bcd_out(digits));
    multi_segment_driver display (.clk(clk), .reset(reset), .bcd_in(digits),
                                  .anode(anode), .cathode(cathode));
endmodule
