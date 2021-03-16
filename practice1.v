module practice1(xy,ab,f);
input [1:0]xy,ab;
output reg f;

always@(ab)
case(ab)
2'b00:begin
      assign f = ab[1] & ab[0];
      $display(" and"); end
2'b01:begin
      assign f = ab[1] | ab[0];
      $display(" or"); end
2'b10:begin
      assign f =~ (ab[1] | ab[0]);
      $display(" nor"); end
2'b11:begin
      assign f =~ (ab[1] & ab[0]);
      $display(" nand"); end
endcase


endmodule

