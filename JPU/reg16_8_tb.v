module reg16_8tb ();
  reg clock;
  wire [15:0] O_dataA;
  wire [15:0] O_dataB;
  reg enable;
  reg enable_write;
  reg enable_read;
  reg [2:0] rd_wr_addrA;
  reg [2:0] rd_wr_addrB;
  reg [15:0] data_in;

  always begin
    #1 clock =! clock;
  end

  initial begin
    $dumpfile("reg16_8tb.vcd");
    $dumpvars;
    clock=0;
    enable=1;
    enable_write = 1;
    enable_read = 0;
    rd_wr_addrA=3'b001;
    data_in=16'hff31;
    #10
    rd_wr_addrA=3'b011;
    data_in=16'h6543;
    #10
    enable_write=0;
    enable_read=1;
    rd_wr_addrA=3'b001;
    rd_wr_addrB=3'b011;
    #10
    $finish;
  end
  reg16_8 myreg(clock,enable_write,enable,data_in,enable_read,
    O_dataA,O_dataB,rd_wr_addrA,rd_wr_addrB);






endmodule // reg16_8tb
