//mux 2 to 1 gate level
module mux2g(output y, input a,b,s);
wire w1,w2,Snot;
not(Snot,s);
and (w1,s,b),(w2,Snot,a);
or(y,w1,w2);
endmodule

//mux 2 to 1 data flow model
module mux2d(output y,input a,b,s);
assign y = (~s & a) | (s & b);
endmodule


