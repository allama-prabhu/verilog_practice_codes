module notdtest();
reg a;
wire y;
notdlvl hl(.a(a), .y(y));
initial
begin
a = 1'b0;
#100
a = 1'b1;
end
endmodule
