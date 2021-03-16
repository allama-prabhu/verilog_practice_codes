`timescale 1ns/1ns
module FSM2_TB;
reg clk, RESET, A, B;
wire N, R;
parameter X = 2'b00, Y = 2'b01, Z = 2'b10;
fsm_NR  f1(.clk(clk), .RESET(RESET), .A(A), .B(B), .N(N), .R(R));
initial
begin
RESET=1;
clk=0;
A=0;
B=1;
#3 RESET=0;
end
always #3 clk=~clk;
always #5 A=~A;
always #5 B=~B;
initial
begin
$timeformat(-3,5,"ms",12);
$monitor( " time = %t ,clk=%b, RESET=%b, A=%b, B=%b, N=%b, R=%b", $time,clk, RESET, A, B, N, R );
#100 $stop;
end

endmodule
