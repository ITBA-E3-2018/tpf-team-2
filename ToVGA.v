
module ToVGA (clk,hsync,vsync,rIn, gIn,bIn,r,g,b);
input wire clk,rIn, gIn, bIn;
output reg hsync,vsync,r,g,b;
reg pantalla[0:479] x [0:639];
integer i,j;
initial i=0,j=0;

//El periodo de V_SYNC es "525 pixels" y el de H_SYNC es "800 pixels"
parameter V_SYNCPULSE=2, V_BPORCH=33, V_DISPLAY=480, V_FPORCH=10, V_SYNC=525;
parameter H_SYNCPULSE=96, H_BPORCH=48, H_DISPLAY=640, H_FPORCH=16, H_SYNC=800;

//V_SYNC abarca todo lo siguiente en el siguiente orden:
//V_SYNCPULSE:  black - vsync 0
//V_BPORCH:     black - vsync 1
//V_DISPLAY:    colors - vsync 1
//V_FPORCH:     black - vsync 1

always @(posedge(clk)) begin
//Determination of vsync signal
    if(i<((V_SYNC * H_SYNC)-1)) begin
        if(i<(V_SYNCPULSE * H_SYNC))begin
            vsync=1; //ver si mandar asi o si mandar 1'b1;
            r=0;
            g=0;
            v=0;
            //Determination of hsync signal
            if(j<(H_SYNC - 1)) begin
                if(j<H_SYNCPULSE)begin
                    hsync=1;
                end
                else begin
                    hsync=0;
                end
                j=j+1;
            end
            else if (j==(H_SYNC - 1)) begin
                hsync=0;
                j=0;
            end
            ///////////////////////////////
        end
        else begin
            vsync=0;
            //Determination of hsync signal
            if(j<(H_SYNC - 1)) begin
                if(j<H_SYNCPULSE)begin
                    hsync=1;
                end
                else begin
                    hsync=0;
                end
                j=j+1;
            end
            else if (j==(H_SYNC - 1)) begin
                hsync=0;
                j=0;
            end
            ///////////////////////////////
            //Determination of r,g and b signals
            if((vsync==0)&&(hsync==0))begin
            r=rIn;
            g=gIn;
            b=bIn;
            end
        end
        i=i+1;
    end
    else if (i==((V_SYNC * H_SYNC)-1)) begin
        vsync=0;
        i=0;
    end









//Determination of hsync signal
    if(j<(H_SYNC - 1)) begin
        if(j<H_SYNCPULSE)begin
            hsync=1;
        end
        else begin
            hsync=0;
        end
        j=j+1;
    end
    else if (j==(H_SYNC - 1)) begin
        hsync=0;
        j=0;
    end


end






        ////////////////////////////////////////////////////////////////
        /*
            vsync=0;   
            //if((i>=V_SYNCPULSE)&&(i<(V_SYNCPULSE + V_BPORCH)))begin
            if(i<((V_SYNCPULSE + V_BPORCH)*H_SYNC))begin
            r=0;
            g=0;
            v=0;
            end
            //elseif((i>=(V_SYNCPULSE + V_BPORCH))&&(i<(V_SYNCPULSE + V_BPORCH + V_DISPLAY)) begin
            else if(i<((V_SYNCPULSE + V_BPORCH + V_DISPLAY)*H_SYNC))begin

            end
            else if(i<((V_SYNCPULSE + V_BPORCH + V_DISPLAY + V_FPORCH)*H_SYNC))begin
            r=0;
            g=0;
            v=0; 
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
*/


//parameter ADDRESS, HFPORCH=16, HBPORCH=48, HSYNC=800, VSYNC=40n; //posicion de memoria donde arranca a estar guardada la pantalla que voy a mostrar.
//VER que poner en address, fporch, bporch



endmodule