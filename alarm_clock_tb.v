module alarm_clock_tb();
reg a_on,a_off,clk;
wire a_out;

alarm_clock ac1(.clk(clk),.a_off(a_off),.a_on(a_on),.a_out(a_out));

initial
begin a_on=1'b0;a_off=1'b0;clk=1'b0; end

always #5 clk=~clk;

initial
begin
#10 a_on = 1'b1;
#190 a_off = 1'b1;
end

initial
begin
$monitor("\t time=%d   a_on = %b  a_off = %b  a_out = %b  ns.ac1=%b", $time,a_on,a_off,a_out,ac1.ns);
#1000 $stop;
end

endmodule

  
