module fsm_seq(x,clk,rst_n,z);
input x,clk,rst_n;
output z;
reg z;

parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
reg [1:0] ps,ns;
always@(posedge clk)
begin
if(!rst_n)
ps<=s0;
else
ps<=ns;
end

always@(ps or x)
case(ps)
s0: begin
	ns = x?s0:s1;
	z  = x?0:0;
    end

s1: begin
	ns = x?s2:s1;
	z  = x?0:0;
    end

s2: begin
	ns = x?s3:s1;
	z  = x?0:0;
    end

s3: begin
	ns = x?s0:s1;
	z  = x?0:1;
    end

endcase

endmodule
