
module ToVGA (clk,hsync,vsync,r,g,b);
input wire clk;
output wire hsync,vsync,r,g,b;
reg pantalla[0:479] x [0:639];
integer i,j;
initial i=0,j=0;

//El periodo de V_SYNC es "525 pixels" y el de H_SYNC es "800 pixels"
parameter V_DISPLAY=480, V_FPORCH=10, V_BPORCH=33, V_SYNCPULSE=2, V_SYNC=525;
parameter H_DISPLAY=640, H_FPORCH=16, H_BPORCH=48, H_SYNCPULSE=96, H_SYNC=800;

//V_SYNC abarca todo lo siguiente en el siguiente orden:
//V_SYNCPULSE:  black - vsync 0
//V_BPORCH:     black - vsync 1
//V_DISPLAY:    colors - vsync 1
//V_FPORCH:     black - vsync 1

always @(posedge(clk)) begin
    if(i<V_SYNC) begin
        if(i<V_SYNCPULSE)begin
            vsync=0; //ver si mandar asi o si mandar 1'b0;
            r=0;
            g=0;
            v=0;
            //ver hsync
        end
        else begin
            vsync=1;
            
            //if((i>=V_SYNCPULSE)&&(i<(V_SYNCPULSE + V_BPORCH)))begin
            if(i<(V_SYNCPULSE + V_BPORCH))begin
            r=0;
            g=0;
            v=0;
            end
            //elseif((i>=(V_SYNCPULSE + V_BPORCH))&&(i<(V_SYNCPULSE + V_BPORCH + V_DISPLAY)) begin
            else if(i<(V_SYNCPULSE + V_BPORCH + V_DISPLAY))begin

            end
            else if(i<(V_SYNCPULSE + V_BPORCH + V_DISPLAY + V_FPORCH))begin

            end
            else begin
            r=0;
            g=0;
            v=0;               
            end



            ////////////////////// SEGUIR DESDE ACA
            r=0;
            g=0;
            v=0;
            //ver hsync
        end       
        else if(i<V_DISPLAY)begin
            vsync=
        //hsync <= 1'b0;
           // if(j<H_DISPLAY)begin

           // end
        end
    i=i+1;
    end
    else begin
        i=0;
        //y agregar aca que se manda por el wire de cada señal
    end
end

always
	begin: CLOCK_DRIVER
		clk <= 1'b0;
		#(PERIOD/2);
		clk <= 1'b1;
		#(PERIOD/2);
	end

//parameter ADDRESS, HFPORCH=16, HBPORCH=48, HSYNC=800, VSYNC=40n; //posicion de memoria donde arranca a estar guardada la pantalla que voy a mostrar.
//VER que poner en address, fporch, bporch



endmodule