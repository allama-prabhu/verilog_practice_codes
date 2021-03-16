module SIPO_bhv(pout,sin,clk,rst);
input rst,clk,sin;
output reg [3:0] pout;
reg [3:0] temp;

always@(posedge clk)
begin
if(rst)
begin
temp <= 4'b0;
pout <= 4'b0;
end
else
begin
temp <= {temp[2:0],sin};
pout <= temp;
end
end
endmodule

/*
 module sipo(a,clk,rst,q);
input clk,rst;
input a;
output [3:0]q;
wire [3:0]q;
reg [3:0]temp;
always@(posedge clk,posedge rst)
begin
if(rst==1'b1)
temp<=4'b0000;
else
begin
temp <= temp<<1'b1;
temp[0]<= a;
end
end
assign q=temp;
endmodule
*/



//test bench for SIPO
module SIPO_bhtb();
reg rst,clk,sin;
wire [3:0] pout;
SIPO_bhv S1(.pout(pout),.sin(sin),.clk(clk),.rst(rst));
//sipo s2(.clk(clk),.rst(rst),.a(sin),.q(pout));
initial
begin
clk = 1'b0; rst = 1'b1; sin = 1'b0;
end

initial
begin
#20 rst = 1'b0;
#20 sin = 1'b1;
end

always
#10 clk = ~clk;

initial
$monitor($time, "pout = '%b' , sin = '%b'", pout, sin);

initial
#500 $stop;

endmodule


