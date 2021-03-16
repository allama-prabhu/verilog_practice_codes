`timescale 1ns/1ns
module arbiter_tb();
reg clk,rst;
reg req_0,req_1;
wire gnt_0,gnt_1;

arbiter ab1(.clk(clk),.rst(rst),.req_0(req_0),.req_1(req_1),.gnt_0(gnt_0),.gnt_1(gnt_1));
initial
begin
clk=1'b0;
rst=1'b1;
{req_0,req_1} = 2'b00;
end

always #5 clk=~clk;

initial
begin : testblock
integer i;
#10 rst=1'b0;
#20 {req_0,req_1} = $random(2);//2'b00;
for(i=0;i<15;i=i+1)
#20 {req_0,req_1} = $random;//2'b01;
	
end

initial
begin
$timeformat(-3,5,"ms",5);
$monitor( " time = %t , {req_0,req_1} = %b , gnt_0= %b , gnt_1 = %b", $time, {req_0,req_1},gnt_0,gnt_1);
#500 $stop;
end

endmodule


