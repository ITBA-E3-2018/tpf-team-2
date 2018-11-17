module ToVGA (clk,hsync,vsync,r,g,b);
input wire clk;
output wire hsync,vsync,r,g,b;
parameter ADDRESS, FPORCH=5, BPORCH=5, HSYNC, VSYNC=40n; //posicion de memoria donde arranca a estar guardada la pantalla que voy a mostrar.
//VER que poner en address, fporch, bporch



endmodule