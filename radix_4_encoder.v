//radix 4 encoder 2  --> Radix 4 Encoder

module radix_4_encoder(PP, b2i1, b2i, b2im1, aj, ajm1);

input b2i1, b2i, b2im1;
input [5:0] aj, ajm1;

wire zeroib, twoi, negi;
wire [7:0] mi;

output [7:0] PP;
wire [7:0] PP;

initial
begin
$dumpfile("radix_4_conv.vcd");
$dumpvars(0,radix_4_encoder_tb);
end


//inner hardware module
wire w1,w2,w3,w4;
wire [7:0] w5;
wire b2i1b,b2ib,b2im1b;

not(b2i1b,  b2i1);
not(b2ib,   b2i);
not(b2im1b, b2im1);

and(w1,    b2i1b,b2ib,b2im1b);
and(w2,    b2im1,b2i,b2i1);
nor(zeroib, w1,w2);

and(w3, b2i1,b2ib,b2im1b);
and(w4, b2i1b,b2i,b2im1);
or(twoi,w3,w4);

assign negi = b2i1;

assign mi = (twoi == 1'b0) ? aj : ajm1;
xor x1[7:0](w5, mi, negi);
and a1[7:0](PP, w5, zeroib);

endmodule