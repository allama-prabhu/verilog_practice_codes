module xor_glvl(output y, input a,b);
xor(y,a,b);
endmodule


module xor_dlvl(output y, input a,b);
assign y = a ^ b;
endmodule


