/*module PosPant(h_sinc,v_sinc,h1,h0,m1,m0,s1,s0,Rout,Gout,Bout,clk);//, countH,countV, inside, test);
    input h_sinc,v_sinc,clk;
    input [3:0] h1;
    input [3:0] h0;
    input [3:0] m1;
    input [3:0] m0;
    input [3:0] s1;
    input [3:0] s0;
    output reg Rout,Gout,Bout;
    reg colorOut;
    reg inside;
    reg[10:0] posX;
    reg[10:0]posY;
    reg[10:0]posX1;
    reg[10:0] posY1;
    reg[10:0]despl;
    reg[3:0] num;
    wire[6:0] disp7;
    reg [10:0] countV;
    reg [10:0] countH;
    parameter RETARDO_H = 48, RETARDO_V=33;
    parameter HOR_min=(295+RETARDO_H), HOR_max=(345+RETARDO_H), VER_min=(235+RETARDO_V), VER_max=(244+RETARDO_V);
    parameter DH1min=(295+RETARDO_H),DH1M=(300+RETARDO_H), DH2min=(303+RETARDO_H), DH2M=(308+RETARDO_H),
        DH3min=(313+RETARDO_H), DH3M=(318+RETARDO_H), DH4min=(321+RETARDO_H), DH4M=(326+RETARDO_H), DH5min=(331+RETARDO_H),
        DH5M=(336+RETARDO_H), DH6min=(339+RETARDO_H), DH6M = (344+RETARDO_H);

		  
    NumTo7Seg Disp(num,disp7);


    always @(posedge clk) begin
        countH = countH+1;
		  if(countH >= 800) begin
				countH=0;
				countV = countV+1;
		  end
		  if(countV >= 525) begin
				countV = 0;
				countH=0;
		  end
    end
    //always @ (negedge v_sinc) begin
    //   countV = 0;
    //end

    //always @ (negedge h_sinc) begin
    //    countH = 0;
    //    countV = countV+1;
    //end
    
    always @(*) begin
        if(countV >= VER_min && countV <= VER_max) begin
            if(countH >= HOR_min && countH <= HOR_max)begin
                inside = 1;
            end
            else begin
                inside = 0;
            end
        end
        else begin
            inside = 0;
        end

        posX = countH;
        posY = countV;
        posY1 = countV-VER_min;
        if(inside == 0) begin
            colorOut = 0;
        end

        else if(inside == 1) begin
            if(posX >= DH1min && posX <= DH1M) begin
                num = h1;
                despl = DH1min;
            end
            else if(posX >= DH2min && posX <= DH2M) begin
                num = h0;
                despl = DH2min;
            end
            else if(posX >= DH3min && posX <= DH3M) begin
                num = m1;
                despl = DH3min;
            end
            else if(posX >= DH4min && posX <= DH4M) begin
                num = m0;
                despl = DH4min;
            end
            else if(posX >= DH5min && posX <= DH5M) begin
                num = s1;
                despl = DH5min;
            end
            else if(posX >= DH6min && posX <= DH6M) begin
                num = s0;
                despl = DH6min;
            end
				else begin
					despl = 0;
				end
            posX1 = countH-despl;
        end
        else begin
            posX1 = 5;
        end
        if(posY1==0)begin
            if(posX1==0 || posX1 == 4) begin
                colorOut = 0;
            end
            else if(posX1==1 || posX1 == 2 || posX1==3) begin
                //if(disp7[6] == 1) begin
                    colorOut = 1;
                //end
                //else begin
                //    colorOut = 0;
                //end
            end
        end

        else if(posY1==1|| posY1 == 2 || posY1 == 3) begin
            if(posX1==1 || posX1 == 2 || posX1==3) begin
                colorOut = 0;
            end
            else if(posX1 == 0) begin
                //if(disp7[1] == 1) begin
                    colorOut = 1;
                //end
                //else begin
                //    colorOut = 0;
                //end
            end
            else if(posX1 == 4) begin
                //if(disp7[5] == 1) begin
                    colorOut = 1;
                //end
                //else begin
                //    colorOut = 0;
                //end
            end
        end

        else if(posY1 == 4) begin
            if(posX1 == 0 || posX1 == 4) begin
                colorOut = 0;
            end
            else if(posX1 == 1 || posX1 == 2 || posX1 == 3) begin
                //if(disp7[0] == 1) begin
                    colorOut= 1;
                //end
                //else begin
                //    colorOut = 0;
                //end
            end
        end

        else if(posY1 == 5 || posY1 == 6 || posY1 == 7) begin
            if(posX1 == 1 || posX1 == 2 || posX1 == 3) begin
                colorOut = 0;
            end
            else if(posX1 == 0) begin 
                //if(disp7[2] == 1) begin
                    colorOut = 1;
                //end
                //else begin
                //    colorOut = 0;
                //end
            end
            else if(posX1 == 4)begin
               // if(disp7[4]==1)begin
                    colorOut = 1;
               // end
               // else begin
               //     colorOut = 0;
               // end
            end
        end

        else if(posY1 == 8) begin
            if(posX1 == 0 || posX1 == 4) begin
                colorOut = 0;
            end
            else if(posX1 == 1 || posX1 ==2 || posX1 == 3)begin
                //if(disp7[3] == 1) begin
                    colorOut = 1;
                //end
                //else begin
                //    colorOut =0;
                //end
            end
        end
        else begin
            colorOut = 0;
        end

        Rout = colorOut;
        Gout = colorOut;
        Bout = colorOut;
    end




endmodule*/

module PosPant(h_Disp,v_Disp,h1,h0,m1,m0,s1,s0,Rout,Gout,Bout,clk);

	input h_Disp,v_Disp,clk;
   input [3:0] h1;
   input [3:0] h0;
   input [3:0] m1;
   input [3:0] m0;
   input [3:0] s1;
   input [3:0] s0;
   output reg Rout,Gout,Bout;
   reg colorOut;
   integer posX;
   integer posY;
   integer posX1;
   integer posY1;
   //reg[3:0] num;
   wire[6:0] disp1;
	wire[6:0] disp2;
	wire[6:0] disp3;
	wire[6:0] disp4;
	wire[6:0] disp5;
	wire[6:0] disp6;
   reg [10:0] countV;
   reg [10:0] countH;
	integer num;
	
	//reg [6:0] digitOne,digitTwo,digitThree,digitFour,digitFive,digitSix;
	
	NumTo7Seg Disp(h1,disp1);
	NumTo7Seg Disp2(h0,disp2);
	NumTo7Seg Disp3(m1,disp3);
	NumTo7Seg Disp4(m0,disp4);
	NumTo7Seg Disp5(s1,disp5);
	NumTo7Seg Disp6(s0,disp6);
	
	parameter OFFSETNUM = 20, OFFSET_INIT_X = 400, OFFSET_INIT_Y=217, BLOCK_SIZE = 5;
	
	always @(posedge clk or posedge h_Disp or posedge v_Disp) begin
        if(h_Disp == 1) begin
				posX = 0;
				posY = posY+1;
			end
			if(v_Disp == 1)
				posY = 0;
			if(clk)
				posX = posX+1;
    end
	 
	 always  @(*) begin
			num = 0;
            colorOut = 0;

            //Primer digito
			if((posX >= (OFFSET_INIT_X+BLOCK_SIZE*1+OFFSETNUM*num)) && 
            (posX <= (OFFSET_INIT_X+BLOCK_SIZE*4+OFFSETNUM*num)) && 
            (posY >= OFFSET_INIT_Y+BLOCK_SIZE*0) && (posY <= OFFSET_INIT_Y+BLOCK_SIZE*1) && 
            (disp1[6]==1))
				colorOut = 1;
            

			Rout = colorOut;
			Gout = colorOut;
			Bout = colorOut;
			
	 end
	 
	
	
endmodule