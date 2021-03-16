module fsm_seq_tb();
reg x,clk,rst_n;
wire z;

fsm_seq fs1(.x(x),.clk(clk),.rst_n(rst_n),.z(z));

initial
begin
clk=1'b0;
rst_n=1'b0;
end

always
#5 clk=~clk;

initial
begin
#10 x=1'b0;
#10 x=1'b0;
#10 x=1'b0;
#10 x=1'b0;
#10 x=1'b1;
#10 x=1'b1;
#10 x=1'b0;
#10 x=1'b0;
#10 x=1'b1;
#10 x=1'b1;
#10 x=1'b0;
#10 x=1'b1;
#10 x=1'b1;
#10 x=1'b0;
end

initial
begin
$monitor(" x = %b  out = %b" , x, z);
#300 $stop;
end

endmodule

