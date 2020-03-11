module system(
    input clk,
    input [1:0]sw,
    output dp,
    output reg [3:0]an,
    output [6:0]seg
);

wire [30:0] clkDiv;
reg  [1:0]  ledState    = 3;    // Starting 7-segment enable state with leftmost display 
reg  [3:0]  num         = 10;   // 4-bits register, starting state with A
assign      clkDiv[0]   = clk;  // Assign base clock
assign      dp          = 1;    // Making dot disappear

genvar i;
for(i=1;i<=30;i=i+1)
    clockDiv(clkDiv[i-1], clkDiv[i]);


sevenSeg(num, seg);

always @(posedge clkDiv[18])
begin        
    if(sw[0]) // If turn sw[0] on, display only one LED
    begin 
        an = 4'b1111; 
        an[ledState] = 0; 
    end
    else 
        an = 4'b0000; // Else, display all
end

always @(posedge clkDiv[24])
begin
    case (num)  // For simplicity in code, we will use case for state changing
        10: num = 12;
        12: num = 14;
        14: num = 10;
    endcase
    
    ledState = (ledState-1);
end
endmodule
    