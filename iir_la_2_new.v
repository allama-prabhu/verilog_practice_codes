// Code your design here
module iir_la_2_new(x_in,y_out,clk,rst);
parameter N = 14;
input signed [N:0] x_in;
output signed [N:0] y_out;
 wire signed [N:0] y_out;
input clk,rst;
  wire [N:0] w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11;
  assign w1 = x_in * (3/8);
  dff d5 (w9,clk,rst,w10);
  adder a3 (w1,w10,w11);
  assign w9 = x_in * (9/64);
  assign w3 = x_in * 1;
  dff d1 (w11,clk,rst,w2);
  adder a1 (w2,w3,w4);
  dff d2 (w4,clk,rst,w5);
  adder a2 (w5,w6,y_out);
  assign w6 = w7*(27/512);
  dff d3 (w8,clk,rst,w7);
  dff d4 (y_out,clk,rst,w8);
endmodule

module adder (m,n,o);
	parameter N = 14;
  	input [N:0] m;
  	input [N:0] n;
  	output [N:0] o;
  	assign o = m+n;
endmodule

module dff(D,clk,reset,Q);
  	parameter N = 14;
  	input [N:0]D; // Data input 
	input clk; // clock input 
	input reset; // synchronous reset 
  output reg [N:0]Q; // output Q 
	always @(posedge clk) 
	begin
	 if(reset==1'b1)
	  Q <= 0; 
	 else 
	  Q <= D; 
	end 
endmodule

