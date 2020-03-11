module clockDiv(in, out);
input in;
output reg out = 0;
always @(posedge in) out = ~out;
endmodule