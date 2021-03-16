//code for that FAT exam question.
module swap(clk,w,r1in,r1out,r2in,r2out,r3in,r3out,done);
input clk,w;
input r1in,r1out,r2in,r2out,r3in,r3out;
output reg done;

parameter R1=2'b00,R2=2'b01,R3=2'b10;
reg [1:0] ps,ns;

always@(posedge clk)
begin
if(!w)
ps<=R2;
else
ps<=ns;
end

always@(posedge clk or posedge ps)
begin
case(ps)
R2:  begin
	if(r2out & r3in)
	begin ns<=R3;done<=1'b0; end
	else
	begin ns<=R2;done<=1'b0; end
     end

R3:  begin
	if(r3out & r1in)
	begin ns<=R1;done<=1'b1; end
	else
	begin ns<=R3;done<=1'b0; end
     end


R1:  begin
	if(r1out & r2in)
	begin ns<=R2;done<=1'b0; end
	else
	begin ns<=R1;done<=1'b0; end
     end

default: begin ns<=R2;done<=1'b0; end

endcase

end

endmodule

