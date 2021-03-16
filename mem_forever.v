module mem_forever(clk,rst);
reg [7:0] m [7:0];
input clk,rst;
integer i;

always@(posedge clk)

if(rst)
begin

begin:reset
i=0;
forever
	begin
	if(i>=8) disable reset;
	m[i]=8'b0;
	$display("resetting : tt=%0d, mm[%0d]=%0d", $time,i,m[i]);
	i=i+1;
	end
end
begin
i=0;
end

end

else if(i<8)
begin
i=0;
begin: load
forever
	begin
	if(i>=8) disable load;
	m[i]=i*8;
	$display("initializing : tt=%0d, mm[%0d]=%0d", $time,i,m[i]);
	i=i+1;
	end
end

end

//else

//begin: reading

//for(i=0;i<8;i=i+1)
//	begin
//	$display("Reading:  tt=%0d, mm[%0d]=%0d", $time,i,m[i]);
//	if(i>=7) disable reading;
//	end
//	
//end

endmodule
