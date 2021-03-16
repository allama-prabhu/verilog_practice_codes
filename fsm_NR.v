module fsm_NR (clk, RESET, A, B, N, R);
input clk, RESET, A, B;
output N, R;
reg R, next_R, N;
reg[1:0] state, next_state;
parameter X = 2'b00, Y = 2'b01, Z = 2'b10;


always@(posedge clk or posedge RESET)
if (RESET)
begin
state <= X;
R <= 1'b0;
end
else
begin
state <= next_state;
R <= next_R;
end


always@(state or A or B)
begin
N = 1'b0;
case (state) 
X: 	if (A)
	next_state = Y;
	else
	next_state = Z;
Y: 	if (B)
	begin
	next_state = Z;
	N = 1'b1;
	end
	else
	next_state = Y;

Z: 	if (A)
	next_state = Y;
	else
	begin
	next_state = X;
	N = 1'b1;
	end
default: next_state = 2'bxx;

endcase
end

always@(next_state or B)
case(next_state)
X: next_R = 1'b0;
Y: next_R = 1'b1;
Z: next_R = 1'b0;
default: next_R = 1'bx;
endcase


endmodule

