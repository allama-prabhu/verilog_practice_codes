module Digital_clock_tb();
reg clk,init;
wire [13:0] seg_min,seg_hour,seg_sec;
wire [5:0]  hour,min,sec;

Digital_clock g1(.clk(clk),.init(init),.seg_sec(seg_sec),.seg_min(seg_min),.seg_hour(seg_hour),.min(min),.hour(hour),.sec(sec));
initial
begin
init=1'b1;
clk=1'b0;
#2 init=1'b0;  //give the init to low.
end

always
#1 clk=~clk;
initial $monitor ($time," %b:%b:%b --- %d:%d:%d",seg_hour,seg_min,seg_sec,hour,min,sec);
initial #80000 $stop;
endmodule
