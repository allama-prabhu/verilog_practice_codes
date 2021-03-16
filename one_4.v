module one_4(i,s,y);
input i;
input [1:0]s ;
output [3:0] y;
wire [3:0] y;
wire w1,w2;
one_2 h1(.i(i),.s(s[1]),.y(w1));//,.y[1](w2));
one_2 h2(.i(w1),.s(s[0]),.y(y[0]));//,.y[1](y[1]));
one_2 h3(.i(w2),.s(s[0]),.y(y[2]));//,.y[1](y[3]));
endmodule


/*module one_2(i,s,y);
input i,s;
output [1:0] y;
wire [1:0] y;
and (y[0],(~s),i);
and (y[1],s,i);
endmodule
*/