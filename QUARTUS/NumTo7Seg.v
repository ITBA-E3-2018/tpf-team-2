module NumTo7Seg (num,out);//RECIBE UN VALOR BINARIO DE 4 BITS Y LO TRANSFORMA A UN DISPLAY DE 7 SEGMENTOS
    input [3:0] num;
    output reg[6:0] out;
    parameter ZERO='b0000,ONE='b0001,TWO='b0010,THREE='b0011,FOUR='b0100,FIVE='b0101,SIX='b0110,SEVEN='b0111,EIGHT='b1000,NINE='b1001;
    always @(num) begin
        case (num)//7 segmentos = 'b (A B C D E F G)
          ZERO: out='b1111110;
          ONE:  out='b0110000;
          TWO:  out='b1101101;
          THREE:    out='b1111001;
          FOUR: out='b0110011;
          FIVE: out='b1011011;
          SIX:  out='b1011111;
          SEVEN:    out='b1110000;
          EIGHT:    out='b1111111;
          NINE: out='b1110011;  
          default: out = 'b0000000;
        endcase
    end
endmodule