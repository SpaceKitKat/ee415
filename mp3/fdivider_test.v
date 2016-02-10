`timescale 100ns/10ps
`include "freq_divider.v"

module fdivider_test();

wire    [5:0]fdiv; // frequency divisions: freq = clk/(2^(i+1))
reg     clk, reset;
parameter CDELAY = 10; // clock period *100ps

freq_divider dut(
         .q(fdiv)      
        ,.clk(clk)        
        ,.reset(reset)       
);

initial
begin
	clk = 1'b0;
	#(2*CDELAY) reset = 1'b1;
        #(CDELAY) reset = 1'b0;

end

always begin
        #(CDELAY/2) clk <= !clk;
	//clk2 = clk2 ^ clk; // get GHz, yo
end
endmodule
