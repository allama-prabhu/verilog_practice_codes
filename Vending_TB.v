module Vending_TB();
reg [1:0] coin;
reg rst,clk;
wire P,C;

vending_MC VM1(.rst(rst),.clk(clk),.coin(coin),.P(P),.C(C));

initial
begin clk=1'b0; rst=1'b1; coin=2'b0; end

always #5 clk=~clk;

initial
begin
#10 rst=1'b0;
#10 coin=2'b01;
#10 coin=2'b01;
#10 coin=2'b10; //S3, P=1,C=1
#10 coin=2'b10;
#10 coin=2'b01; //S2, P=1,C=0
#10 coin=2'b10;
#10 coin=2'b01; //S2, P=1,C=0
#10 coin=2'b01;
end

initial
begin
$monitor($time,"VM1.ps = %d, VM1.ns = %d, coin = %b, P = %b, C = %b",VM1.ps,VM1.ns,coin,P,C);
#200 $stop;
end

endmodule





