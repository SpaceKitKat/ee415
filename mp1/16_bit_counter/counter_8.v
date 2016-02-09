`timescale 1ns/10ps
`ifndef _COUNTER_8
`define _COUNTER_8
//-----------------------------------------------------
module counter_8   (
out      ,  // Output of the counter
up_down  ,  // up_down control for counter
clk      ,  // clock input
reset       // reset input
);
//------------Input Ports--------------
input up_down, clk, reset;
//------------Internal Variables--------
output reg [15:0] out;
//-------------Code Starts Here-------
always @(posedge clk)
if (reset) begin // active high reset
    out <= 8'b0 ;
end else if (up_down) begin
    out <= out + 1'b1;
end else begin
    out <= out - 1'b1;
end

endmodule
`endif
