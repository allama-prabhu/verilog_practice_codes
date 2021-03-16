module R4ABM2(PP,ai,b2i1);
input [7:0] ai,b2i1;
output [7:0] PP;
initial
begin
$dumpfile("R4ABM2.vcd");
$dumpvars(0,R4ABM2_tb);
end

xor x1[7:0] (PP,ai,b2i1);
endmodule
