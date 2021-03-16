module iir_la_1(x_in,y_out,clk);
parameter N = 14;
input signed [N:0] x_in;
output signed [N:0] y_out;
input clk;

reg signed [N:0] x,sum,x1;
reg signed [N:0] y,y1;

initial
begin
$dumpfile("iir_la_1.vcd");
$dumpvars(0,iir_la_tb);
end

initial
begin
y   = 0;
x   = 0;
y1 = 0; 
sum = 0;
x1  = 0;
end

always@(posedge clk)
begin
x  <=  x_in; 
x1 <= (x/8)+(x/4); //getting 3/8 x(n-2)
sum <= x+x1; //sum terms

y1  <=  (y/8)+(y/64); //9/64 for a value of 3/8 
y    <=  sum+y1; //taking into consideration y(n-2)
end

assign y_out = y;

endmodule


