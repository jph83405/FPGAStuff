module adderOne(input aOne,input bOne, input carryInOne,
  output sumOne, output carryOutOne);

  assign {carryOutOne,s}=aOne+bOne+carryInOne;

endmodule
