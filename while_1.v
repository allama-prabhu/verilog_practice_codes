module while_1(b,n,en,clk);
input [7:0] n;
input clk,en;
output reg b;
reg [7:0] a;
always@(posedge en)
begin
a=n;
while(|a)
	begin
	b=1'b1;
	@(posedge clk)
	a=a-1'b1;
	end
b=1'b0;
end
initial
b=1'b0;
endmodule


//test bench for while loop testing
module while_1_tb();
reg [7:0] n;
reg clk,en;
wire b;
while_1 w1(.b(b),.n(n),.en(en),.clk(clk));

initial
begin 
n=8'b0; 
clk=0; 
en=0;
end

always
#5 clk=~clk;

initial
begin
#10 en=1'b1;
n= 8'd16;
end

initial
$monitor($time, " en=%b n=%0d  a=%0d  b=%b", en, n, w1.a, b);

initial
#1000 $stop;

endmodule

