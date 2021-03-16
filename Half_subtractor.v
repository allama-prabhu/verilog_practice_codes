module half_sub(D,B0,A,B);
input A,B;
output D,B0;
wire D,B0;
wire w1;
not(w1,A);
assign D = A^B;
assign B0 = w1 & B;
endmodule




