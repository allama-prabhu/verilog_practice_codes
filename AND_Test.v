module AND_test();
reg p,q;
wire r;
AND_logic hl(.a(p),.b(q),.y(r)); //hl is the module instance identifier, if it's not included here it will throw an error during simulation.
initial
begin 
p = 1'b0;
q = 1'b0;
#100;
p = 1'b0;
q = 1'b1;
#100;
p = 1'b1;
q = 1'b0;
#100;
p = 1'b1;
q = 1'b1; //if we do not include the #100 here then all these inputs will be executed sequentially and only p,q condition in the last statement will be executed.
end
endmodule
