`ifndef _DFF_V
`define _DFF_V
`timescale 100ps/10ps
//-----------------------------------------------------
module dff_v   (
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

