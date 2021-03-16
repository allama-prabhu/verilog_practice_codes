module comparator_fsm_tb();
reg x,y,clk,rst;
wire [1:0] out;

comparator_fsm cmp1(.x(x),.y(y),.out(out),.clk(clk),.rst(rst));

initial
begin
clk = 1'b0;
rst = 1'b1;
x = 1'b0;
y = 1'b0;
end

always #5 clk = ~clk;

initial
begin
#5 rst = 1'b0;
#15 x = 1'b1; y = 1'b0;
#10 x = 1'b1; y = 1'b1;
#10 x = 1'b0; y = 1'b1;
end

initial
begin
$monitor( "time = %d, x = %b , y = %b , out = %b , rst = %b ", $time, x, y, out, rst);
#200 $stop;
end

endmodule
