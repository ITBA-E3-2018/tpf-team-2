`include "./contadorN.v"
`include "clock.v"
`timescale 1ms / 100us

module count_tb();

parameter size = 8;

wire clk;
clock_gen #(.PERIOD(6)) clk_gen(clk);
reg nr = 0;
reg enable = 0;
wire [size-1:0] count;

contadorN #(.BITS(size)) counter (
    .NEclk(clk),
    .Nreset(nr),
    .Enable(enable),
    .count(count)
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
    #40 $finish;
end

initial begin
    $dumpfile("counter_test.vcd");
    $dumpvars;
end

initial begin
    $display("\t\tTime\tClk\tNreset\tenable\tcount");
    $monitor("%d\t%b\t%b\t%b\t%d",$time,clk,nr,enable,count);
end

endmodule