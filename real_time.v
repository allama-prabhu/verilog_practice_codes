module real_time(clk,rst,sec,min,hr);
input clk,rst;
output [5:0]sec,min;
output [4:0]hr;
reg [5:0]sec,min;
reg [4:0]hr;
always@(posedge(clk) or posedge(rst))
begin
if (rst==1'b1)
begin
sec=0;
min=0;
hr=0;
end
else if (clk==1'b1)
begin
sec=sec+1;
if (sec==60)
begin
sec=0;
min=min+1;
if (min==60)
begin
min=0;
hr=hr+1;
if (hr==24)
begin
hr=0;
end
end
end
end
end
endmodule