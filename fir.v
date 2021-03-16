module fir(clk,en,in,out);
input clk;
input en;
input signed [7:0] in;
output signed [7:0]out;
reg [7:0] out;
parameter count= 8;

reg signed [14:0] tmpout;
reg signed [7:0] prevdatain [8:0];
reg [7:0] clk_count;
integer i;

initial
begin
clk_count = 0;
out = 0;
for(i=1;i<9;i=i+1)
  prevdatain[i] = 8'b0;
//$display("prev=%p",prevdatain);
end

always @(posedge clk)
 if(en)
  begin
   if(clk_count < count)
     begin		
     tmpout = ((in-prevdatain[clk_count+1])/8);
     prevdatain[clk_count+1] = in;
     $display("prev=%p",prevdatain);
     clk_count = clk_count+1;
     out = tmpout + out;
     end
   
   else
     begin
     tmpout = ((in - prevdatain[clk_count-7])/8);
     prevdatain[clk_count-7] =in; 
     clk_count = 1;
     out = tmpout + out;
     end

  end

endmodule
