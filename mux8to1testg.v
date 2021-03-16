module mux81testg();
reg I0,I1,I2,I3,I4,I5,I6,I7,s0,s1,s2;
wire y;
mux8to1g m1(.y(y),.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.S0(s0),.S1(s1),.S2(s2));
initial
begin
s2 = 1'b0;s1 = 1'b0; s0 = 1'b0;
I0 = 1'b1;I1 = 1'b0;I2 = 1'b0;I3 = 1'b0;I4 = 1'b0;I5 = 1'b0;I6 = 1'b0;I7 = 1'b0;
#100
s2 = 1'b0;s1 = 1'b0; s0 = 1'b1;
I0 = 1'b0;I1 = 1'b1;I2 = 1'b0;I3 = 1'b0;I4 = 1'b0;I5 = 1'b0;I6 = 1'b0;I7 = 1'b0;
#100
s2 = 1'b0;s1 = 1'b1; s0 = 1'b0;
I0 = 1'b0;I1 = 1'b0;I2 = 1'b1;I3 = 1'b0;I4 = 1'b0;I5 = 1'b0;I6 = 1'b0;I7 = 1'b0;
#100
s2 = 1'b0;s1 = 1'b1; s0 = 1'b1;
I0 = 1'b0;I1 = 1'b0;I2 = 1'b0;I3 = 1'b1;I4 = 1'b0;I5 = 1'b0;I6 = 1'b0;I7 = 1'b0;
#100
s2 = 1'b1;s1 = 1'b0; s0 = 1'b0;
I0 = 1'b0;I1 = 1'b0;I2 = 1'b0;I3 = 1'b0;I4 = 1'b1;I5 = 1'b0;I6 = 1'b0;I7 = 1'b0;
#100
s2 = 1'b1;s1 = 1'b0; s0 = 1'b1;
I0 = 1'b0;I1 = 1'b0;I2 = 1'b0;I3 = 1'b0;I4 = 1'b0;I5 = 1'b1;I6 = 1'b0;I7 = 1'b0;
#100
s2 = 1'b1;s1 = 1'b1; s0 = 1'b0;
I0 = 1'b0;I1 = 1'b0;I2 = 1'b0;I3 = 1'b0;I4 = 1'b0;I5 = 1'b0;I6 = 1'b1;I7 = 1'b0;
#100
s2 = 1'b1;s1 = 1'b1; s0 = 1'b1;
I0 = 1'b0;I1 = 1'b0;I2 = 1'b0;I3 = 1'b0;I4 = 1'b0;I5 = 1'b0;I6 = 1'b0;I7 = 1'b1;
end
initial
#300
$display( "simulation time is : " , $time, "The value of output Y is : %b\b, at s2 = %b\b, s1 = %b\b, s0 = %b\b",y,s2,s1,s0);
endmodule
