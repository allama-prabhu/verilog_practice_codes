module PIPO_bhv(pin,pout,clk,rst);
input [3:0] pin;
output reg [3:0] pout;
input rst,clk;
//reg [3:0] temp;

always@(posedge clk)
begin
if(rst)
pout <= 4'b0;
else
begin
pout <= pin;
end
end

endmodule


//testbench for PIPO
module PIPO_bhtb();
reg [3:0] pin;
wire [3:0] pout;
reg rst,clk;
PIPO_bhv P1(.pin(pin),.pout(pout),.clk(clk),.rst(rst));

//initialize and clear registers.
initial
begin
rst = 1'b1; clk = 1'b0; pin = 4'b0;
end

//set the clock generator
always
#20 clk = ~clk;

//logic verification
initial
begin
#30 rst = 1'b0;
end

always
begin
#40 pin = pin+1;
end

//monitoring of the values
initial
$monitor($time,"pin = '%b', pout = '%b' ", pin, pout);

//end the execution by using a system task
initial
#500 $stop;

endmodule


