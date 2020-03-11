module system(
    input clk,
    input [1:0]sw,
    output dp,
    output reg [3:0]an,
    output [6:0]seg
);

wire [30:0]clkDiv;
assign clkDiv[0] = clk;

genvar i;
for(i=1;i<=30;i=i+1)
    clockDiv(clkDiv[i-1], clkDiv[i]);

reg [6:0]clkSelect = 24;
assign targetClk = clkDiv[clkSelect];

reg [1:0]ledState = 3;
reg [3:0]num = 10;
reg [5:0]ct=4;
reg [3:0]num0,num1,num2,num3;
sevenSeg(num, seg);
assign dp = 1;
always @(posedge clkDiv[18])
begin
if(sw[0]) begin an = 4'b1111; an[ledState] = 0; end
else an = 4'b0000;
end
always @(posedge targetClk)  begin
case (num)
10: num = 12;
12: num = 14;
14: num = 10;
endcase
ledState = (ledState-1);
end

endmodule
    