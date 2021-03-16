module xor_gtest();
reg a,b;
wire y;
xor_glvl hl(.a(a),.b(b),.y(y));
//xor_dlvl hl(.a(a),.b(b),.y(y));
initial 
begin
a = 1'b0;
b = 1'b0;
#100
a = 1'b0;
b = 1'b1;
#100
a = 1'b1;
b = 1'b0;
#100
a = 1'b1;
b = 1'b1;
end
initial
$monitor($time    ," a = '%b',  b = '%b',  y = '%b' ", a,b,y);
endmodule

