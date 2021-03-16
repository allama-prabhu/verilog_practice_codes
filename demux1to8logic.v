//gate level design
module demux1to8g(I,S,Y);
output [7:0] Y;
input I;
input [2:0] S;
wire S2b,S1b,S0b;
not(S2b,S[2]),(S1b,S[1]),(S0b,S[0]);
and(Y[0],I,S2b,S1b,S0b);
and(Y[1],I,S2b,S1b,S[0]);
and(Y[2],I,S2b,S[1],S0b);
and(Y[3],I,S2b,S[1],S[0]);
and(Y[4],I,S[2],S1b,S0b);
and(Y[5],I,S[2],S1b,S[0]);
and(Y[6],I,S[2],S[1],S0b);
and(Y[7],I,S[2],S[1],S[0]);
endmodule


//data flow design
module demux1to8d(I,S,Y);
output [7:0] Y;
input I;
input [2:0] S;
wire S2b,S1b,S0b;
assign S2b = ~S[2];
assign S1b = ~S[1];
assign S0b = ~S[0];
assign Y[0] = (I & S2b & S1b & S0b);
assign Y[1] = (I & S2b & S1b & S[0]);
assign Y[2] = (I & S2b & S[1] & S0b);
assign Y[3] = (I & S2b & S[1] & S[0]);
assign Y[4] = (I & S[2] & S1b & S0b);
assign Y[5] = (I & S[2] & S1b & S[0]);
assign Y[6] = (I & S[2] & S[1] & S0b);
assign Y[7] = (I & S[2] & S[1] & S[0]);
endmodule














