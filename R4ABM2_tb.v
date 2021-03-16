// b2i1=b[2] ; b2i=b[1] ; b2im1=b[0] 
// aj = a[1] ; ajm1 = a[0]
module R4ABM2_tb();
reg [2:0] b;
reg [1:0] a;
wire PP;
integer i;

R4ABM2 R42(.PP(PP),.ai(a[1]),.b2i1(b[2]));

initial
begin
a = 0;
b = 0;
end

initial
#20 a = 2'b11;

always
begin
for(i=0;i<8;i=i+1)
begin
#20 b=b+1;
end
end

initial
$monitor($time, "aj = %b ajm1=%b b2i1=%b b2i=%b b2im1=%b PP=%b", a[1],a[0],b[2],b[1],b[0],PP);

initial
#4000 $stop;

endmodule

