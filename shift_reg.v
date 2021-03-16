//shift register, left shift and right shift included here. lsi is the data that need to be appended while 
//shifting to the left. and rsi is the data to be appended in the left while shifting to the right.

module shift_reg(clk,rst,din,count,s1,s0,lsi,rsi);
parameter n=3;
input clk,rst,lsi,rsi,s1,s0;
input [n:0] din;
output reg [n:0] count;

always@(posedge clk or negedge rst)
if(!rst)
count<={n{1'b0}};
else
casex({s1,s0})
2'b00: count <= count;
2'b01: count <= {count[n-1:0],lsi};
2'b10: count <= {rsi,count[n:n-2]};
2'b11: count <= din;
endcase
endmodule


//testbench for shift register
module shift_reg_tb();
parameter n=3;
reg clk,rst,lsi,rsi,s1,s0;
reg [n:0] din;
wire [n:0] count;

shift_reg sr1(.clk(clk),.rst(rst),.din(din),.count(count),.s1(s1),.s0(s0),.lsi(lsi),.rsi(rsi));
initial
begin
clk=1'b0;rst=1'b1;lsi=1'b1;rsi=1'b1;s1=1'b0;s0=1'b0;din=15;
end

always
#5 clk=~clk;

always
begin
#10 rst=1'b0;
#10 s1=1'b0;s0=1'b1; 
#10 s1=1'b1;s0=1'b0;
#10 s1=1'b1;s0=1'b1;
end


initial
$monitor($time, " rst=%b s1=%b s0=%b lsi=%b rsi=%b count=%b", rst,s1,s0,lsi,rsi,count);

initial
#150 $stop;

endmodule

