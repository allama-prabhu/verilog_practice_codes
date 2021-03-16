module swap_TB();
reg clk,w;
wire r1in,r1out,r2in,r2out,r3in,r3out;
wire done;

//swap st1(.clk(clk),.w(w),.r1in(r1in),.r1out(r1out),.r2in(r2in),.r2out(r2out),.r3in(r3in),.r3out(r3out),.done(done));
swap_check st2(.clk(clk),.w(w),.r1in(r1in),.r1out(r1out),.r2in(r2in),.r2out(r2out),.r3in(r3in),.r3out(r3out),.done(done));

initial
begin
clk  = 1'b0;
w    = 1'b0;
//r1in = 1'b0;r1out=1'b0;r2in=1'b0;r2out=1'b0;r3in=1'b0;r3out=1'b0;
end

always #5 clk=~clk;

initial
begin
#10 w=1'b1;
//#10 r1in=1'b0;r1out=1'b1;r2in=1'b1;r2out=1'b1;r3in=1'b1;r3out=1'b0;
//#10 r1in=1'b0;r1out=1'b1;r2in=1'b1;r2out=1'b1;r3in=1'b1;r3out=1'b0;
//#10 r1in=1'b1;r1out=1'b0;r2in=1'b0;r2out=1'b0;r3in=1'b0;r3out=1'b1;
end

initial
begin
$monitor( " $time = %d , w=%b , r1in=%b , r1out=%b , r2in=%b , r2out=%b , r3in=%b , r3out=%b done=%b", $time,w,r1in,r1out,r2in,r2out,r3in,r3out,done);
#1000 $stop;
end

endmodule

