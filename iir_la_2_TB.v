module iir_la_2_TB();

// Inputs
reg clk;
reg rst;
reg [14:0] pin;

// Outputs
wire [14:0] dataout;

// Instantiate the Unit Under Test (UUT)
iir_la_2_new uut (.x_in(pin),.clk(clk),.rst(rst),.y_out(dataout));

initial begin
// Initialize Inputs
clk = 0;
rst = 0;
pin = 0;
end

always 
#10 clk =~ clk;

initial
begin
#15 rst = 1'b1;
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
$monitor($time, "dataout = %d", dataout);
#3000 $stop;
end


endmodule
