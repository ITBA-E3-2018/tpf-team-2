module Vsync (clk, vDisplay, vsync);
input clk;
output reg vDisplay, vsync;
parameter V_SYNCPULSE=2, V_BPORCH=33, V_DISPLAY=480, V_FPORCH=10, V_SYNC=525;
parameter H_SYNC=800;
integer i;
initial i=0;

always @(posedge(clk)) begin
//Determination of vsync signal
    if(i<((V_SYNC * H_SYNC)-1)) begin
        if(i<(V_SYNCPULSE * H_SYNC))begin
            vsync=1; //ver si mandar asi o si mandar 1'b1;
        end
        else begin
            vsync=0;
        end
        //////
        if((i>((V_SYNCPULSE+V_BPORCH)*H_SYNC))&&(i<((V_SYNCPULSE+V_BPORCH+V_DISPLAY)*H_SYNC)))begin
            vDisplay=0; //significa que estoy en zona display
        end
        else begin
            vDisplay=1;     //significa que no estoy en zona display
        end
        //////
        i=i+1;
    end
    else if (i==((V_SYNC * H_SYNC)-1)) begin
    //$display ("hola");
        vsync=0;
        vDisplay=1;  
        i=0;
    end
end

endmodule