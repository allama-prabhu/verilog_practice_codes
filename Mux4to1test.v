module mux4gt();
reg a,b,c,d,s1,s0;
wire y;
mux4g m1(.a(a),.b(b),.c(c),.d(d),.y(y),.s1(s1),.s0(s0));
initial
begin
s1 = 1'b0;
s0 = 1'b0;
end
initial 
begin
a = 1'b1;b = 1'b0;c = 1'b0;d = 1'b0;s1 = 1'b0;s0 = 1'b0;
#100
a = 1'b1;b = 1'b0;c = 1'b1;d = 1'b1;s1 = 1'b0;s0 = 1'b1;
#100
a = 1'b0;b = 1'b0;c = 1'b1;d = 1'b0;s1 = 1'b1;s0 = 1'b0;
#100
a = 1'b1;b = 1'b1;c = 1'b1;d = 1'b0;s1 = 1'b1; s0 = 1'b1;
end
initial
$monitor($time    ,"a = '%b',  b = '%b', c = '%b', d = '%b', S1 = '%b', S0 = '%b', output = '%b' ", a,b,c,d,s1,s0,y);
endmodule

module mux4dt();
reg a,b,c,d,s1,s0;
wire y;
mux4d m2(.a(a),.b(b),.c(c),.d(d),.y(y),.s1(s1),.s0(s0));
initial 
begin
a = 1'b1;b = 1'b0;c = 1'b0;d = 1'b0;s1 = 1'b0;s0 = 1'b0;
#100
a = 1'b1;b = 1'b0;c = 1'b1;d = 1'b1;s1 = 1'b0;s0 = 1'b1;
#100
a = 1'b0;b = 1'b0;c = 1'b1;d = 1'b0;s1 = 1'b1;s0 = 1'b0;
#100
a = 1'b1;b = 1'b1;c = 1'b1;d = 1'b0;s1 = 1'b1;s0 = 1'b1;
end
endmodule

