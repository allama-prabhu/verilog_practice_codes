//lower level primitive design of 1to4mux
module demux1to4g(I,S,Y);
output [3:0]Y;
input I;
input [1:0] S;
wire S1b,S0b;
not(S1b,S[1]);
not(S0b,S[0]);
and(Y[0],I,S0b,S1b);
and(Y[1],I,S[0],S1b);
and(Y[2],I,S0b,S[1]);
and(Y[3],I,S[0],S[1]);
endmodule

//1to16 demux using 1to4 demux
module demux1to16g(I,S,Y);
output [15:0] Y;
input I;
input [3:0] S;
wire [3:0] W;
demux1to4g dm1(.I(I),.S(S[3:2]),.Y(W[3:0]));
demux1to4g dm2(.I(W[0]),.S(S[1:0]),.Y(Y[3:0]));
demux1to4g dm3(.I(W[1]),.S(S[1:0]),.Y(Y[7:4]));
demux1to4g dm4(.I(W[2]),.S(S[1:0]),.Y(Y[11:8]));
demux1to4g dm5(.I(W[3]),.S(S[1:0]),.Y(Y[15:12]));
endmodule

