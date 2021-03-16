module R4ABM1(PP,b2i,b2im1,b2i1,ai);
input b2i,b2im1,b2i1;
input [7:0] ai;
output [7:0]PP;

initial
begin
$dumpfile("R4ABM1.vcd");
$dumpvars(0,R4ABM1_tb);
end

wire [7:0] w2;
wire [7:0] w1;

xor x2[7:0](w1,b2i,b2im1);
xor x1[7:0] (w2,ai,b2i1);
and a1[7:0](PP,w1,w2);
endmodule

