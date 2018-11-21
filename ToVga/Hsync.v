module Hsync (clk, hDisplay, hsync);
input clk;
output reg hDisplay, hsync;
parameter H_SYNCPULSE=96, H_BPORCH=48, H_DISPLAY=640, H_FPORCH=16, H_SYNC=800;
integer i;
initial i=0;

always @(posedge(clk)) begin
//Determination of vsync signal
    if(i<(H_SYNC-1)) begin
        if(i<H_SYNCPULSE)begin
            hsync=1; //ver si mandar asi o si mandar 1'b1;
        end
        else begin
            hsync=0;
        end
        //////
        if((i>(H_SYNCPULSE+H_BPORCH))&&(i<(H_SYNCPULSE+H_BPORCH+H_DISPLAY)))begin
            hDisplay=0; //significa que estoy en zona display
        end
        else begin
            hDisplay=1;     //significa que no estoy en zona display
        end
        //////
        i=i+1;
    end
    else if (i==(H_SYNC-1)) begin
    //$display ("chau");
        hsync=0;
        hDisplay=1;  
        i=0;
    end
end

endmodule