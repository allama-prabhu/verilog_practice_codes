module mem_load_wh(clk,en);
input clk,en;
reg [7:0] out [7:0];
reg [7:0] read [7:0];
integer i;
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
	$display($time, " reg_value=%0p", out); //%0p -> to display an array with proper sizing
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

//Test bench for loading memory using while loop

module mem_load_wh_tb();
reg clk,en;

mem_load_wh ml1(.clk(clk),.en(en));

initial
begin clk=1'b0;en=1'b0; end

always #5 clk=~clk;

initial
begin #15 en=1'b1; end

initial #1000 $stop;

endmodule


