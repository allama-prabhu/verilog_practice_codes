//`timescale 1ns/1ns
module square_wave_gen_TB();
reg clk,rst;
wire s_wave;

square_wave_gen sg1(.clk(clk),.rst(rst),.s_wave(s_wave));

initial
begin
rst = 1'b1;
clk = 1'b0;
end

always #5 clk=~clk;

initial
begin
#10 rst = 1'b0;
end

initial
begin
$monitor(" time = %d , s_wave = %b , sg1.count = %d ", $time, s_wave, sg1.count);
#1000 $stop;
end

endmodule

