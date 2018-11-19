module count2ms(
    count,      // Number of pulses counted
    latch,      // Enabling latching the output
    nreset,     // Resetting the output to 000
    ms          // Output in ms
);

parameter BITS = 4;

// Defining I/O
input [BITS-1 : 0] count;
input latch, nreset;

output [10:0] ms;

// Defining Data Types
wire [BITS-1 : 0] count;
wire latch, nreset;

reg [10:0] ms;

// Code

always @(*) begin
    ms <= count % 1000;
end

endmodule