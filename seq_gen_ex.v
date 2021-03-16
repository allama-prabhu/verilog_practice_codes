module seq_gen_ex(clk,rst,w,seq);
input clk,rst,w;
output reg [3:0] seq;

parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
reg [1:0] ps,ns; 

always@(posedge clk)
begin
if(rst)
ps<=s0;
else
ps<=ns;
end

//using the same 4 different states here and operating at two different conditions.
always@(ps)
begin

if(w==1'b0)
begin
case(ps)
	s0: begin ns = s1; seq = 4'b1000; end
	s1: begin ns = s2; seq = 4'b1001; end
	s2: begin ns = s3; seq = 4'b1010; end
	s3: begin ns = s0; seq = 4'b1100; end
endcase
end

else 
begin
case(ps)
	s0: begin ns = s1; seq = 4'b0011; end
	s1: begin ns = s2; seq = 4'b0110; end
	s2: begin ns = s3; seq = 4'b0101; end
	s3: begin ns = s0; seq = 4'b1010; end
endcase
end

end

endmodule


