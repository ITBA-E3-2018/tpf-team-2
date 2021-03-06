module bin2bcd (
    bin_h,                              // Hours Passed input
    bin_min,                            // Minutes Passed input
    bin_s,                              // Seconds Passed input
    bin_ms,                             // Milliseconds Passed input
    bcd_h_0, bcd_h_1,                   // Hours Passed Output
    bcd_min_0, bcd_min_1 ,              // Minutes Passed Output
    bcd_s_0, bcd_s_1,                   // Seconds Passed Output
    bcd_ms_0, bcd_ms_1, bcd_ms_2        // Milliseconds Passed Output
);

// Defining I/O
input [6:0] bin_h;
input [5:0] bin_min;
input [5:0] bin_s;
input [9:0] bin_ms;

output [3:0] bcd_h_0, bcd_h_1;
output [3:0] bcd_min_0, bcd_min_1;
output [3:0] bcd_s_0, bcd_s_1;
output [3:0] bcd_ms_0, bcd_ms_1, bcd_ms_2;

// Defining Data Types

wire [6:0] bin_h;
wire [5:0] bin_min;
wire [5:0] bin_s;
wire [9:0] bin_ms;

reg [3:0] bcd_h_0, bcd_h_1;
reg [3:0] bcd_min_0, bcd_min_1;
reg [3:0] bcd_s_0, bcd_s_1;
reg [3:0] bcd_ms_0, bcd_ms_1, bcd_ms_2;

// Code

always @(*) begin
    bcd_h_0 <= bin_h % 10;
    bcd_h_1 <= (bin_h/10) % 10;

    bcd_min_0 <= bin_min % 10;
    bcd_min_1 <= (bin_min / 10) % 10;

    bcd_s_0 <= bin_s % 10;
    bcd_s_1 <= (bin_s / 10) % 10;

    bcd_ms_0 <= bin_ms % 10;
    bcd_ms_1 <= (bin_ms / 10) % 10;
    bcd_ms_2 <= (bin_ms /100) % 10;
end

endmodule