`timescale 1ns/10ps
`include "counter_8.v"

module counter_8_tb();

wire    [15:0]  out_wire;
reg     up_down, clk, reset;

counter_8 dut(
        .out(out_wire)    ,  // Output of the counter
        .up_down(up_down)  ,  // up_down control for counter
        .clk(clk)      ,  // clock input
        .reset(reset)       // reset input
);

initial
begin
        reset = 1'b0;
        up_down = 1'b1;
        clk = 1'b0;
        #10 reset = 1'b1;
        #15 reset = 1'b0;
end

always begin
        #5 clk = !clk;
end
endmodule