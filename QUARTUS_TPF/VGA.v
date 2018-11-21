
module VGA (clk,rIn,gIn,bIn,vsync,hsync,r,g,b,hDisplay,vDisplay,hj,vj);
input clk,rIn,gIn,bIn;
output wire vsync, hsync,r,g,b;
output wire  vDisplay,hDisplay;
output wire [10:0] hj;
output wire [20:0] vj;

Vsync myvsync(clk, vDisplay, vsync,vj);
Hsync myhsync(clk, hDisplay, hsync,hj);
RGB myRGB (clk,vDisplay,hDisplay,rIn,gIn,bIn,r,g,b);

endmodule

/*
module VGA (clk, write_zone, count1, count2, h_sync, v_sync);

    input clk;
	 
    output reg write_zone, h_sync='b0, v_sync='b0;
    output reg [9:0] count1=0; //vertical counter
    output reg [9:0] count2=0; //horizontal counter
	 
	 parameter horizontal_resolution = 640;
	 parameter vertical_resolution = 480;

	 parameter start_horizontal_write = 140;
	 parameter finish_horizontal_write = 300;
	 parameter start_vertical_write = 206;
	 parameter finish_vertical_write = 220;
	 
	 parameter front_porch = 16, sync_pulse = 96, whole_line = 800, front_porch_v = 10, sync_pulse_v = 2,whole_frame = 525;

    
    always @(posedge clk) begin
        if (count1 <= vertical_resolution) begin //vertical part of the display
            if (count2 <= horizontal_resolution) begin //horizontal part of the display
                if ((count1 >= start_vertical_write) && (count1 <= finish_vertical_write) && (count2 >= start_horizontal_write) && (count2 <= finish_horizontal_write)) begin //zona de escritura del numero, cada numero sera de 42 de ancho por 70 de alto
                    write_zone = 'b1;
                end
                else begin
                    write_zone = 'b0;
                end
                count2 = count2 + 1;
            end
            //blank space horizontal
            else if (count2 < (horizontal_resolution + front_porch)) begin 
                //write_zone = 'b0;
                count2 = count2 + 1;
            end

            else if (count2 < (horizontal_resolution + front_porch + sync_pulse)) begin
                h_sync = 1;
                count2 = count2 + 1;
            end
            else if (count2 < (whole_line)) begin
                h_sync = 0;
                count2 = count2 + 1;
            end
            else begin
                count1 = count1 + 1;
                count2 = 0;
            end
        end
        else if (count1 < (whole_frame)) begin
            //
            //vertical blank space
            //
            if (count1 < (vertical_resolution + front_porch_v)) begin
                //write_zone = 'b0;
            end
            else if (count1 < (vertical_resolution + front_porch_v + sync_pulse_v)) begin
                v_sync = 1;
            end
            else if (count1 < whole_frame)begin
                v_sync = 0;
            end
            //
            //h_sync while in vertical blank space
            //
            if (count2 < horizontal_resolution) begin
                //write_zone = 'b0;
                count2 = count2 + 1;
            end
            else if (count2 < (horizontal_resolution + front_porch))
                count2 = count2 + 1;

            else if (count2 < (horizontal_resolution + front_porch + sync_pulse)) begin
                h_sync = 1;
                count2 = count2 + 1;
            end
            else if (count2 < whole_line) begin
                h_sync = 0;
                count2 = count2 + 1;
            end
            else begin
                count1 = count1 + 1;
                count2 = 0;
            end
        end
        //finish vertical blank space
        else begin
            count1 = 0;
            count2 = 0;
        end
    end

endmodule
*/