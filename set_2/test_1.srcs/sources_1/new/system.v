module system(
    input clk,
    input btnL,
    output dp,
    output reg [3:0]an,
    output [6:0]seg
);

wire [30:0]clkDiv;
assign clkDiv[0] = clk;

reg [3:0]num = 0; // View sevenSeg.v for more information about 7-segment display states
assign dp = 1;

genvar i;
for(i=1;i<=30;i=i+1)
    clockDiv(clkDiv[i-1], clkDiv[i]);


sevenSeg(num, seg);
assign dp = 1;

always @(posedge clkDiv[18])
begin
    if(btnL) an = 4'b1111;
    else an = 4'b0000;
end

always @(posedge clkDiv[23])
    num = (num + 1) % 6;

endmodule
    