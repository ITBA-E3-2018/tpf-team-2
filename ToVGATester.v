`timescale 100us / 100us

module ToVGATester ();

wire clk; 
reg r,g,b;
integer i;
ClockGen myclock (clk);
ToVGA myToVGA(clk,r,g,b,hsync,vsync,rout,gout,vout)

initial w=r=2,g=2,b=2;

initial begin
  #640;
  $finish;
end

always @(posedge(clk)) begin
    if (r==2)begin
        r=1;
        g=1;
        b=1;
    end
    else begin
        r=2;
        g=2;
        b=2;
    end
end

//To use gtkwave:
  reg dummy;
  reg[8*64:0] dumpfile_path = "toVGAtester.vcd";
  initial begin
    dummy = $value$plusargs("VCD_PATH=%s", dumpfile_path);
    $dumpfile(dumpfile_path);
    $dumpvars(0,ToVGATester);
  end

endmodule