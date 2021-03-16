module parity_tst();
reg [7:0] a;
reg en;
wire chk;
integer i;

parity_chk pchk(.a(a),.en(en),.chk(chk));
initial #0 en = 1'b0;
always #2 en = ~en;
initial
begin
	#1 a = 8'h00;
	for(i=0;i<8;i=i+1)
	begin
		#4 a = a+4'o6;
	end
end
initial #40 $stop;
endmodule
