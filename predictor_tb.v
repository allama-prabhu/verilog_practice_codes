`timescale 1ns/1ns
module predictor_tb();
reg clock,reset;
reg taken;
wire predict;

predictor pr1(.clock(clock),.reset(reset),.taken(taken),.predict(predict));

initial
begin
clock=1'b0;
reset=1'b1;
taken=1'b0;
end


always #5 clock=~clock;
always #8 taken=~taken;
initial
begin
#5 reset = 1'b0;
//#10 taken = $random(2);
//repeat(20)
//#10 taken = $random;
end


initial
begin
$timeformat(-3,5,"ms",12);
$monitor( " clock = %b , reset = %b , time = %t , taken = %b , predict = %b ", clock, reset, $time, taken, predict);
#100 $stop;
end

endmodule
