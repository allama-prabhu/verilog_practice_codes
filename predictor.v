module predictor(clock, reset, taken, predict);

input clock, reset, taken;

output predict;

parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
reg r;

reg [1:0] ps,ns;

always@(posedge clock or reset)
begin
if(reset)
ps<=s0;
else
ps<=ns;
end

always @(ps)
begin
      
   case (ps)
       s0 : begin
           r   <= 1'b1;
           if (!taken)
               ns <= s1;
           else
               ns <= s0;
           end

       s1 : begin
           r   <= 1'b1;
           if (!taken)
               ns  <= s2;
           else
               ns  <= s0;
           end

       s2 : begin
           r   <= 1'b0;
           if (taken)
               ns  <= s3;
           else
               ns  <= s2;
           end

       s3 : begin
           r   <= 1'b0;
           if (taken)
               ns  <= s0;
           else
               ns  <= s2;
           end

       default:    ns  <= s0;

   endcase
   end

assign predict = r;

endmodule



