`timescale 1ns / 1ns


module Clk_Divided_RandomGenTB();

reg Clk;
reg DivRst;
reg Rst;
reg Start;
reg LCDAck;
wire [9:0] ReactionTime;
wire [7:0] LED;
wire Cheat;
wire Slow;
wire Wait;
wire LCDUpdate;
wire [12:0] RandomGen;
wire ClkOut;

RandomGen RandomGen_1(Clk,Rst,RandomGen);
ClkDiv ClockDiv(Clk,DivRst,ClkOut);
ReactionTimer MyReactionTimer(Clk, Rst, Start, LED, ReactionTime, Cheat, Slow, Wait, RandomGen, LCDUpdate, LCDAck);

always begin
#1
Clk<=!Clk;
end

initial begin
  $dumpfile("Clk_Divided_RandomGenTB.vcd");
  $dumpvars;
  Clk<=0;
  DivRst<=1;
  Rst<=1;
  Start<=0;
  LCDAck<=0;
  #100
  DivRst<=0;
  Rst<=0;
  Start<=1;


end
endmodule
