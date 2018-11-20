`timescale 20000ps / 2000ps

module clock_gen_in(clk);

parameter PERIOD = 2;

output reg clk;
	 
always
	begin: CLOCK_DRIVER
		clk <= 1'b0;
		#(PERIOD/2);
		clk <= 1'b1;
		#(PERIOD/2);
	end
endmodule



module clock_50M_to_1k(clkin,clkout);

reg [14:0] counter;
output reg clkout;
input clkin
initial begin
    counter = 0;
    clkout = 0;
end

always @(posedge clkin) begin
    if (counter == 0) begin
        counter <= 24999;
        clkout <= ~clkout;
    end else begin
        counter <= counter -1;
    end
end