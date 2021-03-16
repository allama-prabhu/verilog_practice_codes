module prime_count_tb();
reg clk,rst;
wire [3:0] count;
prime_count pc1(.clk(clk),.rst(rst),.count(count));

initial
begin
clk = 1'b0;
rst = 1'b1;
end

always #5 clk = ~clk;

initial
#10 rst = 1'b0;

initial
begin
$monitor($time,"rst = %0b, count = %0d",rst,count);
#200 $stop;
end

endmodule

