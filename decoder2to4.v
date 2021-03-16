//2to4 decoder data flow level design
module decoder2to4(y0,y1,y2,y3,a,b,e);
output y0,y1,y2,y3;
input a,b,e;
wire y0,y1,y2,y3;
wire w1;
and(w1,a,b);
assign y0 = (~(w1))& e;
assign y1 = (~a) & b & e;
assign y2 = (a) & (~b) & e;
assign y3 = (w1) & e;
endmodule

//2to4 decoder gate level design
module decoder2to4g(y0,y1,y2,y3,a,b,e);
output y0,y1,y2,y3;
input a,b,e;
wire y0,y1,y2,y3;
wire w1,w1b,ab,bb;
and(w1,a,b);
and(y0,w1b,e);
and(y1,ab,b,e);
and(y2,a,bb,e);
and(y3,w1,e);
endmodule


