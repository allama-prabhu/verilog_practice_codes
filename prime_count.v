module prime_count(clk,rst,count);
input clk,rst;
output reg [3:0] count;
parameter m = 15;
integer i,j,n,prime;

always@(posedge clk)
begin
if(rst)
count <= 4'b0;
else
begin
for(i=1;i<m;i=i+1)
	begin
	n=i;
	for(j=2;j<n;j=j+1)
		begin
		if(n%j==0)
		prime <= 1'b0;
		else
		prime <= 1'b1;
		end
	if(prime==1'b1)
	count <= count + 1'b1;
	else
	count <= count;
	
	end
end
end

endmodule
