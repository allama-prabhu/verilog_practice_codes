module mux2gt();
wire o;
reg p,q,r;
mux2g m1(.a(p),.b(q),.s(r),.y(o));
initial
begin
p = 1'b0;
q = 1'b0;
r = 1'b0;
#100
p = 1'b0;
q = 1'b1;
r = 1'b1;
#100
p = 1'b0;
q = 1'b0;
r = 1'b1;
#100
p = 1'b1;
q = 1'b0;
r = 1'b0;
end
initial
$monitor($time    ,"a = '%b',  b = '%b', select = '%b', output = '%b' ", p,q,r,o);
endmodule

module mux2dt();
wire o;
reg p,q,r;
mux2d m2(.a(p),.b(q),.s(r),.y(o));
initial
begin
p = 1'b0;
q = 1'b0;
r = 1'b0;
#100
p = 1'b0;
q = 1'b1;
r = 1'b1;
#100
p = 1'b0;
q = 1'b0;
r = 1'b1;
#100
p = 1'b1;
q = 1'b0;
r = 1'b0;
end
endmodule
