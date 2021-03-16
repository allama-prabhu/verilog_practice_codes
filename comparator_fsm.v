//xy as a input and comparing those bit.
module comparator_fsm(x,y,out,clk,rst);
input x,y,clk,rst;
output reg [1:0] out;

parameter s0=2'b00,s1=2'b01,s2=2'b10;
reg [1:0] ps,ns;

always@(posedge clk)
begin
if(rst)
ps<=s0;
else
ps<=ns;
end

always@(ps)
case(ps)
s0: begin
	if(({x,y}==2'b00) || ({x,y}==2'b11))
	begin ns = s0; out = 2'b00 ; end
	else if({x,y} == 2'b10)
	begin ns = s1; out = 2'b10 ; end
	else if({x,y} == 2'b01)
	begin ns = s2; out = 2'b01 ; end
	else
	begin ns = s0; out = 2'b00 ; end
    end

s1: begin
	if(({x,y}==2'b00) || ({x,y}==2'b11) || ({x,y}==2'b01) || ({x,y}==2'b10) )
	begin ns = s1; out = 2'b10 ; end
    end

s2: begin
	if(({x,y}==2'b00) || ({x,y}==2'b11) || ({x,y}==2'b01) || ({x,y}==2'b10) )
	begin ns = s2; out = 2'b01 ; end
    end

endcase

endmodule
