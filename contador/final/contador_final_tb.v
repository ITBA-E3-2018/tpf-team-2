`include "./contador_final.v"
`include "./clock.v"

`timescale 100us / 100us

module contador_final_tb();

// Clock Gen
wire clk;
clock_gen #(.PERIOD(10)) clk_gen(clk); // Está armado para un clock de 1ms de período o frecuencia 1kHz

// Controllable Variables
reg nr = 0;
reg enable = 0;

// Test Outputs
wire [3:0] bcd_h;
wire [3:0] bcd_min_0, bcd_min_1;
wire [3:0] bcd_s_0, bcd_s_1;
wire [3:0] bcd_ms_0, bcd_ms_1, bcd_ms_2;

contador_final contador (
    .NEclk(clk),                        // Negative-edge clock
    .Nreset(nr),                        // Not-reset
    .Enable(enable),                    // Counting Enabler
    .bcd_h(bcd_h),                      // Hours Passed Output
    .bcd_min_0(bcd_min_0),
    .bcd_min_1(bcd_min_1),              // Minutes Passed Output
    .bcd_s_0(bcd_s_0),
    .bcd_s_1(bcd_s_1),                  // Seconds Passed Output
    .bcd_ms_0(bcd_ms_0),
    .bcd_ms_1(bcd_ms_1),
    .bcd_ms_2(bcd_ms_2)                 // Milliseconds Passed Output
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
    #7200 $finish;                  // Si lo corrés vas a estar un buen rato
end

initial begin
    $dumpfile("full_test.vcd");
    $dumpvars;
end

initial begin
    $display("\t\tTime\t BCD_Out");
    $monitor("%d\t%d:%d%d:%d%d(%d%d%d)",$time,bcd_h, bcd_min_1, bcd_min_0, bcd_s_1, bcd_s_0, bcd_ms_2, bcd_ms_1, bcd_ms_0);
end

endmodule