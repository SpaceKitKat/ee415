timescale 1ns/10ps
`include "d_flipflop.v"

module dff_test();

wire    out_wire;
reg     data, clk, reset;
parameter CDELAY = 5

d_flipflop dut(
         .q(out_wire)      
        ,.d(data)    
        ,.clk(clk)        
        ,.reset(reset)       
);

initial
begin
        reset = 1'b0;
        data = 1'b1;
        clk = 1'b0;
        #10 reset = 1'b1;
        #15 reset = 1'b0;
end

always begin
        #(CDELAY) clk = !clk;
end
endmodule
