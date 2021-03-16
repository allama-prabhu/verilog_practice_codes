module q7_2018(a,b);
input a;
output wire b;
//not #2(b,a);
assign #2 b=~a;
//always @(a)
//#2 b = ~a;
//always @(a)
//b = #2 ~a;
//always @(a)
//#2 b<=~a;
//always@(a)
//b<= #2 ~a;
endmodule


//test bench for the same
module q7_2018_tb();
reg a;
wire b;
q7_2018 q7(.a(a),.b(b));
initial
begin
a=1'bx;
#4 a=1'b0;
#4 a=1'bz;
#4 a=1'b1;
#4 a=1'b0;
#4 a=1'b1;
end

initial
$monitor($time," a = %0b, b = %0b",a,b);
endmodule
