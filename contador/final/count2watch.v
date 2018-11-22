module count2watch(
    count,      // Number of pulses counted
    nreset,     // Resetting the output to 000
    ms,         // Output in ms
    s,          // Output in s
    min,        // Output in min
    hr          // Output in hr
);

parameter BITS = 4;

// Defining I/O
input [BITS-1 : 0] count;
input nreset;

output [9:0] ms;
output [5:0] s;
output [5:0] min;
output [6:0] hr;

// Defining Data Types
wire [BITS-1 : 0] count;
wire nreset;

reg [9:0] ms;
reg [5:0] s;
reg [5:0] min;
reg [6:0] hr;

// Code

always @(*) begin
    ms <= count % 1000;
    s <= (count/1000) % 60;
    min <= (count/1000/60) % 60;
    hr <= (count/1000/60/60) % 100;
end

endmodule