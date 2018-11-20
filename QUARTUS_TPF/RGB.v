module RGB (clk,vdisplay,hdisplay,rIn,gIn,bIn,r,g,b);
input clk,vdisplay,hdisplay,rIn,gIn,bIn;
output reg r,g,b;
integer i;
initial i=0;

always @(posedge(clk)) begin
    if ((vdisplay==0)&&(hdisplay==0))begin
        r=rIn;
        g=gIn;
        b=bIn;
    end
    else begin
        r=0;
        g=0;
        b=0;
    end
end

endmodule