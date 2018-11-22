module PosPant(h_Disp,v_Disp,h1,h0,m1,m0,s1,s0,Rout,Gout,Bout,clk, posX, posY1);

	input h_Disp,v_Disp,clk;
   input [3:0] h1;
   input [3:0] h0;
   input [3:0] m1;
   input [3:0] m0;
   input [3:0] s1;
   input [3:0] s0;
   output reg Rout,Gout,Bout;
   reg colorOut, colorOut2; //1 AGREGO COLOROUT2
   input[10:0]  posX;
   input [20:0] posY1;
   integer posX1;
   integer posY;
   wire[6:0] disp1;
	wire[6:0] disp2;
	wire[6:0] disp3;
	wire[6:0] disp4;
	wire[6:0] disp5;
	wire[6:0] disp6;
	integer num;

	
	NumTo7Seg Disp(h1,disp1);
	NumTo7Seg Disp2(h0,disp2);
	NumTo7Seg Disp3(m1,disp3);
	NumTo7Seg Disp4(m0,disp4);
	NumTo7Seg Disp5(s1,disp5);
	NumTo7Seg Disp6(s0,disp6);
	
	parameter OFFSETNUM = 20, OFFSET_INIT_X = 200, OFFSET_INIT_Y=340, BLOCKSIZE = 5, BLOCK_SIZE = 5;
	 
	 always  @(*) begin
			num = 0;
			posY = posY1/640;
			num = 0;
         colorOut = 0;
			colorOut2=0; //4AGREGO ESTO

            //Primer digito
			if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*0) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*1) && 
            (disp1[6]==1))
				colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*5+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*1) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*4) && 
            (disp1[5]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*5+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*5) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*8) && 
            (disp1[4]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*8) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*9) && 
            (disp1[3]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*0+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*5) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*8) && 
            (disp1[2]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*0+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*1) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*4) && 
            (disp1[1]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*4) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*5) && 
            (disp1[0]==1))
                colorOut = 1;
					 
				//Segundo Digito
				
				num = 1;
				
				if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*0) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*1) && 
            (disp2[6]==1))
				colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*5+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*1) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*4) && 
            (disp2[5]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*5+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*5) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*8) && 
            (disp2[4]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*8) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*9) && 
            (disp2[3]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*0+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*5) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*8) && 
            (disp2[2]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*0+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*1) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*4) && 
            (disp2[1]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*4) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*5) && 
            (disp2[0]==1))
                colorOut = 1;
					 
				//Tercer Digito
				
				num = 2;
				
				if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*0) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*1) && 
            (disp3[6]==1))
				colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*5+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*1) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*4) && 
            (disp3[5]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*5+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*5) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*8) && 
            (disp3[4]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*8) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*9) && 
            (disp3[3]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*0+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*5) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*8) && 
            (disp3[2]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*0+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*1) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*4) && 
            (disp3[1]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*4) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*5) && 
            (disp3[0]==1))
                colorOut = 1;
					 
				//Cuarto Digito
				
				num = 3;
				
				if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*0) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*1) && 
            (disp4[6]==1))
				colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*5+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*1) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*4) && 
            (disp4[5]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*5+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*5) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*8) && 
            (disp4[4]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*8) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*9) && 
            (disp4[3]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*0+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*5) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*8) && 
            (disp4[2]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*0+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*1) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*4) && 
            (disp4[1]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*4) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*5) && 
            (disp4[0]==1))
                colorOut = 1;
            
				
				//Quinto Digito
				
				num=4;
				
				if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*0) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*1) && 
            (disp5[6]==1))
				colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*5+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*1) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*4) && 
            (disp5[5]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*5+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*5) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*8) && 
            (disp5[4]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*8) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*9) && 
            (disp5[3]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*0+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*5) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*8) && 
            (disp5[2]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*0+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*1) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*4) && 
            (disp5[1]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*4) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*5) && 
            (disp5[0]==1))
                colorOut = 1;
					 
				//Sexto Digito
				
				num = 5;
				
				if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*0) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*1) && 
            (disp6[6]==1))
				colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*5+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*1) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*4) && 
            (disp6[5]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*5+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*5) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*8) && 
            (disp6[4]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*8) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*9) && 
            (disp6[3]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*0+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*5) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*8) && 
            (disp6[2]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*0+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*1) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*4) && 
            (disp6[1]==1))
                colorOut = 1;
            if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num+BLOCK_SIZE*num*5)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*4) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*5) && 
            (disp6[0]==1))
                colorOut = 1;
					 
					//puntos 
					 
				if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*12+OFFSETNUM*1)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*13+OFFSETNUM*1)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*2) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*4))begin
                colorOut = 1;
					 colorOut2 = 1; //2 agrego esta linea
					 end
				if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*12+OFFSETNUM*1)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*13+OFFSETNUM*1)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*5) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*7))begin
                colorOut = 1;
					 colorOut2 = 1; //2 agrego esta linea
					 end
					 
				if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*30+OFFSETNUM*1)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*31+OFFSETNUM*1)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*2) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*4))begin
                colorOut = 1;
					 colorOut2 = 1; //2 agrego esta linea
					 end
				if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*30+OFFSETNUM*1)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*31+OFFSETNUM*1)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*5) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*7))begin
                colorOut = 1;
					 colorOut2 = 1; //2 agrego esta linea
					 end
					 
				
					 
			if(colorOut == 1) begin
				Rout = colorOut;
				Gout = colorOut;
				Bout = 0;
				if(colorOut2 == 1) begin // 3 agrego todo este if
				Rout = 1;
				Gout = 0;
				Bout = 1;
				colorOut2=0;
				end
			end
			else begin
				Rout = 0;
				Gout = 0;
				Bout = 1;//5 cambio por un cero
			end

			
			
	 end
endmodule