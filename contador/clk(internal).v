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

module clock_50M_to_25M(clkin,clkout);

reg counter;
output reg clkout;
input clkin
initial begin
    counter = 0;
    clkout = 0;
end

always @(posedge clkin) begin
    if (counter == 0) begin
        counter <= 1;
        clkout <= ~clkout;
    end else begin
        counter <= counter -1;
    end
end

