module PISO_bhv(sout,pin,clk,load);
input [3:0] pin;
output reg sout;
input clk,load;
reg [3:0] tmp; //temporary register

always@(posedge clk)
begin
if(load)
tmp <= pin;
else
begin
sout = tmp[3];
tmp <= {tmp[2:0],1'b0};
end
end
endmodule


//test bench for PISO
module PISO_bhtb();
reg [3:0] pin;
wire sout;
reg clk,load;

PISO_bhv PS1(.sout(sout),.pin(pin),.clk(clk),.load(load));
initial
begin
load = 1'b1;
clk = 1'b0;
pin = 4'b0;
end

always
#20 clk = ~clk;

initial
begin
#10 pin = 4'b1011;
#30 load = 1'b0;
end

initial
$monitor($time, "pin = '%b' sout = '%b' ", pin, sout);

initial
#500 $stop;


endmodule









