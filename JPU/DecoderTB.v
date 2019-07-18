module DecoderTestBench ();
reg [15:0] instruction;
reg clk;
reg enable;
wire [3:0] alu_Op;
wire [7:0] Immediate_data;
wire [2:0] regA_sel;
wire[2:0] regB_sel;
wire [2:0] regD_sel;
wire write_enable;

always begin
#1
  clk =! clk;
end

initial begin
  $dumpfile("DecoderTB.vcd");
  $dumpvars;
  clk=0;
  enable=1;
  instruction=16'hf342;
  #10
  instruction=16'h3412;
  #10
  instruction=16'h7801;
  $finish;
end
Decoder myDecoder(instruction,clk,enable,alu_Op,Immediate_data
  ,regA_sel,regB_sel,regD_sel,write_enable);

endmodule // DecoderTestBench
