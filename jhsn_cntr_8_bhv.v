module jhsn_cntr_8(clk,rst,out);
input clk,rst;
output [7:0] out;
reg [7:0] q;

always@(posedge clk)
begin
if(rst)
q=8'd0;
else
 begin 
	q[7]<=q[6];
	q[6]<=q[5];
	q[5]<=q[4];
	q[4]<=q[3];
 	q[3]<=q[2];
  	q[2]<=q[1];
  	q[1]<=q[0];
   	q[0]<=(~q[7]);
 end
 
end
 
assign out=q;  
endmodule


//test bench for johnson counter
module jc_tb();
reg clk,rst;
wire [7:0] out;
  
jhsn_cntr_8 jc1(.out(out), .rst(rst), .clk(clk));

always 
#5 clk =~clk;
  
initial 
begin
rst=1'b1; 
clk=1'b0;
#20 rst= 1'b0;
end
  
initial 
begin 
$monitor( $time, " clk=%b, out= %b, rst=%b", clk,out,rst);
#105  $stop;  
end
 
endmodule
