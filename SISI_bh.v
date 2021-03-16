module SISO_bhv(clk,rst,sin,sout);
input sin,clk,rst;
output sout;
wire sout;
reg [3:0] temp;
always@(posedge clk)
begin
if(rst)
temp <= 4'b0;
else
temp <= {temp[2:0],sin};
end
assign sout = temp[3];
endmodule


//test bench for 4 bit SISO
module SISO_bhtb();
reg sin,clk,rst;
wire sout;
SISO_bhv S1(.clk(clk),.rst(rst),.sin(sin),.sout(sout));
initial
begin
sin = 1'b0;rst = 1'b1; clk = 1'b0;
end

always
begin
#10 clk = ~clk;
end

initial
begin
#15 rst = 1'b0;
end

always
#40 sin = ~sin;

initial
$monitor($time, "sin = '%b'  sout = '%b' ", sin,sout);

initial #500 $stop;

endmodule
