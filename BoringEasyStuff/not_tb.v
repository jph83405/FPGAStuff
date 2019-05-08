//#include 'notGate';
module myModule_tb();
  wire out;
  reg clock;



  always begin
    #1 clock =! clock;
  end

  initial begin
    $dumpfile("test.vcd");
    $dumpvars;
    //initialize clock
    clock=0;

    //End sim
    #10
    $finish;
  end
  notGate notGateTest(clock, out);
endmodule
