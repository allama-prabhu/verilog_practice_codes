module orgtest();
reg p,q;
wire r;
orglvl hl(.a(p),.b(q),.y(r));
initial
begin
p = 1'b0;
q = 1'b0;
#100
p = 1'b0;
q = 1'b1;
#100
p = 1'b1;
q = 1'b0;
#100
p = 1'b1;
q = 1'b1;
end
initial
$monitor($time    ,"a = '%b',  b = '%b',  y = '%b' ", p,q,r);
endmodule
