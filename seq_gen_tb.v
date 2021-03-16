module seq_gen_tb();
reg clk,rst;
wire w,x,y,z;

seq_gen sg1(.clk(clk),.rst(rst),.w(w),.x(x),.y(y),.z(z));

initial
begin rst=1'b1;clk=1'b0; end

always #5 clk=~clk;

initial
#15 rst=1'b0;

initial
begin
$monitor($time, " rst = %b out  = %b ", rst, {w,x,y,z});
#300 $stop;
end

endmodule
