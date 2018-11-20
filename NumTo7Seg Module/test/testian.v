module testbench();
    reg [3:0]num;
    wire [6:0]out;
    NumTo7Seg mytest(num,out);

    initial begin
        #1
      num = 'b0000;
      #1
      num = 'b0001;
      #1
      num = 'b1001;
      #1
      num = 'b1100;
      #1
      $finish;
    end

    //reg dummy;
    
    initial begin
    //dummy = $value$plusargs("VCD_PATH=%s", "output.vcd");
    $dumpfile("output.vcd");
    $dumpvars(0,testbench);
    end
endmodule