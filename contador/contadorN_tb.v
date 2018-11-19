`include "./contadorN.v"
`include "clock.v"
`include "count2ms.v"

`timescale 1ms / 100us

module count_tb();

parameter size = 10;

wire clk;
clock_gen #(.PERIOD(2)) clk_gen(clk);
reg nr = 0;
reg enable = 0;
reg latch = 0;
wire [size-1:0] count;
wire [10:0] ms;

contadorN #(.BITS(size)) counter (
    .NEclk(clk),
    .Nreset(nr),
    .Enable(enable),
    .count(count)
);

count2ms #(.BITS(size)) millis (
    .count(count),
    .nreset(nr),
    .ms(ms),
    .latch(latch)
);

initial begin
    #1 nr = 1;
    #1 enable = 1;
    #8 nr = 0;
    #4 nr = 1;
    #2 enable = 0;
    #4 enable = 1;
end

initial begin
    #2200 $finish;
end

initial begin
    $dumpfile("counter_test.vcd");
    $dumpvars;
end

initial begin
    $display("\t\tTime\tNreset\tenable\tcount\tms");
    $monitor("%d\t%b\t%b\t%d\t%d",$time,nr,enable,count,ms);
end

endmodule