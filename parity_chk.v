module parity_chk(a,en,chk);
input [7:0] a;
input en;
output chk;
wire [7:0] a;
reg chk;
always@(posedge en)
begin
	chk = pb(a); //every time it passes a 8 bit number as input to the function pb.
	$display("t=%0d, a = %b, en = %0b, pb = %0b",$time,a,en,chk);//%0b and all help us minimize the space utilized.
end

function pb; //pb will itself be alloted a register inside the memory, so need not have any outputs declared for the function.
input [7:0] a;
pb = ^a;
endfunction

endmodule

//a function will usually have atleast one input and no outputs. It has to be declared within the module-endmodule itself.