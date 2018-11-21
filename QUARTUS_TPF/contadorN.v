module contadorN(
    NEclk,      // Negative-edge clock
    reset,     // Not-reset
    Enable,     // Counting Enabler
    count       // Count output
);

parameter BITS = 29; // Parámetro para el tamaño del contador

// Defining I/O
input NEclk, reset, Enable;

output reg [BITS-1 : 0] count;

// Defining Data Types
wire NEclk, reset, Enable;

//reg [BITS-1 : 0] count;

initial count=0;

// Code

always @ (negedge NEclk or negedge reset) begin
    if(reset == 1'b1) begin
        count <= 0;
    end
    else begin
        if (Enable == 1'b1) begin
            count <= count + 1;
        end 
    end
end

/*
always @ (negedge NEclk) begin
    count <= count + 1;
end*/
endmodule