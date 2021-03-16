module arbiter(clk,rst,req_0,req_1,gnt_0,gnt_1);
input clk,rst;
input req_0,req_1;
output reg gnt_0,gnt_1;

reg [1:0] ps,ns;
parameter s0=2'b00,s1=2'b01,s2=2'b10;


always@(posedge clk)
begin
if(rst) 
ps<=s0;
else 	
ps<=ns;
end

always@(clk or ps)
case(ps)
s0: begin
	if({req_0,req_1}==2'b00)
	begin ns=s0;gnt_0=1'b0;gnt_1=1'b0; end
	else if({req_0,req_1}==2'b01)
	begin ns=s1;gnt_0=1'b0;gnt_1=1'b1; end
	else if({req_0,req_1}==2'b10)
	begin ns=s2;gnt_0=1'b1;gnt_1=1'b0; end
	else
	begin ns=s2;gnt_0=1'b1;gnt_1=1'b0; end
    end

s1: begin
	if({req_0,req_1}==2'b00)
	begin ns=s0;gnt_0=1'b0;gnt_1=1'b0; end
	else if({req_0,req_1}==2'b01)
	begin ns=s1;gnt_0=1'b0;gnt_1=1'b1; end
	else if({req_0,req_1}==2'b10)
	begin ns=s2;gnt_0=1'b1;gnt_1=1'b0; end
	else
	begin ns=s2;gnt_0=1'b1;gnt_1=1'b0; end
    end

s2: begin
	if({req_0,req_1}==2'b00)
	begin ns=s0;gnt_0=1'b0;gnt_1=1'b0; end
	else if({req_0,req_1}==2'b01)
	begin ns=s1;gnt_0=1'b0;gnt_1=1'b1; end
	else if({req_0,req_1}==2'b10)
	begin ns=s2;gnt_0=1'b1;gnt_1=1'b0; end
	else
	begin ns=s2;gnt_0=1'b1;gnt_1=1'b0; end
    end

endcase

endmodule
