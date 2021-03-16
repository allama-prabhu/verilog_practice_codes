module iir_LA_2_tb_a();
reg [14:0] pin;
reg clk;
wire [14:0] qin;

//iir_basic iir1(.pin(pin),.qin(qin),.clk(clk),.rst(rst));
iir_la_2 ii3(.x_in(pin),.y_out(qin),.clk(clk));

initial
begin
clk = 1'b1;
pin = 8'b0;
end

always 
#10 clk =~ clk;

initial
begin
pin = 1000;
#20 pin = 4; 
#20 pin = 1; 
#20 pin = 5; 
#20 pin = 11; 
#20 pin = 233;
#20 pin = 543; 
#20 pin = 23;  
#20 pin = 44;  
#20 pin = 12;  
#20 pin = 43;  
end

initial
begin
$monitor($time," input is %d,  output is %d", pin,qin);
#2000 $stop;
end

endmodule
 
//x = %d , x1 = %d , x2 = %d , x3 = %d , temp = %d, y1=%d , y2=%d , y3=%d ,ii3.x,ii3.x1,ii3.x2,ii3.x3,ii3.temp,ii3.y1,ii3.y2,ii3.y3,