module binary_counter(Q,clk,rst);
input clk,rst;
output reg [2:0] Q;
always@(posedge clk)
begin 
	if(rst)
	begin
	Q <= 3'b0;
	end
	else
	begin
	Q <= Q + 1'b1;
	end
end
endmodule

module decoder_38(A,T,rst,clk);
input [2:0] A;
output reg [7:0] T;
binary_counter b1(.Q(A),.clk(clk),.rst(rst));
input clk,rst;
reg [3:0] ton;
always@(posedge clk)
begin 
ton = ton+1'b1;
case(A)
'd0: begin
	if(ton==1'b1)
	T[0]=1'b1;
	else if ((1<ton)&&(ton<5))
	T[0]=1'b0;
	else
	ton = 1;
	T[0] = 1'b1;
     end

default: $display("This is shit");

endcase
end
endmodule
