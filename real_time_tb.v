module real_time_tb;
reg clk,rst;
wire [5:0]sec,min;
wire [4:0]hr;
real_time r1(clk,rst,sec,min,hr);
initial
begin
rst=1;
clk=0;
#2 rst=0;
end
always #0.5 clk=~clk;
initial
begin
$monitor ($time,"\tclk=%d\t rst=%d\t  hr:min:sec=%d:%d:%d\t",clk,rst,hr,min,sec);
#100000 $stop;
end
endmodule
