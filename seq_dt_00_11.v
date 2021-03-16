module seq_dt_00_11(clk,rst,w,z);
input clk,rst,w;
output reg z;
parameter s0=2'b00, s1=2'b01, s2=2'b10;
reg [1:0] ps,ns;
always@(posedge clk)
	begin
	if(!rst)
	ps<=s0;
	else
	ps<=ns;
	end

always@(ps or w)

case(ps)
s0: begin
	ns = w?s2:s1;
	z  = w?0:0;
    end

s1: begin
	ns = w?s2:s1;
	z  = w?0:1;
    end

s2: begin
	ns = w?s2:s1;
	z  = w?1:0;
    end

endcase

endmodule

