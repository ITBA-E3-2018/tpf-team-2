`timescale 10us / 10us
module PosPant(h_sinc,v_sinc,h1,h0,m1,m0,s1,s0,Rout,Gout,Bout,clk);//, countH,countV, inside, test);
    input h_sinc,v_sinc,clk;
    input [3:0] h1;
    input [3:0] h0;
    input [3:0] m1;
    input [3:0] m0;
    input [3:0] s1;
    input [3:0] s0;
    output reg Rout,Gout,Bout;
    reg colorOut;
    /*output*/ reg inside;
    reg[10:0] posX;
    reg[10:0]posY;
    reg[10:0]posX1;
    reg[10:0] posY1;
    reg[10:0]despl;
    reg[3:0] num;
    wire[6:0] disp7;
    /*output*/ reg [10:0] countV;
    /*output*/ reg [10:0] countH;
    //output reg test;
    parameter HOR_min=295, HOR_max=345, VER_min=235, VER_max=244;
    parameter DH1m=295,DH1M=300, DH2m=303, DH2M=308, DH3m=313, DH3M=318, DH4m=321, DH4M=326, DH5m=331, DH5M=336, DH6m=339, DH6M = 344;

    NumTo7Seg Disp(num,disp7);


    always @(posedge clk) begin
        countH = countH+1;
        if(countH >= 640) begin
            countV = countV+1;
            countH = 0;
        end
    end

    always @ (posedge v_sinc) begin
        countV = 0;
    end

    always @ (posedge h_sinc) begin
        countH=0;
    end
    
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

        if(inside == 1) begin
            if(posX>=DH1m && posX <=DH1M) begin
                num = h1;
                despl = DH1m;
            end
            if(posX>=DH2m && posX<=DH2M) begin
                num = h0;
                despl = DH2m;
            end
            if(posX>=DH3m && posX<=DH3M) begin
                num = m1;
                despl = DH3m;
            end
            if(posX>=DH4m && posX<=DH4M) begin
                num = m0;
                despl = DH4m;
            end
            if(posX>=DH5m && posX<=DH5M) begin
                num = s1;
                despl = DH5m;
            end
            if(posX>=DH6m && posX<=DH6M) begin
                num = s0;
                despl = DH6m;
            end
            posX1 = countH-despl;
        end
        else begin
            posY1 = 9;
            posX1 = 5;
        end
        if(posY1==0)begin
            if(posX1==0 || posX1 == 4) begin
                test = 1;
                colorOut = 0;
            end
            if(posX1==1 || posX1 == 2 || posX1==3) begin
                if(disp7[6] == 1) begin
                    colorOut = 1;
                end
                else begin
                    colorOut = 0;
                end
            end
        end

        else if(posY1==1|| posY1 == 2 || posY1 == 3) begin
            if(posX1==1 || posX1 == 2 || posX1==3) begin
                colorOut = 0;
            end
            if(posX1 == 0) begin
                if(disp7[1] == 1) begin
                    colorOut = 1;
                end
                else begin
                    colorOut = 0;
                end
            end
            if(posX1 == 4) begin
                if(disp7[5] == 1) begin
                    colorOut = 1;
                end
                else begin
                    colorOut = 0;
                end
            end
        end

        else if(posY1 == 4) begin
            if(posX1 == 0 || posX1 == 4) begin
                colorOut = 0;
            end
            if(posX1 == 1 || posX1 == 2 || posX1 == 3) begin
                if(disp7[0] == 1) begin
                    colorOut= 1;
                end
                else begin
                    colorOut = 0;
                end
            end
        end

        else if(posY1 == 5 || posY1 == 6 || posY1 == 7) begin
            if(posX1 == 1 || posX1 == 2 || posX1 == 3) begin
                colorOut = 0;
            end
            if(posX1 == 0) begin 
                if(disp7[2] == 1) begin
                    colorOut = 1;
                end
                else begin
                    colorOut = 0;
                end
            end
            if(posX1 == 4)begin
                if(disp7[4]==1)begin
                    colorOut = 1;
                end
                else begin
                    colorOut = 0;
                end
            end
        end

        else if(posY1 == 8) begin
            if(posX1 == 0 || posX1 == 4) begin
                colorOut = 0;
            end
            if(posX1 == 1 || posX1 ==2 || posX1 == 3)begin
                if(disp7[3] == 1) begin
                    colorOut = 1;
                end
                else begin
                    colorOut =0;
                end
            end
        end
        else begin
            colorOut = 0;
        end

        Rout = colorOut;
        Gout = colorOut;
        Bout = colorOut;
    end


endmodule