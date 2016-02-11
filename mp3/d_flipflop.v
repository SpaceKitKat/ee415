`timescale 100ps/10ps
`ifndef _D_FLIPFLOP
`define _D_FLIPFLOP
//-----------------------------------------------------
module d_flipflop   (
q,     // Output signal 
d,     // Data input
clk,   // clock input
reset // reset input
);
//------------Input Ports-------------- 
input d, clk, reset;
//------------Internal Variables--------
output q;
reg q;
//-------------Code Starts Here-------
always @(posedge clk)
if (reset) begin // active high reset
  q <= 0;
end else begin
  q <= d;
end

endmodule 
`endif
