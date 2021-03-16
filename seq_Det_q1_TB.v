`timescale 1ns/100ps
module seq_Det_q1_TB();
reg clk,rst,in;
wire z;

seq_Det_q1 s1(.in(in),.z(z),.clk(clk),.rst(rst));

initial
begin
clk=1'b0; 
rst=1'b1;
#10 rst=1'b0;
end

always
#5 clk=~clk;

initial
begin
#10 in=1'b0;
#10 in=1'b0;
#10 in=1'b0;
#10 in=1'b0;
#10 in=1'b0;
#10 in=1'b1;
#10 in=1'b1;
#10 in=1'b0;
#10 in=1'b1;
#10 in=1'b0;
#10 in=1'b0;
#10 in=1'b1;
#10 in=1'b1;
#10 in=1'b0;
#10 in=1'b0;
#10 in=1'b1;
#10 in=1'b1;
#10 in=1'b0;
#10 in=1'b1;
#10 in=1'b0;
end

initial
begin
$timeformat(-3,5,"ms",12);
$monitor(" time = %t  in = %b   z = %b  ps = %d ",$time,in,z,s1.ps);
#300 $stop;
end

endmodule

