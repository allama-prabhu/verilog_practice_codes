module digital_lock_TB();
reg clk,clr;
reg b_in;
wire out;

digital_lock dc1(.clk(clk),.clr(clr),.b_in(b_in),.out(out));

initial
begin
clk=1'b0;
clr=1'b0;
b_in=1'b0;
end

always #5 clk=~clk;

initial
begin
#10 clr=1'b1;
#10 b_in=1'b1;
#10 b_in=1'b1;
#10 b_in=1'b0;
#10 b_in=1'b1;
#10 b_in=1'b0;
#10 b_in=1'b0;
end

initial
begin
$monitor("clk = %b , time = %d , clr = %b , b_in = %b ,  out = %b ", clk,$time,clr,b_in,out);
#200 $stop;
end

endmodule

