module mem_load_wh(clk,en);
input clk;
reg [7:0] out [7:0];
reg [7:0] read [7:0];

integer j,k;
parameter n=8;

always@(posedge clk)
if(!en)
begin
i=0;
k=n;
for(j=0;j<n;j=j+1)
out[j]=1'b0;
end

else
 begin
	while(i<=n)
        @(posedge clk)
	begin
	out[i]=i*4;
	i=i+1'b1;
	$display($time, " reg_value=%0p", out);
	end

	while(k>=0)
        @(posedge clk)
	begin
	read[k]=out[k];
	k=k-1'b1;
	$display($time, " read_value=%0p", read);
	end


 end


endmodule


