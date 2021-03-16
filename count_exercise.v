module count(sig_a,sig_b,clk,count,eq_time);
input [31:0] sig_a,sig_b;
input clk;
reg integer count;
output [31:0] eq_time;
always@(posedge clk)
begin
if(sig_a == sig_b)
count = count+1;
else 
count = 0;
end

eq_time <= count;

endmodule
