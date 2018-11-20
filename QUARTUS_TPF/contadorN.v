module contadorN(
    NEclk,      // Negative-edge clock
    Nreset,     // Not-reset
    Enable,     // Counting Enabler
    count       // Count output
);

parameter BITS = 29; // Parámetro para el tamaño del contador

// Defining I/O
input NEclk, Nreset, Enable;

output [BITS-1 : 0] count;

// Defining Data Types
wire NEclk, Nreset, Enable;

reg [BITS-1 : 0] count;

// Code
always @ (negedge NEclk or Nreset) begin
    if(Nreset == 1'b0) begin
        count <= 0;
    end
    else begin
        if (Enable == 1'b1) begin
            count <= #1 count + 1;
        end else begin
            count <= #1 count;
        end
    end
end

endmodule
