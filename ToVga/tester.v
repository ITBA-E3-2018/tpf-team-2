`timescale 1us / 1us

module tester ();
wire clk, vsync, vDisplay, hsync, hDisplay;
reg rIn=1,gIn=1,bIn=1; //estos despues van a ser wires!!!
ClockGen myclk (clk);
Vsync myvsync (clk,vDisplay,vsync);
Hsync myhsync (clk,hDisplay,hsync);
RGB myrgb (clk,vDisplay,hDisplay,rIn,gIn,bIn,r,g,b);

initial begin
  #122880000000000;
  $finish;
end

//To use gtkwave:
  reg dummy;
  reg[8*64:0] dumpfile_path = "tester.vcd";
  initial begin
    dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
    $dumpfile(dumpfile_path);
    $dumpvars(0,tester);
  end


endmodule