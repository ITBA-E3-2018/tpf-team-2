module contadorN(
    NEclk,      // Negative-edge clock
    Nreset,     // Not-reset
    Enable,     // Counting Enabler
    count       // Count output
);

parameter MSB = 0;

// Defining I/O
input NEclk, Nreset, Enable;

output [MSB:0] count;

// Defining Data Types
wire NEclk, Nreset, Enable;

reg [MSB:0] count;

endmodule