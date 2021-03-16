`timescale 10 ms/100 us
module sequence_tst ();
reg a, clk, rst;
wire w,x,y,z;
integer myseed;
sequence_fsm t1 (.a(a), .clk(clk), .rst(rst), .w(w), .x(x), .y(y), .z(z));
initial myseed=16;
initial
begin
//$dumpfile ("sequence.vcd"); $dumpvars (0, sequence_tst);
clk=1'b0;
rst=1'b0;
end
initial
#15 rst=1'b1;
always #5 clk=~clk;

initial
$timeformat (-6,5,"us",12);

initial
begin
repeat (5)
begin
a= $random(myseed);
#150 a=~ $random;
end
end

initial
$monitor ($time, "clk=%b, rst=%b, a=%d, w=%b, x=%b, y=%b, z=%b" , clk,rst,a,w,x,y,z);

initial
begin
#310 $stop;
end
endmodule