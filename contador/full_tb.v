`include "./contadorN.v"
`include "clock.v"
`include "count2watch.v"
`include "bin2bcd.v"

`timescale 100us / 100us

module count_tb();

parameter size = 26; // Size of Counter

// Clock Gen
wire clk;
clock_gen #(.PERIOD(10)) clk_gen(clk);

// Controllable Variables
reg nr = 0;
reg enable = 0;

//Internal Variables
wire [size-1:0] count;

// Test Outputs
wire [9:0] ms;
wire [5:0] s;
wire [5:0] min;
wire [3:0] hr;

wire [3:0] bcd_h;
wire [3:0] bcd_min_0, bcd_min_1;
wire [3:0] bcd_s_0, bcd_s_1;
wire [3:0] bcd_ms_0, bcd_ms_1, bcd_ms_2;

contadorN #(.BITS(size)) counter (
    .NEclk(clk),
    .Nreset(nr),
    .Enable(enable),
    .count(count)
);

count2watch #(.BITS(size)) watch_data (
    .count(count),
    .nreset(nr),
    .ms(ms),
    .s(s),
    .min(min),
    .hr(hr)
);

bin2bcd converter (
    .bin_h(hr), .bin_min(min), .bin_s(s), .bin_ms(ms),
    .bcd_h(bcd_h), .bcd_min_0(bcd_min_0), .bcd_min_1(bcd_min_1),
    .bcd_s_0(bcd_s_0), .bcd_s_1(bcd_s_1),
    .bcd_ms_0(bcd_ms_0), .bcd_ms_1(bcd_ms_1), .bcd_ms_2(bcd_ms_2)
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
    #72000100 $finish;
end

initial begin
    $dumpfile("full_test.vcd");
    $dumpvars;
end

initial begin
    $display("\t\tTime\tcount\t\tBin_Out \t\t BCD_Out");
    $monitor("%d\t%d\t%d:%d:%d:(%d)\t\t%d:%d%d:%d%d(%d%d%d)",$time,count,hr,min,s,ms, bcd_h, bcd_min_1, bcd_min_0, bcd_s_1, bcd_s_0, bcd_ms_2, bcd_ms_1, bcd_ms_0);
end

endmodule