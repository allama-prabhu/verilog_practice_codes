module counter_LA_2(count,rec,fec,clk,rst);
output reg [4:0] count;
output reg [3:0] rec,fec;
input clk,rst;

always@(posedge clk)
begin
rec<=rec+1'b1;
if(rec==4'b1010)
rec<=4'b0;
end

always@(negedge clk)
begin
fec<=fec+1'b1;
if(fec==4'b0101)
fec<=4'b0;
end

always@(clk)
begin

if(rst==1'b0)
begin
count<=5'b0;
rec<=4'b0;
fec<=4'b0;
end

else if(rec==4'b1010|fec==4'b0101)
begin
count<=count+1'b1;
end

else
count<=count;

end

endmodule
