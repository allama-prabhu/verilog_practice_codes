module square_wave_gen(clk,rst,s_wave);
input clk,rst;
reg [4:0] count;
output reg s_wave;
parameter dur=3'd5;

parameter s_off = 1'b0, s_on = 1'b1;

reg ps,ns;

always@(posedge clk)
begin
if(rst)
begin ps <= s_off; end
else
ps <= ns;
end

always@(clk or ps)
begin
case(ps)
s_off:  begin

			if(count < dur)
			begin s_wave <= 1'b0; ns <= s_off; count <= count+1'b1; end
			else
			begin s_wave <= 1'b1; ns <= s_on ; count <= 1'b0; end

			end

s_on:   begin

		if(count < dur)
			begin s_wave <= 1'b1; ns <= s_on; count <= count+1'b1; end
			else
			begin s_wave <= 1'b0; ns <= s_off ; count <= 1'b0;end

			end

endcase
end

endmodule

