module HA_g(output s,c, input a,b);
xor(s,a,b);
and(c,a,b);
endmodule


module HA_d(output s,c, input a,b);
assign s = a^b;
assign c = a&b;
endmodule

