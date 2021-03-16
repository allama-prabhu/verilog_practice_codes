module srff_bh(q,qbar,S,R,clk);
input S,R,clk;
output reg q,qbar;
always @(posedge clk)
begin

if(S==1'b1)
begin
q<=1'b1;
qbar<=1'b0;
end

else if(R==1'b1)
begin
q<=1'b0;
qbar<=1'b1;
end

else if(S==1'b0 && R==1'b0)
begin
q<=q;
qbar<=qbar;
end

end
endmodule



//testbench for sr flipflop
module srff_tb();
reg S,R,clk;
wire q,qbar;
srff_bh sr1(.q(q),.qbar(qbar),.S(S),.R(R),.clk(clk));

initial
begin
clk = 1'b0;
forever #10 clk =~ clk;
end


initial
begin 
S = 1; R =0;
#100 S=1'b0;R=1'b1;
#100 S=1'b0;R=1'b0;
#100 S=1'b1;R=1'b1;
end

initial
$monitor("sim = %g, S = %b, R = %b, Q = %b, Qbar = %b",clk,S,R,q,qbar);

endmodule
