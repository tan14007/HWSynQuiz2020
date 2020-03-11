// 7-segment encoding
//      0
//     ---
//  5 |   | 1
//     --- <--6
//  4 |   | 2
//     ---
//      3
module sevenSeg(
    input [3:0]num,
    output reg [6:0]seg
    );
always @(num)
begin
      case (num)
          4'b0001 : seg = 7'b1111101;   // 1
          4'b0010 : seg = 7'b1111011;   // 2
          4'b0011 : seg = 7'b1110111;   // 3
          4'b0100 : seg = 7'b1101111;   // 4
          4'b0101 : seg = 7'b1011111;   // 5
          4'b0110 : seg = 7'b0111111;   // 6
          4'b0111 : seg = 7'b1111000;   // 7
          4'b1000 : seg = 7'b0000000;   // 8
          4'b1001 : seg = 7'b0010000;   // 9
          4'b1010 : seg = 7'b0001000;   // A
          4'b1011 : seg = 7'b0000011;   // b
          4'b1100 : seg = 7'b1000110;   // C
          4'b1101 : seg = 7'b0100001;   // d
          4'b1110 : seg = 7'b0000110;   // E
          4'b1111 : seg = 7'b0001110;   // F
          default : seg = 7'b1111110;   // 0
      endcase
      end
     endmodule