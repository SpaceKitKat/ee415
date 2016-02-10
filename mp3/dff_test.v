`timescale 100ps/10ps
`include "d_flipflop.v"

module dff_test();

wire    out_wire;
reg     data, clk, reset;
parameter CDELAY = 10; // clock period *100ps

d_flipflop dut(
         .q(out_wire)      
        ,.d(data)    
        ,.clk(clk)        
        ,.reset(reset)       
);

// set data to 1 and wait for two clock cycles,
// then reset. Wait for another 3 cycles before 
// setting data to 0.
// expect q to start high on first clock +edge
// then fall on 3rd +edge. Then rise on 4th 
// +edge and fall on the 6th. 
initial
begin
	data = 1'b1;
	clk = 1'b0;
	#(2*CDELAY) reset = 1'b1;
        #(CDELAY) reset = 1'b0;
	#(2*CDELAY) data = 1'b0;

end

always begin
        #(CDELAY/2) clk <= !clk;
end
endmodule
