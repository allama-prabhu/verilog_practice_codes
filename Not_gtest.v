module notgtest();
wire y;
reg a;
notglvl hl(.a(a),.y(y));
initial 
begin
a = 1'b0;
#100
a = 1'b1;
end
initial 
$monitor( $time    ,"a = '%b',  y = '%b' ", a, y);
endmodule

