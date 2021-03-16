module mem_forever_tb();
reg clk,rst;

mem_forever mf1(.clk(clk),.rst(rst));

initial
begin clk=1'b0;rst=1'b1; end

always #5 clk=~clk;

initial
begin #15 rst=1'b0; end

initial #1000 $stop;

endmodule

