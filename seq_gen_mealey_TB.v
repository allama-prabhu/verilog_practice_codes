`timescale 1ns/1ns
module seq_gen_mealey_TB();
reg clk,rst,A;
wire w,x,y,z;

seq_gen_mealey sg1(.clk(clk),.rst(rst),.A(A),.w(w),.x(x),.y(y),.z(z));

initial
begin
clk=1'b0; rst=1'b1; A=1'b0;
end

always #5 clk=~clk;

initial
begin
#10 rst = 1'b0;
A = $random(2);
#100 A  = $random;
end

initial
begin
$timeformat(-3,5,"ms",12);
$monitor(" tt=%0t , A = %b , out = %b " , $time, A, {w,x,y,z});
#1000 $stop;
end

endmodule  