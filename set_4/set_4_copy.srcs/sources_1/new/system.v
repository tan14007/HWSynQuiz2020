module system(
    input clk,
    input btnD,
    output dp,
    output reg [3:0]an,
    output [6:0]seg
);

wire [30:0]clkDiv;
assign clkDiv[0] = clk;

reg [31:0]curNum = 123;
reg [4:0]curAddNum = 4;
reg [3:0]num = 0;
reg [2:0]ledState = 0;
reg [5:0]clkSelect = 25;
assign dp = 1;

genvar i;
for(i=1;i<=30;i=i+1)
    clockDiv(clkDiv[i-1], clkDiv[i]);


sevenSeg(num, seg);
assign dp = 1;

always @(posedge clkDiv[18])
begin
    an = 4'b1111;
    an[ledState] = 0;
    
    case(ledState)
        0: num = curNum%10;
        1: num = (curNum/10)%10;
        2: num = (curNum/100)%10;
        3: num = curNum/1000;
    endcase
    
    ledState = (ledState+1)%4;
    
    if(btnD) clkSelect = 27;
    else clkSelect = 25;
 
end

always @(posedge clkDiv[clkSelect])
begin
    if(curAddNum <= 9) curNum = ((curNum*10)+curAddNum)%10000;
    else if(curNum != 1920) curNum = ((curNum*100)+curAddNum)%10000;
    
    if(curAddNum <= 19) curAddNum = curAddNum + 1;
end

endmodule
    