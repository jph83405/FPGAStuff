`timescale 1ns / 1ns

module ReactionTimer(Clk, Rst, Start, LED, ReactionTime, Cheat, Slow, Wait, RandomValue, LCDUpdate, LCDAck);

  parameter BEGIN = 0;
  parameter WAIT = 1;
  parameter COUNTER = 2;
  parameter CHEAT = 3;
  parameter LOSE = 4;
  parameter WIN = 5;



  input Start, LCDAck, Clk, Rst;
	input [12:0] RandomValue;
  output reg [9:0] ReactionTime;
	output reg [7:0] LED;
  output reg Cheat, Slow, Wait;
	output reg LCDUpdate;

  reg [12:0] Wait_Debouncer; //debounce the wait start button (otherwise fast WAIT -> CHEAT)
  reg [12:0] Win_Debouncer; //debounce the win start button (otherwise fast WIN-> WAIT)
  reg [12:0] Cheat_Debouncer;
  reg [2:0] State_Reg;
  reg [12:0] Wait_Reg;
  reg RecAck;

  always @ (posedge Clk)
  begin

    if(Rst) begin
      State_Reg<=BEGIN;
      RecAck<=0;
      //Wait<=0;
    end

    else begin
      case (State_Reg)

        BEGIN: begin
          LED<=0;
          Cheat<=0;
          Slow<=0;
          Wait<=0;
          if(!RecAck)//todo finish handshaking
            LCDUpdate<=1;
          if(LCDAck) begin
            RecAck<=1;
            LCDUpdate<=0;
          end
          Wait_Debouncer<=0;
          Win_Debouncer<=0;
          Cheat_Debouncer<=0;
          Wait_Reg<=0;
          ReactionTime<=0;
          if(Start) begin
            State_Reg<=WAIT;
            RecAck<=0;
          end
          else begin
            State_Reg<=BEGIN;
          end
        end

        WAIT: begin
          Win_Debouncer<=0;
          Wait_Debouncer<=Wait_Debouncer+1; //Confirm button has stopped bouncing, we wait 100 ms
          Wait_Reg<=Wait_Reg+1; //keep track of elapsed time for cheating
          if(!Wait) begin
            Wait<=1;
            LCDUpdate<=1;
          end
          Slow<=0;
          Cheat<=0;
          ReactionTime<=0;
          LED<=0;
          if(LCDAck==1)
            LCDUpdate<=0;
          if(Wait_Reg==RandomValue) //check that we've reached the random wait time
            State_Reg<=COUNTER;
            Wait<=0;
            Wait_Debouncer<=0;
          else if(Wait_Debouncer>500 && Start) //check for early button press
            State_Reg<=CHEAT;
            Wait<=0;
            Wait_Debouncer<=0;
          else
            State_Reg<=WAIT;
        end

        COUNTER: begin
          Wait_Reg<=0;
          Wait<=0;
          Wait_Debouncer<=0;
          LED<=8'b11111111;
          ReactionTime++;
          if(ReactionTime>500)
            State_Reg<=LOSE;
          else if (Start)
            State_Reg<=WIN;
          else
            State_Reg<=COUNTER;
        end

        CHEAT: begin
          if(!Cheat) begin
            Cheat<=1;
            LCDUpdate<=1;
          end
          Wait<=0;
          //LCDUpdate<=1;
          Cheat_Debouncer<=Cheat_Debouncer+1;
          if(LCDAck)
            LCDUpdate<=0;
          if(Start && Cheat_Debouncer>500)
            State_Reg<=WAIT;
            Cheat<=0;
            Cheat_Debouncer<=0;
          else
            State_Reg<=CHEAT;
        end

        LOSE: begin
        if(!Slow) begin
          Slow<=1;
          LCDUpdate<=1;
        end
          if(LCDAck)
            LCDUpdate<=0;
          if(Start)
            State_Reg<=WAIT;
          else
            State_Reg<=LOSE;
        end

        WIN: begin
          if(!RecAck)
            LCDUpdate<=1;
          Win_Debouncer<=Win_Debouncer+1;
          if(LCDAck)
            LCDUpdate<=0;
            RecAck<=1;
          if(Start && Win_Debouncer>100)
            State_Reg<=WAIT;
          else
            State_Reg<=WIN;
        end



      endcase
      end
    end

  endmodule
