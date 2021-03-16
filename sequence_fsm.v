module sequence_fsm(a,clk,rst,w,x,y,z);
input a,clk,rst;
output reg w,x,y,z;
parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100, s5=3'b101, s6=3'b110, s7=3'b111;
reg [2:0] ps, ns;
always @ (posedge clk)
begin
if (!rst)
ps<=s0;
else
ps<=ns;
end

always @ (ps or a)
begin
if (a==1'b0)
case(ps)
s0: begin
{w,x,y,z}=4'b1000;
ns=s1;
end
s1: begin
{w,x,y,z}=4'b1100;
ns=s2;
end
s2: begin
{w,x,y,z}=4'b0100;
ns=s3;
end
s3: begin
{w,x,y,z}=4'b0110;
ns=s4;
end
s4: begin
{w,x,y,z}=4'b0010;
ns=s5;
end
s5: begin
{w,x,y,z}=4'b0011;
ns=s6;
end
s6: begin
{w,x,y,z}=4'b0001;
ns=s7;
end
s7: begin
{w,x,y,z}=4'b1001;
ns=s0;
end
endcase

else
case(ps)
s0: begin
{w,x,y,z}=4'b1001;
ns=s7;
end
s1: begin
{w,x,y,z}=4'b1000;
ns=s0;  
end
s2: begin
{w,x,y,z}=4'b1100;
ns=s1;
end
s3: begin
{w,x,y,z}=4'b0100;
ns=s2;
end
s4: begin
{w,x,y,z}=4'b0110;
ns=s3;
end
s5: begin
{w,x,y,z}=4'b0010;
ns=s4;
end
s6: begin
{w,x,y,z}=4'b0011;
ns=s5;
end
s7: begin
{w,x,y,z}=4'b0001;
ns=s6;
end
endcase

end
endmodule