module test_filter(clk,filter_in,filter_out);

parameter W=7;    // bit width - 1 (8-1)

parameter signed a=10'b0100000000; //256
parameter signed one_minus_a=11'b01100000000; //768
input   clk; 
input   signed  filter_in; 
output  signed  filter_out;


reg signed  y;
reg signed  x;
//two registers i'm storing the values with.

initial
begin
    x=0;
    y=0;
end
    
always@(posedge clk)
    begin
    x <= filter_in;
    y <= (one_minus_a*x) + (a*y);    // y=(1-a)*x+(a*y)
    end
       

assign filter_out=y;
endmodule  // test_filter