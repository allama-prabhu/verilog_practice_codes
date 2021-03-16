
//module nand_glvl(output y, input a,b);
//nand(y,a,b);
//endmodule

module nand_dlvl(output y, input a,b);
assign y = ~(a&b);
endmodule
