module vending_MC(rst,clk,coin,P,C);
input clk,rst;
input [1:0] coin;
output reg P,C;

reg [2:0] ps,ns;
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;

always@(posedge clk)
	begin
	if(rst)
	ps<=s0;
	else
	ps<=ns;
	end

always@(ps or coin)
case(ps)
s0:	begin
	if(coin==2'b01)
	begin ns=s4;P=1'b0;C=1'b0; end //you missed entering the P and C outputs while writing the code
	else if(coin==2'b10)
	begin ns=s1;P=1'b0;C=1'b0; end
	else
	begin ns=s0;P=1'b0;C=1'b0; end
	end

s1:	begin
	if(coin==2'b01)
	begin ns=s2;P=1'b1;C=1'b0; end
	else if(coin==2'b10)
	begin ns=s3;P=1'b1;C=1'b1; end
	else
	begin ns=s1;P=1'b0;C=1'b0; end
	end

s2:	begin
	if(coin==2'b01)
	begin ns=s4;P=1'b0;C=1'b0; end
	else if(coin==2'b10)
	begin ns=s1;P=1'b0;C=1'b0; end
	else
	begin ns=s0;P=1'b0;C=1'b0; end
	end

s3:	begin
	if(coin==2'b01)
	begin ns=s4;P=1'b0;C=1'b0; end
	else if(coin==2'b10)
	begin ns=s1;P=1'b0;C=1'b0; end
	else
	begin ns=s0;P=1'b0;C=1'b0; end
	end

s4:	begin
	if(coin==2'b01)
	begin ns=s1;P=1'b0;C=1'b0; end
	else if(coin==2'b10)
	begin ns=s2;P=1'b1;C=1'b0; end
	else
	begin ns=s4;P=1'b0;C=1'b0; end
	end

default: begin ns=s0;P=1'b0;C=1'b0; end

endcase
endmodule
