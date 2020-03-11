module system(
    input clk,
    input btnC,
    output dp,
    output reg [3:0]an,
    output [6:0]seg
);

wire [30:0]clkDiv;
assign clkDiv[0] = clk;

reg [3:0]num = 1;
reg [2:0]ledState = 0;
reg [2:0]nextLedState = 0;
reg [5:0]clkSelect = 25;
assign dp = 1;

genvar i;
for(i=1;i<=30;i=i+1)
    clockDiv(clkDiv[i-1], clkDiv[i]);


sevenSeg(num, seg);
assign dp = 1;

always @(posedge clkDiv[18])
begin
    case(ledState)
    0: an = 4'b1111;
    1: an = 4'b0111;
    2: an = 4'b0011;
    3: an = 4'b0001;
    4: an = 4'b0000;
    endcase
    
    if(nextLedState == ledState + 1 || (ledState == 0 && nextLedState == 1)) // check wheter reset button is pressed to reset or counter is counting up
        ledState = nextLedState;
    
    if(btnC)
    begin
        clkSelect = 27;
        ledState = 0;
    end
 
end

always @(posedge clkDiv[clkSelect])
begin
    if(ledState < 4)
        nextLedState = (ledState + 1);
     
end

endmodule
    