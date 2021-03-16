module seq_gen(clk,rst,w,x,y,z);
input clk,rst;
output w,x,y,z;
reg w,x,y,z;
reg [2:0] ps,ns;
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110,s7=3'b111;

always@(posedge clk)
begin
if(rst)
ps<=s0;
else
ps<=ns;
end

always@(ps or rst)
case(ps)
s0: begin ns = s1; {w,x,y,z} = 4'b1000; end
s1: begin ns = s2; {w,x,y,z} = 4'b1100; end
s2: begin ns = s3; {w,x,y,z} = 4'b0100; end
s3: begin ns = s4; {w,x,y,z} = 4'b0110; end
s4: begin ns = s5; {w,x,y,z} = 4'b0010; end
s5: begin ns = s6; {w,x,y,z} = 4'b0011; end
s6: begin ns = s7; {w,x,y,z} = 4'b0001; end
s7: begin ns = s0; {w,x,y,z} = 4'b1001; end
endcase

endmodule
