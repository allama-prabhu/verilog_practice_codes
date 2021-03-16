//demux14testbench for data level
module demux14test();
reg I;
reg [1:0] S;
wire [3:0] Y;
demux1to4d dm1(.I(I),.S(S),.Y(Y));
initial 
begin
I = 1'b1;
#100 S[1]=1'b0;S[0]=1'b0;
#100 S[1]=1'b0;S[0]=1'b1;
#100 S[1]=1'b1;S[0]=1'b0;
#100 S[1]=1'b1;S[0]=1'b1;
end
initial
#115 $strobe ("The simulation time=%0t\n and S=0x%0h\n I=0x%0h\n", $time, S, I);
endmodule


//demux14testbench for gate level
module demux14gatetest();
reg I;
reg [1:0] S;
wire [3:0] Y;
demux1to4g dm2(.I(I),.S(S),.Y(Y));
initial 
begin
I = 1'b1;
#100 S[1]=1'b0;S[0]=1'b0;
#100 S[1]=1'b0;S[0]=1'b1;
#100 S[1]=1'b1;S[0]=1'b0;
#100 S[1]=1'b1;S[0]=1'b1;
end
initial
#165 $strobe  ("The simulation time=%0t\n and S=0x%0h\n I=0x%0h\n", $time, S, I);
endmodule
