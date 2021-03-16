module seq_gen_mealey(clk,rst,A,w,x,y,z);
input clk,rst,A;
output reg w,x,y,z;
reg [2:0] ps,ns;

parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101,s6=3'b110,s7=3'b111;

always@(posedge clk)
begin
	if(rst) 
	ps<=s0;
	else
	ps<=ns;
end

always@(ps or A)
case(ps)
s0:	begin
	if(!A)
	begin ns=s1;{w,x,y,z}=4'b1000; end
	else
	begin ns=s7;{w,x,y,z}=4'b1001; end
	end

s1:	begin
	if(!A)
	begin ns=s2;{w,x,y,z}=4'b1100; end
	else
	begin ns=s0;{w,x,y,z}=4'b1000; end
	end

s2:	begin
	if(!A)
	begin ns=s3;{w,x,y,z}=4'b0100; end
	else
	begin ns=s1;{w,x,y,z}=4'b1100; end
	end

s3:	begin
	if(!A)
	begin ns=s4;{w,x,y,z}=4'b0110; end
	else
	begin ns=s2;{w,x,y,z}=4'b0100; end
	end

s4:	begin
	if(!A)
	begin ns=s5;{w,x,y,z}=4'b0010; end
	else
	begin ns=s3;{w,x,y,z}=4'b0110; end
	end

s5:	begin
	if(!A)
	begin ns=s6;{w,x,y,z}=4'b0011; end
	else
	begin ns=s4;{w,x,y,z}=4'b0010; end
	end

s6:	begin
	if(!A)
	begin ns=s7;{w,x,y,z}=4'b0001; end
	else
	begin ns=s5;{w,x,y,z}=4'b0011; end
	end

s7:	begin
	if(!A)
	begin ns=s0;{w,x,y,z}=4'b1001; end
	else
	begin ns=s6;{w,x,y,z}=4'b0001; end
	end

endcase


endmodule
