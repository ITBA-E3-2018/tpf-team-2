`include "count2watch.v"

`timescale 100us / 100us

module watch_tb();

parameter size = 26;


// Testable Variables
reg nr = 0;
reg enable = 0;
reg [size-1:0] count;


// Test Outputs
wire [9:0] ms;
wire [5:0] s;
wire [5:0] min;
wire [3:0] hr;

count2watch #(.BITS(size)) watch_data (
    .count(count),
    .nreset(nr),
    .ms(ms),
    .s(s),
    .min(min),
    .hr(hr)
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
    #10 count = 1100;       // 1s 100ms
    #10 count = 7200000;    // 2h 0m 0s 0ms
    #10 count = 123548;     // 0h 2m 3s 548ms
end

initial begin
    #100000 $finish;
end

initial begin
    $dumpfile("watch_test.vcd");
    $dumpvars;
end

initial begin
    $display("\t\tTime\tcount\t\tOutput");
    $monitor("%d\t%d\t%d:%d:%d:(%d)",$time,count,hr,min,s,ms);
end

endmodule