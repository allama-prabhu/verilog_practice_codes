module t_ff_bhv(t,clk,rst,q);
input t, clk, rst;
output reg q;

always @(posedge clk)
begin
if(rst)
begin
q <= 1'b0;
end

else
begin
if(t)
q <= ~q;
else
q <= q;
end

end
endmodule

//test bench for t flipflop
module t_ff_bhtb();
reg t,clk,rst;
wire q;

t_ff_bhv tf1(.t(t),.clk(clk),.rst(rst),.q(q));
//initialize
initial
begin
clk = 1'b0;
rst = 1'b1;
t = 1'b0;
$monitor($time,"t='%b', q='%b'",t,q);
end

always
#10 clk =~ clk;
initial
#20 rst = 1'b0;
always
#20 t=~t;


initial
#1000 $stop;

endmodule
