module alarm_clock(clk,a_off,a_on,a_out);
input a_on,a_off,clk;
output reg a_out;

parameter IDLE=4'b0,START=4'b1,END=4'b1010;

reg [3:0] ps,ns;

always@(posedge clk)
begin
if(a_off==1'b1)
ps <= IDLE;
else
ps <= ns;
end

always@(posedge clk)
begin
if(a_off==1'b0 && ns!=END && a_on == 1'b1)
begin ns <= ns+1'b1; a_out <= 1'b1; end

else
begin ns <= IDLE; a_out <= 1'b0; end

end

endmodule
