//mux gate level design
module mux4g(y,a,b,c,d,s1,s0);
output y;
input a,b,c,d,s1,s0;
wire s0bar,s1bar,w1,w2,w3,w4;
not(s1bar,s1);
not(s0bar,s0);
and (w1,a,s1bar,s0bar),(w2,b,s1bar,s0bar), (w3,c,s1,s0bar), (w4,d,s1,s0);
or(y,w1,w2,w3,w4);
endmodule

//mux data flow level design
module mux4d(y,a,b,c,d,s1,s0);
output y;
input a,b,c,d,s1,s0;
assign y = ((a & ~s1 & ~s0) | (b & ~s1 & s0) | (c & s1 & ~s0) | (d & s1 & s0));
endmodule

//mux 2 to 1 gate level
module mux2to1g(y,I0,I1,s0);
output y;
input I0,I1,s0;
wire y;
wire w1,w2;
not(s0b,s0);
and(w1,I0,s0);
and(w2,I1,s0b);
or(y,w1,w1);
endmodule

//mux 2 to 1 data flow model
module mux2to1d(y,I0,I1,s0);
output y;
input I0,I1,s0;
wire y;
not(s0b,s0);
assign y = (I0&s0)|(I1&s0b);
endmodule

//*mux4g m1(.y(w1),.a(I0),.b(I1),.c(I2),.d(I3),.s1(s1),.s0(s2));mux4g m2(.y(w2),.a(I4),.b(I5),.c(I6),.d(I7),.s1(s1),.s0(s2));mux2to1 m3(.y(y),.I0(w1),.I1(w2),.s0(s0));

