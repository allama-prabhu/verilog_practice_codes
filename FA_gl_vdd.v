module FA_gl_vdd(A,B,C,Sum,C_out);
input A,B,C;
output wire Sum,C_out;
wire w1,w2,w3,w4,w5,w6,w7;
wire AB,BB,CB,W3B;
not(AB,A);
not(BB,B);
not(CB,C);
not(W3B,W3);
and(W1,A,BB);
and(W2,AB,B);
or(W3,W1,W2,1'b1);

and(W6,W3,CB);
and(W7,W3B,C);
or(Sum,W6,W7);

and(W4,C,W3);
and(W5,A,B);
or(C_out,W4,W5);

endmodule
