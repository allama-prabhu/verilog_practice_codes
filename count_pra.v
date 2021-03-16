//this is an example of continuous procedural assignment which makes use of assign statements.
module count_pra(count,pst,n,clk,rst);
output reg[3:0] count;
input clk,rst,pst;
input [3:0] n;
always@(posedge clk)
	count=count+1'b1;
always@(rst or pst)
	if (rst)assign count =7'h00;
	else if(pst)assign count =n;
	else deassign count;
endmodule


//testbench for the counter with continuous procedural assignement
module count_pra_tb();
reg clk,rst,pst;
reg [3:0] n;
wire [3:0] count;

count_pra cp1(.count(count),.pst(pst),.n(n),.rst(rst),.clk(clk));

initial
begin
clk=1'b0;rst=1'b1;n=14;pst=1'b0;
end

always
#5 clk=~clk;

initial
begin
#5 rst=1'b0;
#50 pst=1'b1;
end

initial
begin
$monitor($time, "rst=%b  pst = %b count=%d  n=%d",rst,pst,count,n);
#100 rst=1'b1;
#30 rst=1'b0;
#500 $stop;
end

endmodule

