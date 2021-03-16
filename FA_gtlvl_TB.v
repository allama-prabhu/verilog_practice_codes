module FA_gtlvl_TB();
reg [2:0] in;
wire Sum,C_out;
//FA_gtlvl FA1(.A(in[2]),.B(in[1]),.C(in[0]),.Sum(Sum),.C_out(C_out));
//FA_gl_gnd FA2(.A(in[2]),.B(in[1]),.C(in[0]),.Sum(Sum),.C_out(C_out));
FA_gl_vdd FA3(.A(in[2]),.B(in[1]),.C(in[0]),.Sum(Sum),.C_out(C_out));

initial
begin
in = 3'b0;
end

always
begin
#10 in = in+1'b1;
end

initial
begin
$monitor($time," A = %b : B = %b : C = %b : Sum = %b : Carry = %b ",in[2],in[1],in[0],Sum,C_out);
#100 $stop;
end

endmodule



