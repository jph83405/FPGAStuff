`timescale 1ns / 1ns

module RandomGenTB ();
  reg Clk;
  reg Rst;
  wire [12:0] RandomValue;

  always begin
    #1
    Clk<=!Clk;
  end

  RandomGen RandomGenerator(Clk, Rst, RandomValue);

  initial begin
  $dumpfile("RandomGenTB.vcd");
  $dumpvars;
  Clk <= 0;
  Rst <= 1;
  #5
  Rst<=0;
  end

endmodule // RandomGenTB
