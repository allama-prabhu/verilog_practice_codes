module iir(x_in,y_out,clk); // Result
input clk;
parameter N=14;
input signed [N:0] x_in;
output signed [N:0] y_out;
reg signed [N:0] x, y;

initial
begin
$dumpfile("iir.vcd");
$dumpvars(0,iir_tb);
end

initial
begin
y=0;
x=0;
end

always @(posedge clk) 
begin
x <= x_in; 
y <= x + y / 8 + y / 8 + y / 8;
end  

assign y_out = y;

endmodule
