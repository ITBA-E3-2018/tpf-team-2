module PosPant(h_sinc,v_sinc,h1,h0,m1,m0,s1,s0,colorOut,clk);
    input h_sinc,v_sinc,clk;
    input [3:0] h1;
    input [3:0] h0;
    input [3:0] m1;
    input [3:0] m0;
    input [3:0] s1;
    input [3:0] s0;
    output colorOut;
    reg inside, posX, posY;
    reg despl;
    reg[3:0] num;
    reg[7:0] disp7;
    reg [10:0] countV;
    reg [10:0] countH;
    parameter HOR_min=295, HOR_max=345, VER_min=235, VER_max=244;
    parameter DH1m=295,DH1M=300, DH2m=303, DH2M=308, DH3m=313, DH3M=318, DH4m=321, DH4M=326, DH5m=331, DH5M=336, DH6m=339, DH6M = 344;
    parameter ON=1,OFF=0;

    numTo7Seg Disp(num,disp7);


    always @(posedge clk) begin
        countH = countH+1;
        countV = countV+1;
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
                inside = ON;
            end
            else begin
                inside = OFF;
            end
        end
        else begin
            inside = OFF;
        end

        posX = countH - HOR_min;
        posY = countV - VER_min;

        if(inside == ON) begin
            if(posX>=DH1m && posX <=DH1M) begin
                num = h1;
                despl = DH1m;
            end
            if(posX>=DH2m && posX>=DH2M) begin
                num = h0;
                despl = DH2m;
            end
            if(posX>=DH3m && posX>=DH3M) begin
                num = m1;
                despl = DH3m;
            end
            if(posX>=DH4m && posX>=DH4M) begin
                num = m0;
                despl = DH4m;
            end
            if(posX>=DH5m && posX>=DH5M) begin
                num = s1;
                despl = DH5m;
            end
            if(posX>=DH6m && posX>=DH6M) begin
                num = s0;
                despl = DH6m;
            end
        end
        posY = posY-VER_min;
        posX = posX-despl;
        if(posY==0)begin
            if(posX==0 || posX == 4) begin
                colorOut = 0;
            end
            if(posX==1 || posX == 2 || posX==3) begin
                if(disp7[7] == 1) begin
                    colorOut = 1;
                end
                else begin
                    colorOut = 0;
                end
            end
        end

        if(posY==1 || posY == 2 || posY == 3) begin
            if(posX==1 || posX == 2 || posX==3) begin
                colorOut = 0;
            end
            if(posX == 0) begin
                if(disp7[1] == 1) begin
                    colorOut = 1;
                end
                else begin
                    colorOut = 0;
                end
            end
            if(posX == 4) begin
                if(disp7[6] == 1) begin
                    colorOut = 1;
                end
                else begin
                    colorOut = 0;
                end
            end
        end

        if(posY == 4) begin
            if(posX == 0 || posX == 4) begin
                colorOut == 0;
            end
            if(posX == 1 || posX == 2 || posX == 3) begin
                if(disp7[0] == 1) begin
                    colorOut= 1;
                end
                else begin
                    colorOut = 0;
                end
            end
        end

        if(posY = 5 || posY == 6 || posY == 7) begin
            if(posX == 1 || posX == 2 || posX == 3) begin
                colorOut == 0;
            end
            if(posX == 0) begin 
                if(disp7[3] == 1) begin
                    colorOut = 1;
                end
                else begin
                    colorOut = 0;
                end
            end
            if(posX == 4)begin
                if(disp7[5]==1)begin
                    colorOut = 1;
                end
                else begin
                    colorOut = 0;
                end
            end
        end

        if(posY == 8) begin
            if(posX == 0 || posX == 4) begin
                colorOut = 0;
            end
            if(posX == 1 || posX ==2 || posX == 3)begin
                if(disp7[4] == 1) begin
                    colorOut = 1;
                end
                else begin
                    colorOut =0;
                end
            end
        end
    end


endmodule