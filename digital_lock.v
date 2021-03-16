module digital_lock(clk,clr,b_in,out);
input clk,clr;
input b_in;
output reg out;

parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110;
reg [2:0] ps,ns;

always@(negedge clk)
begin
if(!clr)
begin
ps<=s0;
out=1'b0;
end
else
ps<=ns;
end

always@(ps or clr)
begin
case(ps)
s0: ns <= (b_in==1'b0)?s0:s1;
s1: ns <= (b_in==1'b0)?s0:s2;
s2: ns <= (b_in==1'b0)?s3:s0;
s3: ns <= (b_in==1'b0)?s0:s4;
s4: ns <= (b_in==1'b0)?s5:s0;
s5: ns <= (b_in==1'b0)?s6:s0;
s6: ns <= s6;
endcase
end

always@(ps)
case(ps)
s0,s1,s2,s3,s4,s5: out = 1'b0;
s6: out = 1'b1;
endcase


endmodule

