`timescale 100ps/10ps
`ifndef _FREQ_DIVIDER
`define _FREQ_DIVIDER
`include "d_flipflop.v"
//-----------------------------------------------------
module freq_divider(
q0,    // output clk divisions (2-64)
q1,
q2,
q3,
q4,
q5,
clk,  // clock input
reset // reset input
);
//------------Input Ports--------------- 
input clk, reset;
//------------Output Ports-------------- 
output q0,q1,q2,q3,q4,q5; //divided clock outputs
//------------Flipflops-----------------
wire q0b,q1b,q2b,q3b,q4b,q5b; 
assign q0b = ~q0;
assign q1b = ~q1;
assign q2b = ~q2;
assign q3b = ~q3;
assign q4b = ~q4;
assign q5b = ~q5;

d_flipflop FF2(q0,q0b,clk,reset);
d_flipflop FF4(q1,q1b,q0b,reset);
d_flipflop FF8(q2,q2b,q1b,reset);
d_flipflop FF16(q3,q3b,q2b,reset);
d_flipflop FF32(q4,q4b,q3b,reset);
d_flipflop FF64(q5,q5b,q4b,reset);

endmodule 
`endif
