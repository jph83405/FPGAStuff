module mux_tb ();
  reg sig_one;
  reg sig_two;
  reg sig_three;
  reg sig_four;
  wire o;
  reg [1:0] sel;
  initial begin
    $dumpfile("mux_test.vcd");
    $dumpvars;
    sel=2'b10;
    sig_one = 1'b1;
    sig_two = 1'b0;
    sig_three = 1'b1;
    sig_four = 1'b0;
    #10 sel=2'b01;
    #10 sel=2'b11;
    $finish;
  end
  GenericMux testMux (sel,sig_one,sig_two,sig_three,sig_four,o);

endmodule // mux_tb
