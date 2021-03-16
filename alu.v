module alu(a,b,cin,sum,cout,sel,out_a,out_b,out_c);
input [3:0] a,b;
input cin;
input [1:0] sel;
output [3:0] sum,out_a,out_b,out_c;
output cout;

fa_4b FA1(a,b,cin,sum,cout);
AND_1 A1(out_a,a,b);
XOR_1 X1(out_x,a,b);
compl_4 C1(a,out);

mux4_1alu(y,i,e);
dec_2_4 d1(a,b,en);

endmodule

module dec_2_4(a,b,en);
input [1:0] b;
output [3:0] a;
input en;
wire [1:0] bb;
not(bb[1],b[1]),(bb[0],b[0]);
and(a[0],en,bb[1],bb[0]),(a[1],en,bb[1],b[0]),(a[2],en,b[1],bb[0]),(a[3],en,b[1],b[0]);
endmodule


module mux4_1alu(y,i,e);
input [3:0] i;
input e;
output [3:0]y;
bufif1 g1(y[3],i[3],e);
bufif1 g2(y[2],i[2],e);
bufif1 g3(y[1],i[1],e);
bufif1 g4(y[0],i[0],e);
endmodule


//full adder 1 bit module.
module fa_1b(a,b,cin,s,cout);
input a,b,cin;
output s,cout;
wire s1,c1,w1;

xor(s1,a,b);
and(c1,a,b);

xor(s,s1,cin);
and(w1,s1,cin);
or(cout,w1,c1);
endmodule

//full adder 4 bit by using 1 bit FA module instantiation.
module fa_4b(a,b,cin,sum,cout);
input [3:0] a,b;
input cin;
output wire [3:0] sum;
output cout;
wire c1,c2,c3;
fa_1b fa0(.a(a[0]),.b(b[0]),.cin(cin),.s(sum[0]),.cout(c1));
fa_1b fa1(.a(a[1]),.b(b[1]),.cin(c1),.s(sum[1]),.cout(c2));
fa_1b fa0(.a(a[2]),.b(b[2]),.cin(c2),.s(sum[2]),.cout(c3));
fa_1b fa0(.a(a[3]),.b(b[3]),.cin(c3),.s(sum[3]),.cout(cout));
endmodule

//complementing all the 4 bits of a 4 bit vector
module compl_4(a,out);
input [3:0] a;
output [3:0] out;
not(out[0],a[0]);
not(out[1],a[1]);
not(out[2],a[2]);
not(out[3],a[3]);
endmodule

//Bit-by-bit AND operation on two nibbles
module AND_1(out_a,a,b);
input [3:0] a,b;
output [3:0] out_a;
and(out_a[0],a[0],b[0]);
and(out_a[1],a[1],b[1]);
and(out_a[2],a[2],b[2]);
and(out_a[3],a[3],b[3]);
endmodule


//Bit-by-bit XOR operation on two nibbles
module XOR_1(out_x,a,b);
input [3:0] a,b;
output [3:0] out_x;
xor(out_x[0],a[0],b[0]);
xor(out_x[1],a[1],b[1]);
xor(out_x[2],a[2],b[2]);
xor(out_x[3],a[3],b[3]);
endmodule







