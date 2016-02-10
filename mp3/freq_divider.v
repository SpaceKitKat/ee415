`timescale 100ps/10ps
`ifndef _FREQ_DIVIDER
`define _FREQ_DIVIDER
//-----------------------------------------------------
module freq_divider(
q,    // output clk divisions (2-64)
clk,  // clock input
reset // reset input
);
//------------Input Ports--------------- 
input clk, reset;
//------------Output Ports-------------- 
output [5:0] q; //divided clock outputs
wire [4:0] wq;  //output of each dff
//------------Flipflops-----------------
d_flipflop FF2(q[0],!q[0],clk,reset);
assign wq[0] = q[0];
d_flipflop FF4(q[1],!q[1],wq[0],reset);
assign wq[1] = q[1];
d_flipflop FF8(q[2],!q[2],wq[1],reset);
assign wq[2] = q[2];
d_flipflop FF16(q[3],!q[3],wq[2],reset);
assign wq[3] = q[3];
d_flipflop FF32(q[4],!q[4],wq[3],reset);
assign wq[4] = q[4];
d_flipflop FF64(q[5],!q[5],wq[4],reset);

endmodule 
`endif
