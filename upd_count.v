module upd_count(clk,rst,N,count,count_up);
input count_up;
input clk,rst;
input [3:0] N;
output reg [3:0] count;

always@(posedge clk or negedge rst)
if(rst)
count<=0;

else if(count_up==1'b1)
begin
count<=count+1'b1;
if(count==N)
count<=4'b0;
end

else
begin
count<=count-1'b1; //decrement the count value by 1 in each case.
if(count==4'b0)
count<=count; //keep the previous value of the count only.
end

endmodule

