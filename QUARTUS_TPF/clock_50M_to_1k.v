module clock_50M_to_1k(clkin,clkout);

reg [14:0] counter;
output reg clkout;
input clkin;
initial counter =0;
initial clkout = 0;

always @(posedge clkin) begin
    if (counter == 0) begin
        counter <= 24999;
        clkout <= ~clkout;
    end 
    else begin
        counter <= counter -1;
    end
end
endmodule