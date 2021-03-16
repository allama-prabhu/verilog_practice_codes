//demux1to4 data flow design
module demux1to4d(I,S,Y);
output [3:0] Y;
input I;
input [1:0] S;
wire S1b,S0b;
not(S1b,S[1]);
not(S0b,S[0]);
assign Y[0] = (I & S0b & S1b);
assign Y[1] = (I & S[0] & S1b);
assign Y[2] = (I & S0b & S[1]);
assign Y[3] = (I & S[0] & S[1]);
endmodule

//demux1to4 gate level design
module demux1to4g(I,S,Y);
output [3:0]Y;
input I;
input [1:0] S;
wire S1b,S0b;
not(S1b,S[1]);
not(S0b,S[0]);
and(Y[0],I,S0b,S1b);
and(Y[1],I,S0,S1b);
and(Y[2],I,S0b,S1);
and(Y[3],I,S0,S1);
endmodule

