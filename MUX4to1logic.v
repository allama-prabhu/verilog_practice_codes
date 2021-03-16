module mux4g(y,a,b,c,d,s1,s0);
output y;
input a,b,c,d,s1,s0;
wire s0bar,s1bar,w1,w2,w3,w4;
not(s1bar,s1);
not(s0bar,s0);
and (w1,a,s1bar,s0bar),(w2,b,s1bar,s0bar), (w3,c,s1,s0bar), (w4,d,s1,s0);
or(y,w1,w2,w3,w4);
endmodule

module mux4d(y,a,b,c,d,s1,s0);
output y;
input a,b,c,d,s1,s0;
assign y = ((a & ~s1 & ~s0) | (b & ~s1 & s0) | (c & s1 & ~s0) | (d & s1 & s0));
endmodule






















