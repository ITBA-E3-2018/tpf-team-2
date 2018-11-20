module VGA (clk,rIn,gIn,bIn,vsync,hsync,r,g,b);
input clk,rIn,gIn,bIn;
output wire vsync, hsync,r,g,b;
wire vDisplay,hDisplay;

Vsync myvsync(clk, vDisplay, vsync);
Hsync myhsync(clk, hDisplay, hsync);
RGB myRGB (clk,vDisplay,hDisplay,rIn,gIn,bIn,r,g,b);

endmodule