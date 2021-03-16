module swap_check(clk,w,r1in,r1out,r2in,r2out,r3in,r3out,done);
input clk,w;
output reg r1in,r1out,r2in,r2out,r3in,r3out;
output reg done;

parameter R1=2'b00,R2=2'b01,R3=2'b10;
reg [1:0] ps,ns;

always@(posedge clk)
begin
if(!w)
begin
ps<=R2;
//r1in = 1'b0;r1out=1'b0;r2in=1'b0;r2out=1'b0;r3in=1'b0;r3out=1'b0;
end
else
ps<=ns;
end

always@(posedge clk or posedge ps)
begin
case(ps)
R2:     begin
	ns<=R3; r2out<=1'b1; r3in<=1'b1; done<=1'b0;
	end

R3:  	begin
	ns<=R1; r3out<=1'b1; r1in<=1'b1; done<=1'b1;
	end

R1:  	begin
	ns<=R2; r1out<=1'b1; r2in<=1'b1; done<=1'b0;
	end


default: begin ns<=R2;done<=1'b0; end

endcase

end

endmodule
