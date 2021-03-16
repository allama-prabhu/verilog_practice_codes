module ser_rcv(di,clk,recv,do);
input di;
input clk,recv;
output reg [3:0] do;
always
begin
wait(recv)
@(posedge clk) do[0]=di;
@(posedge clk) do[1]=di;
@(posedge clk) do[2]=di;
@(posedge clk) do[3]=di;
end
endmodule






//testbench for the serial receiver that waits for recv to get high.
module ser_rcv_tb();
reg di;
reg clk,recv;
wire [3:0] do;
ser_rcv sr1(.di(di),.clk(clk),.recv(recv),.do(do));

initial
begin
clk=1'b0;
di=1'b0;
#20 recv =1'b1;
end	

initial
begin
#5 di=1'b0;
#7 di=1'b1;
#8 di=1'b0;
#9 di=1'b1;
#5 di=1'b0;
end

always #2 clk=~clk;

initial
$monitor($time, "clk= %b di=%b do=%b recv=%b  ", clk,di,do,recv);

initial
#200 $stop;

endmodule
