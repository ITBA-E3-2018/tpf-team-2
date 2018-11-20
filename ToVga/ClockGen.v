`timescale 1us / 1us

module ClockGen(clk);

parameter PERIOD = 10;

output reg clk;
	 
always
	begin: CLOCK_DRIVER
		clk <= 1'b0;
		#(PERIOD/2);
		clk <= 1'b1;
		#(PERIOD/2);
	end

endmodule
