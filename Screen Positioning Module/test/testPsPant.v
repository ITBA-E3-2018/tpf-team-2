`timescale 10us / 10us
module testPsPAnt();
    reg h_sinc,v_sinc;
    reg [3:0] h1,h0,m1,m0,s1,s0;
    wire Rout,Gout,Bout,clk,inside;
    wire[10:0] counth,countv;
    wire test;


    PosPant testbench(h_sinc,v_sinc,h1,h0,m1,m0,s1,s0,Rout,Gout,Bout,clk,counth,countv,inside,test);
    clock_gen myClock(clk);

    initial begin
        //counth = 0;
        //countv = 0;
        h_sinc = 1;
        v_sinc = 1;
        h1 = 'b1000;
        h0 = 'b1000;
        m1 = 'b1000;
        m0 = 'b1000;
        s1 = 'b1000;
        s0 = 'b1000;
        #1
        h_sinc = 0;
        v_sinc = 0;
        #1000000
        $finish;
    end

 //   always @ (posedge clk) begin
 //       counth = counth+1;
 //       if(counth == 640) begin
 //           countv = countv+1;
 //           counth = 0;    
 //       end
 //   end

    initial begin
        $dumpfile("testwaves.vcd");
        $dumpvars(0,testPsPAnt);
    end


endmodule
