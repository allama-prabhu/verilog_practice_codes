/*
// yp[3]-->  y3j2      ; yp[2]-->  y3j1    ,yp[1]--> y3j     ,yp[0]--> y3jm1
// mc   -->  xi          ; mc_3 -->  si	   ,mc_2 --> xim1    ,mc_4 --> xim2
*/

module top_module(PP, yp, xi, xim1, xim2, cin);

input [3:0] yp;
input [3:0] xi,xim1,xim2;
output [3:0] PP;
wire [3:0] PP;

wire [3:0] w1,w2,w3,w4,w5,w6,w7;

//wire out_xi, out_xim1, out_xim2, out_si;
input cin;
assign cin = 0;
wire [3:0] si;
alu10 s1(.out(si),.a(xi),.b(xim1),.cin(cin));

siterm    x1(.out_si(w1),   .yp(yp), .si(si));
xiterm    x2(.out_xi(w2),   .yp(yp), .xi(xi));
xim1term  x3(.out_xim1(w3), .yp(yp), .xim1(xim1));
xim2term  x4(.out_xim2(w4), .yp(yp), .xim2(xim2));


or or1[3:0](w5,w1,w2);
or or2[3:0](w6,w3,w4);

or or3[3:0](w7,w5,w6);

xor xn[3:0](PP, w7, yp[3]);

endmodule

//xi term
module xiterm(out_xi, yp, xi);
input [3:0] yp;
input [3:0] xi;
output [3:0] out_xi;

wire w1,w2;
wire [3:0] out_xi;

xnor (w1,yp[3],yp[2]);
xor(w2,yp[1],yp[0]);
and a3[3:0](out_xi,w1,w2,xi);
endmodule


//xi-1 term
module xim1term(out_xim1, yp, xim1);
input [3:0]xim1;
input [3:0] yp;
output [3:0] out_xim1;
wire [3:0] out_xim1;

wire w1,w2,w3;
wire yp30, yp20, yp10, yp00;
not(yp30,yp[3]), (yp20,yp[2]),(yp10,yp[1]),(yp00,yp[0]);

and(w1, yp20 , yp[1], yp[0]);
and(w2, yp[2], yp10, yp00);

or(w3, w1, w2);
and a2[3:0] (out_xim1, xim1, w3);

endmodule


//xi-2 term
module xim2term(out_xim2, yp, xim2);
input [3:0] xim2;
input [3:0] yp;
output [3:0] out_xim2;
wire [3:0] out_xim2;

wire w1,w2,w3,w4,w5,w6,w7;
wire yp30, yp20, yp10, yp00;
not (yp30,yp[3]), (yp20,yp[2]),(yp10,yp[1]),(yp00,yp[0]);

and (w1,yp30,yp[2]) , (w2,yp[1],yp[0]) , (w3,yp[3],yp20) , (w4, yp10, yp00) ;
and (w5,w1,w2),(w6,w3,w4);

or  (w7,w5,w6);
and a1[3:0](out_xim2, xim2, w7);
endmodule


//si term
module siterm(out_si, si, yp);
input [3:0] yp;
input [3:0] si;
output [3:0] out_si;
wire [3:0] out_si;

wire w1,w2;
xor(w1, yp[3], yp[2]);
xor(w2, yp[1], yp[0]);

and s1[3:0](out_si, w1, w2, si);

endmodule

//si calculation
module alu10(out,a,b,cin);
output [3:0] out;
input [3:0] a;
input [3:0] b;
input cin;
assign out = a + b + cin;
endmodule 









