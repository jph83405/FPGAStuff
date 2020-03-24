`timescale 1ns / 1ns
// Generate a 1 kHz clock from 50 MHz clock
module ClkDiv(Clk, Rst, ClkOut);

   input Clk, Rst;
   output reg ClkOut;

   reg [15:0] Counter;

   always @(posedge Clk) begin
   if(Rst) begin
    Counter<=0;
    ClkOut<=0;
  end
  else begin
    if(Counter==5) begin
      ClkOut<=!ClkOut;
      Counter<=0;
    end
    else
      Counter<=Counter+1;
  end
  end

  endmodule
