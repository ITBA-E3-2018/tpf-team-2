`include "./contadorN.v"
`include "./count2watch.v"
`include "./bin2bcd.v"

module contador_final (
    NEclk,                              // Negative-edge clock
    Nreset,                             // Not-reset
    Enable,                             // Counting Enabler
    bcd_h_1, bcd_h_0,                   // Hours Passed Output
    bcd_min_1, bcd_min_0,               // Minutes Passed Output
    bcd_s_1, bcd_s_0,                   // Seconds Passed Output
    bcd_ms_0, bcd_ms_1, bcd_ms_2        // Milliseconds Passed Output
);

parameter size = 29;

// Defining I/O
input NEclk, Nreset, Enable;

output [3:0] bcd_h_0, bcd_h_1;
output [3:0] bcd_min_0, bcd_min_1;
output [3:0] bcd_s_0, bcd_s_1;
output [3:0] bcd_ms_0, bcd_ms_1, bcd_ms_2;

// Defining Data Types
wire NEclk, Nreset, Enable;

wire [3:0] bcd_h_0, bcd_h_1;
wire [3:0] bcd_min_0, bcd_min_1;
wire [3:0] bcd_s_0, bcd_s_1;
wire [3:0] bcd_ms_0, bcd_ms_1, bcd_ms_2;

// Defining Internal Variables/Wires

wire [size-1:0] count;                  // Counter to time unit splitter

wire [9:0] ms;
wire [5:0] s;
wire [5:0] min;
wire [6:0] hr;                          // Binary Data to BCD Data

// Code

contadorN #(.BITS(size)) counter (
    .NEclk(NEclk),
    .Nreset(Nreset),
    .Enable(Enable),
    .count(count)
);

count2watch #(.BITS(size)) watch_data (
    .count(count),
    .nreset(Nreset),
    .ms(ms),
    .s(s),
    .min(min),
    .hr(hr)
);

bin2bcd converter (
    .bin_h(hr), .bin_min(min), .bin_s(s), .bin_ms(ms),
    .bcd_h_0(bcd_h_0), .bcd_h_1(bcd_h_1),
    .bcd_min_0(bcd_min_0), .bcd_min_1(bcd_min_1),
    .bcd_s_0(bcd_s_0), .bcd_s_1(bcd_s_1),
    .bcd_ms_0(bcd_ms_0), .bcd_ms_1(bcd_ms_1), .bcd_ms_2(bcd_ms_2)
);

endmodule