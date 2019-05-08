module GenericMux (
    input [1:0] cs,
    input signal_one,
    input signal_two,
    input signal_three,
    input signal_four,
    output reg out
    );
    always @ (cs or signal_one or signal_two or signal_three or signal_four  ) begin
    case(cs)
      0:  out =signal_one;
      1:  out =signal_two;
      2:  out = signal_three;
      3:  out = signal_four;
      default out=0;
    endcase
    end

endmodule // Mux
