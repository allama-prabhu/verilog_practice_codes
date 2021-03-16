module mux81testd();
reg [7:0] I;
reg [2:0] S;
wire y;
mux8to1d m1(.y(y),.I0(I[0]),.I1(I[1]),.I2(I[2]),.I3(I[3]),.I4(I[4]),.I5(I[5]),.I6(I[6]),.I7(I[7]),.S0(S[0]),.S1(S[1]),.S2(S[2]));
initial 
begin
S = 3'b000;
I = 8'b10101010;
end
always
begin
#100
S = S+1;
end
initial
#400
$display( "simulation time is : " , $time, "y = '%b'  S = '%b'",y,S); 
endmodule

