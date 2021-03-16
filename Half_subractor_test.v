module hs_test();
reg A,B;
wire D,B0;
half_sub hs1(.D(D),.B0(B0),.A(A),.B(B));
initial 
begin
#10 A = 1'b0;B = 1'b0;
#10 A = 1'b0;B = 1'b1;
#10 A = 1'b1;B = 1'b0;
#10 A = 1'b1;B = 1'b1;
end
initial
$monitor($time    ,"a = '%b',  b = '%b', Diff = '%b', Borrow = '%b ", A,B,D,B0);
endmodule
