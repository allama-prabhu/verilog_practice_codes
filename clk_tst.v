module clk_tst;
reg clk,sclk;
reg [3:0] n,nn;
always #2 clk = ~clk;

task s1_clk;
input clk;
input [3:0] nn;
inout [3:0] n;
output sclk;
begin
	if(n!=4'h0)
		begin
		n = n-1'b1;
		sclk = 1'b0;
		end
	else
		begin
		n = nn;
		sclk = 1'b1;
		end
end
endtask

always@(negedge clk)
s1_clk(clk,n,nn,sclk);
initial
begin
	clk = 1'b0;nn = 4'h1; n = nn;
	#45 $stop;
end

initial
$monitor($time, "n=%0d, clk = %0b,sclk = %0b