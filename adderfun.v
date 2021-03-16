//2 bit adder using functions for half adder and full adder.
module adderfun(r,p,q,En);
input [1:0] p,q;
output [2:0] r;
reg [2:0] r,c;
integer i;
input En;
always@(posedge En)
begin
	for(i=0;i<2;i=i+1)
	begin
		if(i==0) c[i] = 1'b0; //carry_in would be zero
		{c[i+1'b1],r[i]} = fa(p[i],q[i],c[i]);
	end
		r[2] = c[2];
		$display("t=%0d,En=%b,p=%b,q=%b,r=%b",$time,En,p,q,r);
end

function [1:0] ha;
input a,b; //inputs are local to this function only
ha = {a&b,a^b};
endfunction

//understanding of proper instantiation of the full adder module helps doing this
function [1:0] fa;
input a,b,c;
reg [1:0] a1,a2,aa2;
begin //missed this while writing for the first time. multiple statements must be enclosed within begin and end
a1 = ha(a,b); //a1[0]-->sum  (a^b), a1[1]-->carry (a&b)
a2 = ha(a1[0],c); //a2[0]--> sum (a^b^c), a2[1]-->carry (a^b)&c
aa2[1] = (a1[1]|a2[1]);//aa2[1] --> carry_out
aa2[0] = a2[0];//assigning the sum to aa2
fa = aa2;
end
endfunction


endmodule
