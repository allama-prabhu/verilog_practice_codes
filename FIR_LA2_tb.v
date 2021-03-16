module FIR_LA2_tb();
reg clk,en;
reg signed [7:0] in;
wire signed [7:0]out;
FIR_LA2 f1(.clk(clk),.en(en),.in(in),.out(out));
initial 
begin
clk =1;
en =1;
end
always #15 clk =~clk;
initial 
begin
in = -8;  #30;
in = 0; #30;
in = 24;  #30;
in = -16;  #30;
in = 48; #30;
in = -56; #30;
in = 16;  #30;
in = 0; #30;
in = 80;  #30;
in = -24;  #30;
in = 8;  #30;
in = 16;  #30;
in = -48;  #30;
in = 0;  #30;
in = -8;  #30;
in = 8;  #30;
in = 16;  #30;
in = 0;  #30;
in = -8;  #30;
in = 40;  #30;
in = 8;  #30;
end  
initial
begin
$monitor($time,"\t input  %d  output is %d ", in , out);   
#2000 $stop;
end
endmodule