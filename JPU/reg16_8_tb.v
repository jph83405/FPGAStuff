module reg16_8tb ();
  reg clock;
  wire [15:0] O_dataA;
  reg enable_write;
  reg enable_read;
  reg [2:0] rd_wr_addr;
  reg [15:0] data_in;

  always begin
    #1 clock =! clock;
  end

  initial begin
    $dumpfile("reg16_8tb.vcd");
    $dumpvars;
    clock=0;
    enable_write = 1;
    enable_read = 0;
    rd_wr_addr=3'b001;
    data_in=16'hff31;
    #10
    enable_write=0;
    enable_read=1;
    rd_wr_addr=3'b001;
    #10
    $finish;
  end
  reg16_8 myreg(clock,enable_write,data_in,enable_read,
    O_dataA,rd_wr_addr);






endmodule // reg16_8tb
