module MA_fil_FIR();
input clk;
input [7:0] Pin;
input rst;
output reg [15:0] Yout;
reg [7:0] adder_out;
wire [7:0] j1,j2,j3,j4,j5,j6,j7,j8;
parameter H = 1/8;

dff_bhv df1(.clk(clk),.rst(rst),.din(Pin),.dout(j1));
dff_bhv df2(.clk(clk),.rst(rst),.din(j1),.dout(j2));
dff_bhv df3(.clk(clk),.rst(rst),.din(j2),.dout(j3));
dff_bhv df4(.clk(clk),.rst(rst),.din(j3),.dout(j4));
dff_bhv df5(.clk(clk),.rst(rst),.din(j4),.dout(j5));
dff_bhv df6(.clk(clk),.rst(rst),.din(j5),.dout(j6));
dff_bhv df7(.clk(clk),.rst(rst),.din(j6),.dout(j7));
dff_bhv df8(.clk(clk),.rst(rst),.din(j7),.dout(j8));



always@(posedge clk)
begin
adder_out = j8+Pin;
multiply m1(.a(adder_out).b(H),.out(gain_out));





module multiply(a,b,out);
input [7:0] a;
input [7:0] b;
output [15:0] out;
assign out = a*b;
endmodule


module dff_bhv(clk,rst,din,dout);
input rst,clk,din;
output dout;
reg dout;
always@(posedge clk)
begin
if(rst)
dout <= 1'b0;
else
dout <= din;
end
endmodule
