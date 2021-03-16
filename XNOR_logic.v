module xnor_glvl(output y, input a,b);
xnor(y,a,b);
endmodule

module xnor_dlvl(output y, input a,b);
assign y = ~(a^b);
endmodule

