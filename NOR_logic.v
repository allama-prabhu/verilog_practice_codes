module nor_glvl(output y, input a,b);
nor(y,a,b);
endmodule

module nor_dlvl(output y, input a,b);
assign y = ~(a|b);
endmodule

