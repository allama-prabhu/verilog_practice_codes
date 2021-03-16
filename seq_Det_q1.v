module seq_Det_q1(in,z,clk,rst);
input in,clk,rst;
output reg z;

parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101;
reg [2:0] ps,ns;

always@(posedge clk or posedge rst)
begin
if(rst)
ps<=s0;
else
ps<=ns;
end

always@(ps or in)
case(ps)
s0:	begin
	ns = in ? s1 : s0;
	z  = in ? 0  : 0;
	end

s1:	begin
	ns = in ? s2 : s0;
	z  = in ? 0  : 0;
	end

s2:	begin
	ns = in ? s2 : s3;
	z  = in ? 0  : 0;
	end

s3:	begin
	ns = in ? s4 : s0;
	z  = in ? 0  : 0;
	end

s4:	begin
	ns = in ? s1 : s5;
	z  = in ? 0  : 1;
	end

s5:	begin
	ns = in ? s1 : s0;
	z  = in ? 0  : 0;
	end
	
endcase



endmodule

