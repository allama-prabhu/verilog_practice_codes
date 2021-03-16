module seq_gen_ex_TB();
reg clk,rst,w;
wire [3:0] seq;

seq_gen_ex sg1(.clk(clk),.rst(rst),.w(w),.seq(seq));

initial
begin
clk=1'b0;
rst=1'b1;
w=1'b0;
end

always #5 clk=~clk;

initial
begin
#15 rst = 1'b0;
#50 w=1'b1;
end

initial
begin
$monitor($time," ps=%b , w= %b , seq = %b ",sg1.ps,w,seq);
#200 $stop;
end
endmodule

