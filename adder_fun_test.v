module adder_fun_test();
reg [1:0] p,q;
wire [1:0] r;
reg En;
adderfun af1(.r(r),.p(p),.q(q),.En(En));
always #2 En = ~En;

initial
begin
En = 1'b0; p = 2'b01; q = 2'b00;
#5 p = 2'b10; q = 2'b10;
#4 p = 2'b10; q = 2'b11;
#4 p = 2'b11; q = 2'b11;
#4 p = 2'b01; q = 2'b01;
end

initial #30 $stop;
endmodule
