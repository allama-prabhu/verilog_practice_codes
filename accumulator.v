module accumulator(amt,rst,clk,out_sum);
input [31:0] amt;
input rst,clk;
output reg [31:0] out_sum;

reg [31:0] temp;

always@(clk)
if(rst)
begin
temp=32'b0;out_sum=0;
end
else if(clk==1)
temp=temp+out_sum;
else
out_sum=temp;

endmodule
