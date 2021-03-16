module HA_gtest();
reg a,b;
wire s,c;
HA_g hl(.a(a),.b(b),.s(s),.c(c));
//HA_d hl(.a(a),.b(b),.s(s),.c(c));
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
$monitor($time    ,"a = '%b',  b = '%b',  sum = '%b', carry = '%b ", a,b,s,c);
endmodule

