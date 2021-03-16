module JK_ff_bhv(q,qbar,J,K,clk);
input J,K,clk;
output reg q;
output reg qbar;

always@(posedge clk)
case({J,K})
2'b00: begin q <= q; qbar <= qbar; end
2'b01: begin q <= 0; qbar <= 1; end
2'b10: begin q <= 1; qbar <= 0; end
2'b11: begin q <= ~q; qbar <= ~qbar; end
endcase

endmodule


//testbench for JK flipflop
module JK_ff_tb();
reg J,K,clk;
wire q;
wire qbar;

JK_ff_bhv JK1(.q(q),.qbar(qbar),.J(J),.K(K),.clk(clk));
initial
//initialize the test vectors.
begin
J = 0;
K = 0;
clk = 0;
end

//generate the clock
always 
#50 clk=~clk;

//apply the test vector logics.
initial 
begin
J = 0; K = 1;
#100 J = 0; K = 0;
#100 J = 1; K = 0;
#100 J = 1; K = 1;
end

initial
$monitor($time, "J = '%b'  K = '%b' q = '%b' qbar = '%b'",J,K,q,qbar);

initial
#1000 $stop;

endmodule


