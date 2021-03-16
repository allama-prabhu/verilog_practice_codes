//16 to 1 mux gate level design
module mux16to1glevel(Y,I,S);
input [15:0] I;
input [3:0] S;
output Y;
wire S3b,S2b,S1b,S0b;
not(S3b,S[3]),(S2b,S[2]),(S1b,S[1]),(S0b,S[0]);
and(Y, S3b, S2b, S1b, S0b, I[0]);
and(Y, S3b, S2b, S1b, S[0], I[1]);
and(Y, S3b, S2b, S[1], S0b, I[2]);
and(Y, S3b, S2b, S[1], S[0], I[3]);
and(Y, S3b, S[2], S1b, S0b, I[4]);
and(Y, S3b, S[2], S1b, S[0], I[5]);
and(Y, S3b, S[2], S[1], S0b, I[6]);
and(Y, S3b, S[2], S[1], S[0], I[7]);
and(Y, S[3], S2b, S1b, S0b, I[8]);
and(Y, S[3], S2b, S1b, S[0], I[9]);
and(Y, S[3], S2b, S[1], S0b, I[10]);
and(Y, S[3], S2b, S[1], S[0], I[11]);
and(Y, S[3], S[2], S1b, S0b, I[12]);
and(Y, S[3], S[2], S1b, S[0], I[13]);
and(Y, S[3], S[2], S[1], S0b, I[14]);
and(Y, S[3], S[2], S[1], S[0], I[15]);
endmodule


//16 to 1 mux data flow level design
module mux16to1dlevel(Y,I,S);
input [15:0] I;
input [3:0] S;
output Y;
wire S3b,S2b,S1b,S0b;
assign S3b = ~S[3];
assign S2b = ~S[2];
assign S1b = ~S[1];
assign S0b = ~S[0];
assign Y = (S3b & S2b & S1b & S0b & I[0]);
assign Y = (S3b & S2b & S1b & S[0] & I[1]);
assign Y = (S3b & S2b & S[1] & S0b & I[2]);
assign Y = (S3b & S2b & S[1] & S[0] & I[3]);
assign Y = (S3b & S[2] & S1b & S0b & I[4]);
assign Y = (S3b & S[2] & S1b & S[0] & I[5]);
assign Y = (S3b & S[2] & S[1] & S0b & I[6]);
assign Y = (S3b & S[2] & S[1] & S[0] & I[7]);
assign Y = (S[3] & S2b & S1b & S0b & I[8]);
assign Y = (S[3] & S2b & S1b & S[0] & I[9]);
assign Y = (S[3] & S2b & S[1] & S0b & I[10]);
assign Y = (S[3] & S2b & S[1] & S[0] & I[11]);
assign Y = (S[3] & S[2] & S1b & S0b & I[12]);
assign Y = (S[3] & S[2] & S1b & S[0] & I[13]);
assign Y = (S[3] & S[2] & S[1] & S0b & I[14]);
assign Y = (S[3] & S[2] & S[1] & S[0] & I[15]);
endmodule
