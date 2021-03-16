//encoder 8to3 data flow level design
module encoder8to3d(y0,y1,y2,I0,I1,I2,I3,I4,I5,I6,I7);
output y0,y1,y2;
input I0,I1,I2,I3,I4,I5,I6,I7;
wire y0,y1,y2;
assign y2 = I4|I5|I6|I7;
assign y1 = I2|I3|I6|I7;
assign y0 = I1|I3|I5|I7;
endmodule

//encoder 8 to 3 using gate level design
module encoder8to3g(y0,y1,y2,I0,I1,I2,I3,I4,I5,I6,I7);
output y0,y1,y2;
input I0,I1,I2,I3,I4,I5,I6,I7;
wire y0,y1,y2;
assign y2 = I4|I5|I6|I7;
assign y1 = I2|I3|I6|I7;
assign y0 = I1|I3|I5|I7;
endmodule

