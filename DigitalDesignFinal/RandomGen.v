`timescale 1ns / 1ns

module RandomGen(Clk, Rst, RandomValue);

   input Clk, Rst;
   output [12:0] RandomValue;

   reg [12:0] Counter = 1000;

   assign RandomValue=Counter;

   always @(posedge Clk)
   begin
    if(Rst)
    begin
      Counter <= 1000;
    end
    else begin
      if(Counter > 3000)
      begin
        Counter <= 1000;
        end
        Counter++;
      end
   end

endmodule
