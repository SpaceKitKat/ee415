`timescale 100ps/10ps
`include "freq_divider.v"

module fdivider_test();

wire    f0,f1,f2,f3,f4,f5; // frequency divisions fn: freq = clk/(2^(n+1))
reg     clk, reset;
parameter CDELAY = 10; // clock period *100ps

freq_divider dut(
         .q0(f0)      
        ,.q1(f1)
        ,.q2(f2)
        ,.q3(f3)
        ,.q4(f4)
        ,.q5(f5)
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
end
endmodule
