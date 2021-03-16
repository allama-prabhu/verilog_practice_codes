`timescale 1ns/1ns
module seq_dt_00_11_TB();
reg clk,rst,w;
wire z;

seq_dt_00_11 s1(.clk(clk),.rst(rst),.w(w),.z(z));
initial
begin
clk=1'b0; 
rst=1'b0;
#10 rst=1'b1;
end

always
#5 clk=~clk;

initial
begin
#10 w=$random(2);
repeat(10)
#10 w=$random;
end

initial
begin
$timeformat(-3,5,"ms",12);
$monitor(" time = %t clk = %b w = %b  z = %b  ",$time,clk,w,z);
#300 $stop;
end

endmodule
