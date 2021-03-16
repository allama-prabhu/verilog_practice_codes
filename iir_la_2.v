module iir_la_2(x_in,y_out,clk);
parameter N = 14;
input signed [N:0] x_in;
output signed [N:0] y_out;
input clk;
real temp;

reg signed [N:0] x,sum,x1,x2,x3;
reg signed [N:0] y,y1,y2,y3;

initial
begin
//clearing the registers initially
y   <= 0; x   <= 0; y1  <= 0; y2 <= 0; sum <= 0; x1  <= 0; x2  <= 0; x3 <= 0;
$dumpfile("iir_la_2.vcd");
$dumpvars(0,iir_LA_2_tb_a);
end

always@(posedge clk)
begin
x    <= x_in;
x1   <= x;
x2   <= x1;
x3   <= x2;
sum  <= x1+((3*x2)/8)+((9*x3)/64);
temp <= y; 
y1   <= temp;
y2   <= y1;
y3   <= y2;
y    <= ((27*y3)/512)+sum;
end

assign y_out = y;

endmodule
