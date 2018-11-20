`include "./contadorN.v"
`include "clock.v"
`include "count2watch.v"

`timescale 100us / 100us

module count_tb();

parameter size = 26;

wire clk;
clock_gen #(.PERIOD(10)) clk_gen(clk);
reg nr = 0;
reg enable = 0;
wire [size-1:0] count;
wire [9:0] ms;
wire [5:0] s;
wire [5:0] min;
wire [3:0] hr;

contadorN #(.BITS(size)) counter (
    .NEclk(clk),
    .Nreset(nr),
    .Enable(enable),
    .count(count)
);

initial begin
    #10 nr = 1;
    #10 enable = 1;
    #80 nr = 0;
    #40 nr = 1;
    #20 enable = 0;
    #40 enable = 1;
end

initial begin
    #100000 $finish;
end

initial begin
    $dumpfile("counter_test.vcd");
    $dumpvars;
end

initial begin
    $display("\t\tTime\tcount");
    $monitor("%d\t%d",$time,count);
end

endmodule