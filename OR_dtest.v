module ordtest();
reg p,q;
wire r;
ordlvl hl(.y(r),.a(p),.b(q));
initial
begin
p = 1'b0;
q = 1'b0;
#200
p = 1'b0;
q = 1'b1;
#200
p = 1'b1;
q = 1'b0;
#200
p = 1'b1;
q = 1'b1;
end
endmodule
