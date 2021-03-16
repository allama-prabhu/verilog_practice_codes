module decoder_38_test();
reg [2:0] A;
wire [7:0] T;
reg clk,rst;
decoder_38 d1(.A(A),.T(T),.rst(rst),.clk(clk));
initial
begin
clk = 1'b0;
rst = 1'b1;
end

always #5 clk = ~clk;

initial
#5 rst = 1'b0;

initial 
begin
$monitor($time ,"A = %0d , T = %0d", A, T);
#200 $stop;
end

endmodule
