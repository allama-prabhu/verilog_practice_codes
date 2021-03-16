//top module
module Digital_clock(clk,init,seg_sec,seg_min,seg_hour,min,hour,sec);
input clk,init;
output wire [13:0] seg_sec,seg_min,seg_hour;
// [13:7] is the higher seven segment digit and[6:0] is for the lower seven segment digit.
output reg [5:0] min,hour,sec;
reg showmin;
reg showhour;
// 7 seg display connection to hours, min, sec. (two digits each // of 7 bit wide).
disp p1(.seg(seg_sec),.seg_in(sec) );  //seconds display LED.
disp p2(.seg(seg_min),.seg_in(min) );  //minutes display LED.
disp p3(.seg(seg_hour),.seg_in(hour) ); //hours display LED.

always @(posedge clk)
begin

if (init)
begin
sec=6'b0;
min=6'b0;
hour=6'b0;
showmin =1'b0;
showhour=1'b0;
end

if(sec != 6'b111100) //not equal to 60sec then increment.
begin
sec=sec+1'b1;
end

if(sec == 6'b111100)
begin
sec=6'b0;           //reset seconds
showmin =1'b1;      //enabling minutes
end

if (showmin)
begin
if(min != 6'b111100)  //not equal to 60 min then increment.
begin
showmin=1'b0;
min=min+1'b1;         //increment minutes.
end

if(min == 6'b111100)
begin
sec = 6'b0;              //reset the seconds to zero.
min=6'b0;		//reset minutes to 0 after reaching 60 min.
showhour=1'b1;		//enabling the hour.
end

end


if (showhour)
begin

if(hour != 6'b011000)    //if not equal to 24.
begin
showhour=1'b0;          //rest the enabling hour pin.
hour=hour+1'b1;         //increment the hour.
end

if(hour == 6'b011000)
begin
sec= 6'b0;              //if it's equal to 24, reset everything.
min=6'b0;
hour=6'b0;
end

end

end
endmodule


//7-segment display code
module disp(seg,seg_in);
input [5:0] seg_in;  //taking the inputs.
output reg [13:0]seg;  //output for accomodating 2 digits in 7 segment display.

always @*
begin
case(seg_in)
6'd0 : seg = 14'b10000001000000;// 0-led glows; 1-led off
6'd1 : seg = 14'b10000001111001;
6'd2 : seg = 14'b10000000100100;
6'd3 : seg = 14'b10000000110000;
6'd4 : seg = 14'b10000000011001;
6'd5 : seg = 14'b10000000010010;
6'd6 : seg = 14'b10000000000010;
6'd7 : seg = 14'b10000001111000;
6'd8 : seg = 14'b10000000000000;
6'd9 : seg = 14'b10000000011000;
6'd10: seg = 14'b11110011000000;

6'd11: seg = 14'b11110011111001;
6'd12: seg = 14'b11110010100100;
6'd13: seg = 14'b11110010110000;
6'd14: seg = 14'b11110010011001;
6'd15: seg = 14'b11110010010010;
6'd16: seg = 14'b11110010000010;
6'd17: seg = 14'b11110011111000;
6'd18: seg = 14'b11110010000000;
6'd19: seg = 14'b11110010011000;
6'd20: seg = 14'b01001001000000;

6'd21: seg = 14'b01001001111001;
6'd22: seg = 14'b01001000100100;
6'd23: seg = 14'b01001000110000;
6'd24: seg = 14'b01001000011001;
6'd25: seg = 14'b01001000010010;
6'd26: seg = 14'b01001000000010;
6'd27: seg = 14'b01001001111000;
6'd28: seg = 14'b01001000000000;
6'd29: seg = 14'b01001000011000;
6'd30: seg = 14'b01100001000000;

6'd31: seg = 14'b01100001111001;
6'd32: seg = 14'b01100000100100;
6'd33: seg = 14'b01100000110000;
6'd34: seg = 14'b01100000011001;
6'd35: seg = 14'b01100000010010;
6'd36: seg = 14'b01100000000010;
6'd37: seg = 14'b01100001111000;
6'd38: seg = 14'b01100000000000;
6'd39: seg = 14'b01100000011000;
6'd40: seg = 14'b00110011000000;

6'd41: seg = 14'b00110011111001;
6'd42: seg = 14'b00110010100100;
6'd43: seg = 14'b00110010110000;
6'd44: seg = 14'b00110010011001;
6'd45: seg = 14'b00110010010010;
6'd46: seg = 14'b00110010000010;
6'd47: seg = 14'b00110011111000;
6'd48: seg = 14'b00110010000000;
6'd49: seg = 14'b00110010011000;
6'd50: seg = 14'b00100101000000;

6'd51: seg = 14'b00100101111001;
6'd52: seg = 14'b00100100100100;
6'd53: seg = 14'b00100100110000;
6'd55: seg = 14'b00100100010010;
6'd56: seg = 14'b00100100000010;
6'd57: seg = 14'b00100101111000;
6'd58: seg = 14'b00100100000000;
6'd59: seg = 14'b00100100011000;
default:begin seg= 14'b11111111111111 ;
end
endcase
end
endmodule
