module practice1_tb();
reg [1:0]xy,ab;
wire f;
integer i,j;
practice1 p1(xy,ab,f);

initial
begin
xy=2'b00;
ab=2'b00;
end

initial
begin

	for(j=0;j<4;j=j+1)
	begin
	#20 ab=j;
	$display("current value of ab = %b\n",ab);
	end


end

initial
begin
$monitor($time," xy=%b ab=%b f=%b\n",xy,ab,f);
#100 $stop;
end


endmodule

