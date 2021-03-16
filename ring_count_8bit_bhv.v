module RCounter_8bhv(count, clk, init);
input init, clk;
output reg [7:0] count;

always@(posedge clk)
begin
if(init)
count <= 8'b10000000;
else
begin 
//count <= count<<1;
count <= count<<1;
//count[0] <= count[7];
count[0] <= count[7];
end
end
endmodule


//testbench for ring counter of 8 bit
module RCounter_8bhtb();
reg init,clk;
wire [7:0] count;

RCounter_8bhv r1(.count(count),.clk(clk),.init(init));

//clear the registers
initial
begin
init = 1'b1; clk = 1'b0;
end

always
#20 clk = ~clk;

initial
#25 init = 1'b0;

initial
$monitor($time, "count = '%b'",count);

initial
#1000 $stop;

endmodule
