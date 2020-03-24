`timescale 1ns / 1ns

module ReactionTimeTB();

reg Start;
reg Clk;
reg LCDAck;
reg Rst;
reg [12:0] RandomValue;
wire [9:0] ReactionTime;
wire [7:0] LED;
wire Cheat;
wire Slow;
wire Wait;
wire LCDUpdate;

ReactionTimer MyReactionTimer(Clk, Rst, Start, LED, ReactionTime, Cheat, Slow, Wait, RandomValue, LCDUpdate, LCDAck);

always begin
#1
Clk<=!Clk;
end

initial begin
$dumpfile("ReactionTimeTB.vcd");
$dumpvars;
Clk<=0;
Start<=0;
LCDAck<=0;
Rst<=1;
RandomValue<=1200;
#5//enter WAIT state
Start<=1;
Rst<=0;
#10//Stay in WAIT state
Start<=0;
#3000//Enter COUNTER state
Start<=1;
#10
Start<=0;
#200//Back to wait state
Start<=1;
#10
Start<=0;
#10//Test RST
Rst<=1;
LCDAck<=1;
#10
Rst<=0;
LCDAck<=0;
#10//enter WAIT
Start<=1;
#10
Start<=0;
end
endmodule
