module half_sub(D,B0,A,B);
input A,B;
output D,B0;
wire D,B0;
wire w1;
not(w1,A);
assign D = A^B;
assign B0 = w1 & B;
endmodule

module full_sub(Diff,Bout,A,B,Bin);
output Diff,Bout;
input A,B,Bin;
wire w1,w2,w3;
half_sub hs1(.D(w1),.B0(w2),.A(A),.B(B));
half_sub hs2(.D(Diff),.B0(w3),.A(w1),.B(Bin));
assign Bout = w3 | w2;
endmodule

module f_subtest();
reg A,B,Bin;
wire Diff,Bout;
full_sub fs1(.Diff(Diff),.Bout(Bout),.A(A),.B(B),.Bin(Bin));
initial 
begin
#100 A = 1'b0;B=1'b0;Bin=1'b0;
#100 A = 1'b0;B=1'b0;Bin=1'b1;
#100 A = 1'b0;B=1'b1;Bin=1'b0;
#100 A = 1'b0;B=1'b1;Bin=1'b1;
#100 A = 1'b1;B=1'b0;Bin=1'b0;
#100 A = 1'b1;B=1'b0;Bin=1'b1;
#100 A = 1'b1;B=1'b1;Bin=1'b0;
#100 A = 1'b1;B=1'b1;Bin=1'b1;
end
endmodule


