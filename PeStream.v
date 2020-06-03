// Generator : SpinalHDL v1.4.0    git head : ecb5a80b713566f417ea3ea061f9969e73770a7f
// Date      : 03/06/2020, 15:52:01
// Component : PeStream



module Fifo (
  input      [15:0]   io_push_data,
  input               io_push_en,
  output     [15:0]   io_pop_data,
  input               io_pop_en,
  output reg          io_pop_valid,
  output              io_full,
  output              io_empty,
  input               clk,
  input               reset 
);
  reg        [15:0]   _zz_2_;
  wire                _zz_3_;
  wire                _zz_4_;
  wire       [1:0]    _zz_5_;
  wire       [0:0]    _zz_6_;
  wire       [2:0]    _zz_7_;
  wire       [2:0]    _zz_8_;
  wire       [0:0]    _zz_9_;
  wire       [2:0]    _zz_10_;
  wire       [2:0]    _zz_11_;
  reg        [2:0]    wPtr;
  reg        [2:0]    rPtr;
  reg        [3:0]    count;
  reg        [15:0]   mem_0;
  reg        [15:0]   mem_1;
  reg        [15:0]   mem_2;
  reg        [15:0]   mem_3;
  reg        [15:0]   mem_4;
  wire       [7:0]    _zz_1_;
  wire                countLogic_push;
  wire                countLogic_pop;

  assign _zz_3_ = (io_pop_en && (! io_empty));
  assign _zz_4_ = (io_push_en && (! io_full));
  assign _zz_5_ = {countLogic_push,countLogic_pop};
  assign _zz_6_ = (1'b0);
  assign _zz_7_ = {2'd0, _zz_6_};
  assign _zz_8_ = (wPtr + (3'b001));
  assign _zz_9_ = (1'b0);
  assign _zz_10_ = {2'd0, _zz_9_};
  assign _zz_11_ = (rPtr + (3'b001));
  always @(*) begin
    case(rPtr)
      3'b000 : begin
        _zz_2_ = mem_0;
      end
      3'b001 : begin
        _zz_2_ = mem_1;
      end
      3'b010 : begin
        _zz_2_ = mem_2;
      end
      3'b011 : begin
        _zz_2_ = mem_3;
      end
      default : begin
        _zz_2_ = mem_4;
      end
    endcase
  end

  assign io_empty = (count == (4'b0000));
  assign io_full = (count == (4'b0101));
  assign _zz_1_ = ({7'd0,(1'b1)} <<< wPtr);
  assign io_pop_data = _zz_2_;
  always @ (*) begin
    if(_zz_3_)begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = 1'b0;
    end
  end

  assign countLogic_push = (io_push_en && (! io_full));
  assign countLogic_pop = (io_pop_en && (! io_empty));
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      wPtr <= (3'b000);
      rPtr <= (3'b000);
      count <= (4'b0000);
    end else begin
      if(_zz_4_)begin
        wPtr <= ((wPtr == (3'b100)) ? _zz_7_ : _zz_8_);
      end
      if(_zz_3_)begin
        rPtr <= ((rPtr == (3'b100)) ? _zz_10_ : _zz_11_);
      end
      case(_zz_5_)
        2'b01 : begin
          count <= (count - (4'b0001));
        end
        2'b10 : begin
          count <= (count + (4'b0001));
        end
        default : begin
          count <= count;
        end
      endcase
    end
  end

  always @ (posedge clk) begin
    if(_zz_4_)begin
      if(_zz_1_[0])begin
        mem_0 <= io_push_data;
      end
      if(_zz_1_[1])begin
        mem_1 <= io_push_data;
      end
      if(_zz_1_[2])begin
        mem_2 <= io_push_data;
      end
      if(_zz_1_[3])begin
        mem_3 <= io_push_data;
      end
      if(_zz_1_[4])begin
        mem_4 <= io_push_data;
      end
    end
  end


endmodule
//Fifo_1_ replaced by Fifo
//Fifo_2_ replaced by Fifo
//Fifo_3_ replaced by Fifo
//Fifo_4_ replaced by Fifo
//Fifo_5_ replaced by Fifo
//Fifo_6_ replaced by Fifo
//Fifo_7_ replaced by Fifo
//Fifo_8_ replaced by Fifo
//Fifo_9_ replaced by Fifo
//Fifo_10_ replaced by Fifo
//Fifo_11_ replaced by Fifo
//Fifo_12_ replaced by Fifo
//Fifo_13_ replaced by Fifo
//Fifo_14_ replaced by Fifo
//Fifo_15_ replaced by Fifo
//Fifo_16_ replaced by Fifo
//Fifo_17_ replaced by Fifo
//Fifo_18_ replaced by Fifo
//Fifo_19_ replaced by Fifo
//Fifo_20_ replaced by Fifo
//Fifo_21_ replaced by Fifo
//Fifo_22_ replaced by Fifo
//Fifo_23_ replaced by Fifo
//Fifo_24_ replaced by Fifo
//Fifo_25_ replaced by Fifo
//Fifo_26_ replaced by Fifo
//Fifo_27_ replaced by Fifo
//Fifo_28_ replaced by Fifo
//Fifo_29_ replaced by Fifo
//Fifo_30_ replaced by Fifo
//Fifo_31_ replaced by Fifo
//Fifo_32_ replaced by Fifo
//Fifo_33_ replaced by Fifo
//Fifo_34_ replaced by Fifo
//Fifo_35_ replaced by Fifo
//Fifo_36_ replaced by Fifo
//Fifo_37_ replaced by Fifo
//Fifo_38_ replaced by Fifo
//Fifo_39_ replaced by Fifo
//Fifo_40_ replaced by Fifo
//Fifo_41_ replaced by Fifo
//Fifo_42_ replaced by Fifo
//Fifo_43_ replaced by Fifo
//Fifo_44_ replaced by Fifo
//Fifo_45_ replaced by Fifo
//Fifo_46_ replaced by Fifo
//Fifo_47_ replaced by Fifo
//Fifo_48_ replaced by Fifo
//Fifo_49_ replaced by Fifo

module Pe (
  input               io_flowA_valid,
  input      [15:0]   io_flowA_payload,
  input               io_flowB_valid,
  input      [15:0]   io_flowB_payload,
  output     [31:0]   io_results_0_0,
  output     [31:0]   io_results_0_1,
  output     [31:0]   io_results_0_2,
  output     [31:0]   io_results_0_3,
  output     [31:0]   io_results_0_4,
  output     [31:0]   io_results_1_0,
  output     [31:0]   io_results_1_1,
  output     [31:0]   io_results_1_2,
  output     [31:0]   io_results_1_3,
  output     [31:0]   io_results_1_4,
  output     [31:0]   io_results_2_0,
  output     [31:0]   io_results_2_1,
  output     [31:0]   io_results_2_2,
  output     [31:0]   io_results_2_3,
  output     [31:0]   io_results_2_4,
  output     [31:0]   io_results_3_0,
  output     [31:0]   io_results_3_1,
  output     [31:0]   io_results_3_2,
  output     [31:0]   io_results_3_3,
  output     [31:0]   io_results_3_4,
  output     [31:0]   io_results_4_0,
  output     [31:0]   io_results_4_1,
  output     [31:0]   io_results_4_2,
  output     [31:0]   io_results_4_3,
  output     [31:0]   io_results_4_4,
  input               io_clear,
  output              io_done,
  output              io_last,
  input               clk,
  input               reset 
);
  wire                _zz_26_;
  wire                _zz_27_;
  wire                _zz_28_;
  wire                _zz_29_;
  wire                _zz_30_;
  wire                _zz_31_;
  wire                _zz_32_;
  wire                _zz_33_;
  wire                _zz_34_;
  wire                _zz_35_;
  wire                _zz_36_;
  wire                _zz_37_;
  wire                _zz_38_;
  wire                _zz_39_;
  wire                _zz_40_;
  wire                _zz_41_;
  wire                _zz_42_;
  wire                _zz_43_;
  wire                _zz_44_;
  wire                _zz_45_;
  wire                _zz_46_;
  wire                _zz_47_;
  wire                _zz_48_;
  wire                _zz_49_;
  wire                _zz_50_;
  wire                _zz_51_;
  wire                _zz_52_;
  wire                _zz_53_;
  wire                _zz_54_;
  wire                _zz_55_;
  wire                _zz_56_;
  wire                _zz_57_;
  wire                _zz_58_;
  wire                _zz_59_;
  wire                _zz_60_;
  wire                _zz_61_;
  wire                _zz_62_;
  wire                _zz_63_;
  wire                _zz_64_;
  wire                _zz_65_;
  wire                _zz_66_;
  wire                _zz_67_;
  wire                _zz_68_;
  wire                _zz_69_;
  wire                _zz_70_;
  wire                _zz_71_;
  wire                _zz_72_;
  wire                _zz_73_;
  wire                _zz_74_;
  wire                _zz_75_;
  wire       [15:0]   macs_0_0_fifoA_io_pop_data;
  wire                macs_0_0_fifoA_io_pop_valid;
  wire                macs_0_0_fifoA_io_full;
  wire                macs_0_0_fifoA_io_empty;
  wire       [15:0]   macs_0_0_fifoB_io_pop_data;
  wire                macs_0_0_fifoB_io_pop_valid;
  wire                macs_0_0_fifoB_io_full;
  wire                macs_0_0_fifoB_io_empty;
  wire       [15:0]   macs_0_1_fifoA_io_pop_data;
  wire                macs_0_1_fifoA_io_pop_valid;
  wire                macs_0_1_fifoA_io_full;
  wire                macs_0_1_fifoA_io_empty;
  wire       [15:0]   macs_0_1_fifoB_io_pop_data;
  wire                macs_0_1_fifoB_io_pop_valid;
  wire                macs_0_1_fifoB_io_full;
  wire                macs_0_1_fifoB_io_empty;
  wire       [15:0]   macs_0_2_fifoA_io_pop_data;
  wire                macs_0_2_fifoA_io_pop_valid;
  wire                macs_0_2_fifoA_io_full;
  wire                macs_0_2_fifoA_io_empty;
  wire       [15:0]   macs_0_2_fifoB_io_pop_data;
  wire                macs_0_2_fifoB_io_pop_valid;
  wire                macs_0_2_fifoB_io_full;
  wire                macs_0_2_fifoB_io_empty;
  wire       [15:0]   macs_0_3_fifoA_io_pop_data;
  wire                macs_0_3_fifoA_io_pop_valid;
  wire                macs_0_3_fifoA_io_full;
  wire                macs_0_3_fifoA_io_empty;
  wire       [15:0]   macs_0_3_fifoB_io_pop_data;
  wire                macs_0_3_fifoB_io_pop_valid;
  wire                macs_0_3_fifoB_io_full;
  wire                macs_0_3_fifoB_io_empty;
  wire       [15:0]   macs_0_4_fifoA_io_pop_data;
  wire                macs_0_4_fifoA_io_pop_valid;
  wire                macs_0_4_fifoA_io_full;
  wire                macs_0_4_fifoA_io_empty;
  wire       [15:0]   macs_0_4_fifoB_io_pop_data;
  wire                macs_0_4_fifoB_io_pop_valid;
  wire                macs_0_4_fifoB_io_full;
  wire                macs_0_4_fifoB_io_empty;
  wire       [15:0]   macs_1_0_fifoA_io_pop_data;
  wire                macs_1_0_fifoA_io_pop_valid;
  wire                macs_1_0_fifoA_io_full;
  wire                macs_1_0_fifoA_io_empty;
  wire       [15:0]   macs_1_0_fifoB_io_pop_data;
  wire                macs_1_0_fifoB_io_pop_valid;
  wire                macs_1_0_fifoB_io_full;
  wire                macs_1_0_fifoB_io_empty;
  wire       [15:0]   macs_1_1_fifoA_io_pop_data;
  wire                macs_1_1_fifoA_io_pop_valid;
  wire                macs_1_1_fifoA_io_full;
  wire                macs_1_1_fifoA_io_empty;
  wire       [15:0]   macs_1_1_fifoB_io_pop_data;
  wire                macs_1_1_fifoB_io_pop_valid;
  wire                macs_1_1_fifoB_io_full;
  wire                macs_1_1_fifoB_io_empty;
  wire       [15:0]   macs_1_2_fifoA_io_pop_data;
  wire                macs_1_2_fifoA_io_pop_valid;
  wire                macs_1_2_fifoA_io_full;
  wire                macs_1_2_fifoA_io_empty;
  wire       [15:0]   macs_1_2_fifoB_io_pop_data;
  wire                macs_1_2_fifoB_io_pop_valid;
  wire                macs_1_2_fifoB_io_full;
  wire                macs_1_2_fifoB_io_empty;
  wire       [15:0]   macs_1_3_fifoA_io_pop_data;
  wire                macs_1_3_fifoA_io_pop_valid;
  wire                macs_1_3_fifoA_io_full;
  wire                macs_1_3_fifoA_io_empty;
  wire       [15:0]   macs_1_3_fifoB_io_pop_data;
  wire                macs_1_3_fifoB_io_pop_valid;
  wire                macs_1_3_fifoB_io_full;
  wire                macs_1_3_fifoB_io_empty;
  wire       [15:0]   macs_1_4_fifoA_io_pop_data;
  wire                macs_1_4_fifoA_io_pop_valid;
  wire                macs_1_4_fifoA_io_full;
  wire                macs_1_4_fifoA_io_empty;
  wire       [15:0]   macs_1_4_fifoB_io_pop_data;
  wire                macs_1_4_fifoB_io_pop_valid;
  wire                macs_1_4_fifoB_io_full;
  wire                macs_1_4_fifoB_io_empty;
  wire       [15:0]   macs_2_0_fifoA_io_pop_data;
  wire                macs_2_0_fifoA_io_pop_valid;
  wire                macs_2_0_fifoA_io_full;
  wire                macs_2_0_fifoA_io_empty;
  wire       [15:0]   macs_2_0_fifoB_io_pop_data;
  wire                macs_2_0_fifoB_io_pop_valid;
  wire                macs_2_0_fifoB_io_full;
  wire                macs_2_0_fifoB_io_empty;
  wire       [15:0]   macs_2_1_fifoA_io_pop_data;
  wire                macs_2_1_fifoA_io_pop_valid;
  wire                macs_2_1_fifoA_io_full;
  wire                macs_2_1_fifoA_io_empty;
  wire       [15:0]   macs_2_1_fifoB_io_pop_data;
  wire                macs_2_1_fifoB_io_pop_valid;
  wire                macs_2_1_fifoB_io_full;
  wire                macs_2_1_fifoB_io_empty;
  wire       [15:0]   macs_2_2_fifoA_io_pop_data;
  wire                macs_2_2_fifoA_io_pop_valid;
  wire                macs_2_2_fifoA_io_full;
  wire                macs_2_2_fifoA_io_empty;
  wire       [15:0]   macs_2_2_fifoB_io_pop_data;
  wire                macs_2_2_fifoB_io_pop_valid;
  wire                macs_2_2_fifoB_io_full;
  wire                macs_2_2_fifoB_io_empty;
  wire       [15:0]   macs_2_3_fifoA_io_pop_data;
  wire                macs_2_3_fifoA_io_pop_valid;
  wire                macs_2_3_fifoA_io_full;
  wire                macs_2_3_fifoA_io_empty;
  wire       [15:0]   macs_2_3_fifoB_io_pop_data;
  wire                macs_2_3_fifoB_io_pop_valid;
  wire                macs_2_3_fifoB_io_full;
  wire                macs_2_3_fifoB_io_empty;
  wire       [15:0]   macs_2_4_fifoA_io_pop_data;
  wire                macs_2_4_fifoA_io_pop_valid;
  wire                macs_2_4_fifoA_io_full;
  wire                macs_2_4_fifoA_io_empty;
  wire       [15:0]   macs_2_4_fifoB_io_pop_data;
  wire                macs_2_4_fifoB_io_pop_valid;
  wire                macs_2_4_fifoB_io_full;
  wire                macs_2_4_fifoB_io_empty;
  wire       [15:0]   macs_3_0_fifoA_io_pop_data;
  wire                macs_3_0_fifoA_io_pop_valid;
  wire                macs_3_0_fifoA_io_full;
  wire                macs_3_0_fifoA_io_empty;
  wire       [15:0]   macs_3_0_fifoB_io_pop_data;
  wire                macs_3_0_fifoB_io_pop_valid;
  wire                macs_3_0_fifoB_io_full;
  wire                macs_3_0_fifoB_io_empty;
  wire       [15:0]   macs_3_1_fifoA_io_pop_data;
  wire                macs_3_1_fifoA_io_pop_valid;
  wire                macs_3_1_fifoA_io_full;
  wire                macs_3_1_fifoA_io_empty;
  wire       [15:0]   macs_3_1_fifoB_io_pop_data;
  wire                macs_3_1_fifoB_io_pop_valid;
  wire                macs_3_1_fifoB_io_full;
  wire                macs_3_1_fifoB_io_empty;
  wire       [15:0]   macs_3_2_fifoA_io_pop_data;
  wire                macs_3_2_fifoA_io_pop_valid;
  wire                macs_3_2_fifoA_io_full;
  wire                macs_3_2_fifoA_io_empty;
  wire       [15:0]   macs_3_2_fifoB_io_pop_data;
  wire                macs_3_2_fifoB_io_pop_valid;
  wire                macs_3_2_fifoB_io_full;
  wire                macs_3_2_fifoB_io_empty;
  wire       [15:0]   macs_3_3_fifoA_io_pop_data;
  wire                macs_3_3_fifoA_io_pop_valid;
  wire                macs_3_3_fifoA_io_full;
  wire                macs_3_3_fifoA_io_empty;
  wire       [15:0]   macs_3_3_fifoB_io_pop_data;
  wire                macs_3_3_fifoB_io_pop_valid;
  wire                macs_3_3_fifoB_io_full;
  wire                macs_3_3_fifoB_io_empty;
  wire       [15:0]   macs_3_4_fifoA_io_pop_data;
  wire                macs_3_4_fifoA_io_pop_valid;
  wire                macs_3_4_fifoA_io_full;
  wire                macs_3_4_fifoA_io_empty;
  wire       [15:0]   macs_3_4_fifoB_io_pop_data;
  wire                macs_3_4_fifoB_io_pop_valid;
  wire                macs_3_4_fifoB_io_full;
  wire                macs_3_4_fifoB_io_empty;
  wire       [15:0]   macs_4_0_fifoA_io_pop_data;
  wire                macs_4_0_fifoA_io_pop_valid;
  wire                macs_4_0_fifoA_io_full;
  wire                macs_4_0_fifoA_io_empty;
  wire       [15:0]   macs_4_0_fifoB_io_pop_data;
  wire                macs_4_0_fifoB_io_pop_valid;
  wire                macs_4_0_fifoB_io_full;
  wire                macs_4_0_fifoB_io_empty;
  wire       [15:0]   macs_4_1_fifoA_io_pop_data;
  wire                macs_4_1_fifoA_io_pop_valid;
  wire                macs_4_1_fifoA_io_full;
  wire                macs_4_1_fifoA_io_empty;
  wire       [15:0]   macs_4_1_fifoB_io_pop_data;
  wire                macs_4_1_fifoB_io_pop_valid;
  wire                macs_4_1_fifoB_io_full;
  wire                macs_4_1_fifoB_io_empty;
  wire       [15:0]   macs_4_2_fifoA_io_pop_data;
  wire                macs_4_2_fifoA_io_pop_valid;
  wire                macs_4_2_fifoA_io_full;
  wire                macs_4_2_fifoA_io_empty;
  wire       [15:0]   macs_4_2_fifoB_io_pop_data;
  wire                macs_4_2_fifoB_io_pop_valid;
  wire                macs_4_2_fifoB_io_full;
  wire                macs_4_2_fifoB_io_empty;
  wire       [15:0]   macs_4_3_fifoA_io_pop_data;
  wire                macs_4_3_fifoA_io_pop_valid;
  wire                macs_4_3_fifoA_io_full;
  wire                macs_4_3_fifoA_io_empty;
  wire       [15:0]   macs_4_3_fifoB_io_pop_data;
  wire                macs_4_3_fifoB_io_pop_valid;
  wire                macs_4_3_fifoB_io_full;
  wire                macs_4_3_fifoB_io_empty;
  wire       [15:0]   macs_4_4_fifoA_io_pop_data;
  wire                macs_4_4_fifoA_io_pop_valid;
  wire                macs_4_4_fifoA_io_full;
  wire                macs_4_4_fifoA_io_empty;
  wire       [15:0]   macs_4_4_fifoB_io_pop_data;
  wire                macs_4_4_fifoB_io_pop_valid;
  wire                macs_4_4_fifoB_io_full;
  wire                macs_4_4_fifoB_io_empty;
  wire       [0:0]    _zz_76_;
  wire       [2:0]    _zz_77_;
  wire       [0:0]    _zz_78_;
  wire       [2:0]    _zz_79_;
  wire       [0:0]    _zz_80_;
  wire       [2:0]    _zz_81_;
  wire       [0:0]    _zz_82_;
  wire       [2:0]    _zz_83_;
  wire       [31:0]   _zz_84_;
  wire       [31:0]   _zz_85_;
  wire       [31:0]   _zz_86_;
  wire       [31:0]   _zz_87_;
  wire       [31:0]   _zz_88_;
  wire       [31:0]   _zz_89_;
  wire       [31:0]   _zz_90_;
  wire       [31:0]   _zz_91_;
  wire       [31:0]   _zz_92_;
  wire       [31:0]   _zz_93_;
  wire       [31:0]   _zz_94_;
  wire       [31:0]   _zz_95_;
  wire       [31:0]   _zz_96_;
  wire       [31:0]   _zz_97_;
  wire       [31:0]   _zz_98_;
  wire       [31:0]   _zz_99_;
  wire       [31:0]   _zz_100_;
  wire       [31:0]   _zz_101_;
  wire       [31:0]   _zz_102_;
  wire       [31:0]   _zz_103_;
  wire       [31:0]   _zz_104_;
  wire       [31:0]   _zz_105_;
  wire       [31:0]   _zz_106_;
  wire       [31:0]   _zz_107_;
  wire       [31:0]   _zz_108_;
  reg                 counters_ai_willIncrement;
  reg                 counters_ai_willClear;
  reg        [2:0]    counters_ai_valueNext;
  reg        [2:0]    counters_ai_value;
  wire                counters_ai_willOverflowIfInc;
  wire                counters_ai_willOverflow;
  reg                 counters_aj_willIncrement;
  reg                 counters_aj_willClear;
  reg        [2:0]    counters_aj_valueNext;
  reg        [2:0]    counters_aj_value;
  wire                counters_aj_willOverflowIfInc;
  wire                counters_aj_willOverflow;
  reg                 counters_bi_willIncrement;
  reg                 counters_bi_willClear;
  reg        [2:0]    counters_bi_valueNext;
  reg        [2:0]    counters_bi_value;
  wire                counters_bi_willOverflowIfInc;
  wire                counters_bi_willOverflow;
  reg                 counters_bj_willIncrement;
  reg                 counters_bj_willClear;
  reg        [2:0]    counters_bj_valueNext;
  reg        [2:0]    counters_bj_value;
  wire                counters_bj_willOverflowIfInc;
  wire                counters_bj_willOverflow;
  reg                 counters_lastA;
  reg                 counters_lastB;
  wire                last;
  reg                 last_regNext;
  wire                edge_1_;
  reg                 edge_1__delay_1;
  reg                 edge_1__delay_2;
  reg                 edge_1__delay_3;
  reg        [15:0]   macs_0_0_mac_io_a;
  reg        [15:0]   macs_0_0_mac_io_b;
  wire       [31:0]   macs_0_0_mac_io_res;
  reg                 macs_0_0_mac_io_clr;
  reg                 macs_0_0_mac_io_en;
  reg        [31:0]   macs_0_0_mac_impl_or;
  wire       [15:0]   macs_0_0_mac_impl_a;
  wire       [15:0]   macs_0_0_mac_impl_b;
  wire       [31:0]   macs_0_0_mac_impl_c;
  wire                macs_0_0_mac_impl_clr;
  wire                macs_0_0_mac_impl_en;
  reg        [15:0]   macs_0_0_mac_impl_ar;
  reg        [15:0]   macs_0_0_mac_impl_br;
  reg                 macs_0_0_mac_impl_sr;
  reg        [31:0]   macs_0_0_mac_impl_mr;
  reg        [31:0]   macs_0_0_mac_impl_adder;
  reg                 macs_0_0_mac_impl_sr_regNextWhen;
  wire                _zz_1_;
  reg        [15:0]   macs_0_1_mac_io_a;
  reg        [15:0]   macs_0_1_mac_io_b;
  wire       [31:0]   macs_0_1_mac_io_res;
  reg                 macs_0_1_mac_io_clr;
  reg                 macs_0_1_mac_io_en;
  reg        [31:0]   macs_0_1_mac_impl_or;
  wire       [15:0]   macs_0_1_mac_impl_a;
  wire       [15:0]   macs_0_1_mac_impl_b;
  wire       [31:0]   macs_0_1_mac_impl_c;
  wire                macs_0_1_mac_impl_clr;
  wire                macs_0_1_mac_impl_en;
  reg        [15:0]   macs_0_1_mac_impl_ar;
  reg        [15:0]   macs_0_1_mac_impl_br;
  reg                 macs_0_1_mac_impl_sr;
  reg        [31:0]   macs_0_1_mac_impl_mr;
  reg        [31:0]   macs_0_1_mac_impl_adder;
  reg                 macs_0_1_mac_impl_sr_regNextWhen;
  wire                _zz_2_;
  reg        [15:0]   macs_0_2_mac_io_a;
  reg        [15:0]   macs_0_2_mac_io_b;
  wire       [31:0]   macs_0_2_mac_io_res;
  reg                 macs_0_2_mac_io_clr;
  reg                 macs_0_2_mac_io_en;
  reg        [31:0]   macs_0_2_mac_impl_or;
  wire       [15:0]   macs_0_2_mac_impl_a;
  wire       [15:0]   macs_0_2_mac_impl_b;
  wire       [31:0]   macs_0_2_mac_impl_c;
  wire                macs_0_2_mac_impl_clr;
  wire                macs_0_2_mac_impl_en;
  reg        [15:0]   macs_0_2_mac_impl_ar;
  reg        [15:0]   macs_0_2_mac_impl_br;
  reg                 macs_0_2_mac_impl_sr;
  reg        [31:0]   macs_0_2_mac_impl_mr;
  reg        [31:0]   macs_0_2_mac_impl_adder;
  reg                 macs_0_2_mac_impl_sr_regNextWhen;
  wire                _zz_3_;
  reg        [15:0]   macs_0_3_mac_io_a;
  reg        [15:0]   macs_0_3_mac_io_b;
  wire       [31:0]   macs_0_3_mac_io_res;
  reg                 macs_0_3_mac_io_clr;
  reg                 macs_0_3_mac_io_en;
  reg        [31:0]   macs_0_3_mac_impl_or;
  wire       [15:0]   macs_0_3_mac_impl_a;
  wire       [15:0]   macs_0_3_mac_impl_b;
  wire       [31:0]   macs_0_3_mac_impl_c;
  wire                macs_0_3_mac_impl_clr;
  wire                macs_0_3_mac_impl_en;
  reg        [15:0]   macs_0_3_mac_impl_ar;
  reg        [15:0]   macs_0_3_mac_impl_br;
  reg                 macs_0_3_mac_impl_sr;
  reg        [31:0]   macs_0_3_mac_impl_mr;
  reg        [31:0]   macs_0_3_mac_impl_adder;
  reg                 macs_0_3_mac_impl_sr_regNextWhen;
  wire                _zz_4_;
  reg        [15:0]   macs_0_4_mac_io_a;
  reg        [15:0]   macs_0_4_mac_io_b;
  wire       [31:0]   macs_0_4_mac_io_res;
  reg                 macs_0_4_mac_io_clr;
  reg                 macs_0_4_mac_io_en;
  reg        [31:0]   macs_0_4_mac_impl_or;
  wire       [15:0]   macs_0_4_mac_impl_a;
  wire       [15:0]   macs_0_4_mac_impl_b;
  wire       [31:0]   macs_0_4_mac_impl_c;
  wire                macs_0_4_mac_impl_clr;
  wire                macs_0_4_mac_impl_en;
  reg        [15:0]   macs_0_4_mac_impl_ar;
  reg        [15:0]   macs_0_4_mac_impl_br;
  reg                 macs_0_4_mac_impl_sr;
  reg        [31:0]   macs_0_4_mac_impl_mr;
  reg        [31:0]   macs_0_4_mac_impl_adder;
  reg                 macs_0_4_mac_impl_sr_regNextWhen;
  wire                _zz_5_;
  reg        [15:0]   macs_1_0_mac_io_a;
  reg        [15:0]   macs_1_0_mac_io_b;
  wire       [31:0]   macs_1_0_mac_io_res;
  reg                 macs_1_0_mac_io_clr;
  reg                 macs_1_0_mac_io_en;
  reg        [31:0]   macs_1_0_mac_impl_or;
  wire       [15:0]   macs_1_0_mac_impl_a;
  wire       [15:0]   macs_1_0_mac_impl_b;
  wire       [31:0]   macs_1_0_mac_impl_c;
  wire                macs_1_0_mac_impl_clr;
  wire                macs_1_0_mac_impl_en;
  reg        [15:0]   macs_1_0_mac_impl_ar;
  reg        [15:0]   macs_1_0_mac_impl_br;
  reg                 macs_1_0_mac_impl_sr;
  reg        [31:0]   macs_1_0_mac_impl_mr;
  reg        [31:0]   macs_1_0_mac_impl_adder;
  reg                 macs_1_0_mac_impl_sr_regNextWhen;
  wire                _zz_6_;
  reg        [15:0]   macs_1_1_mac_io_a;
  reg        [15:0]   macs_1_1_mac_io_b;
  wire       [31:0]   macs_1_1_mac_io_res;
  reg                 macs_1_1_mac_io_clr;
  reg                 macs_1_1_mac_io_en;
  reg        [31:0]   macs_1_1_mac_impl_or;
  wire       [15:0]   macs_1_1_mac_impl_a;
  wire       [15:0]   macs_1_1_mac_impl_b;
  wire       [31:0]   macs_1_1_mac_impl_c;
  wire                macs_1_1_mac_impl_clr;
  wire                macs_1_1_mac_impl_en;
  reg        [15:0]   macs_1_1_mac_impl_ar;
  reg        [15:0]   macs_1_1_mac_impl_br;
  reg                 macs_1_1_mac_impl_sr;
  reg        [31:0]   macs_1_1_mac_impl_mr;
  reg        [31:0]   macs_1_1_mac_impl_adder;
  reg                 macs_1_1_mac_impl_sr_regNextWhen;
  wire                _zz_7_;
  reg        [15:0]   macs_1_2_mac_io_a;
  reg        [15:0]   macs_1_2_mac_io_b;
  wire       [31:0]   macs_1_2_mac_io_res;
  reg                 macs_1_2_mac_io_clr;
  reg                 macs_1_2_mac_io_en;
  reg        [31:0]   macs_1_2_mac_impl_or;
  wire       [15:0]   macs_1_2_mac_impl_a;
  wire       [15:0]   macs_1_2_mac_impl_b;
  wire       [31:0]   macs_1_2_mac_impl_c;
  wire                macs_1_2_mac_impl_clr;
  wire                macs_1_2_mac_impl_en;
  reg        [15:0]   macs_1_2_mac_impl_ar;
  reg        [15:0]   macs_1_2_mac_impl_br;
  reg                 macs_1_2_mac_impl_sr;
  reg        [31:0]   macs_1_2_mac_impl_mr;
  reg        [31:0]   macs_1_2_mac_impl_adder;
  reg                 macs_1_2_mac_impl_sr_regNextWhen;
  wire                _zz_8_;
  reg        [15:0]   macs_1_3_mac_io_a;
  reg        [15:0]   macs_1_3_mac_io_b;
  wire       [31:0]   macs_1_3_mac_io_res;
  reg                 macs_1_3_mac_io_clr;
  reg                 macs_1_3_mac_io_en;
  reg        [31:0]   macs_1_3_mac_impl_or;
  wire       [15:0]   macs_1_3_mac_impl_a;
  wire       [15:0]   macs_1_3_mac_impl_b;
  wire       [31:0]   macs_1_3_mac_impl_c;
  wire                macs_1_3_mac_impl_clr;
  wire                macs_1_3_mac_impl_en;
  reg        [15:0]   macs_1_3_mac_impl_ar;
  reg        [15:0]   macs_1_3_mac_impl_br;
  reg                 macs_1_3_mac_impl_sr;
  reg        [31:0]   macs_1_3_mac_impl_mr;
  reg        [31:0]   macs_1_3_mac_impl_adder;
  reg                 macs_1_3_mac_impl_sr_regNextWhen;
  wire                _zz_9_;
  reg        [15:0]   macs_1_4_mac_io_a;
  reg        [15:0]   macs_1_4_mac_io_b;
  wire       [31:0]   macs_1_4_mac_io_res;
  reg                 macs_1_4_mac_io_clr;
  reg                 macs_1_4_mac_io_en;
  reg        [31:0]   macs_1_4_mac_impl_or;
  wire       [15:0]   macs_1_4_mac_impl_a;
  wire       [15:0]   macs_1_4_mac_impl_b;
  wire       [31:0]   macs_1_4_mac_impl_c;
  wire                macs_1_4_mac_impl_clr;
  wire                macs_1_4_mac_impl_en;
  reg        [15:0]   macs_1_4_mac_impl_ar;
  reg        [15:0]   macs_1_4_mac_impl_br;
  reg                 macs_1_4_mac_impl_sr;
  reg        [31:0]   macs_1_4_mac_impl_mr;
  reg        [31:0]   macs_1_4_mac_impl_adder;
  reg                 macs_1_4_mac_impl_sr_regNextWhen;
  wire                _zz_10_;
  reg        [15:0]   macs_2_0_mac_io_a;
  reg        [15:0]   macs_2_0_mac_io_b;
  wire       [31:0]   macs_2_0_mac_io_res;
  reg                 macs_2_0_mac_io_clr;
  reg                 macs_2_0_mac_io_en;
  reg        [31:0]   macs_2_0_mac_impl_or;
  wire       [15:0]   macs_2_0_mac_impl_a;
  wire       [15:0]   macs_2_0_mac_impl_b;
  wire       [31:0]   macs_2_0_mac_impl_c;
  wire                macs_2_0_mac_impl_clr;
  wire                macs_2_0_mac_impl_en;
  reg        [15:0]   macs_2_0_mac_impl_ar;
  reg        [15:0]   macs_2_0_mac_impl_br;
  reg                 macs_2_0_mac_impl_sr;
  reg        [31:0]   macs_2_0_mac_impl_mr;
  reg        [31:0]   macs_2_0_mac_impl_adder;
  reg                 macs_2_0_mac_impl_sr_regNextWhen;
  wire                _zz_11_;
  reg        [15:0]   macs_2_1_mac_io_a;
  reg        [15:0]   macs_2_1_mac_io_b;
  wire       [31:0]   macs_2_1_mac_io_res;
  reg                 macs_2_1_mac_io_clr;
  reg                 macs_2_1_mac_io_en;
  reg        [31:0]   macs_2_1_mac_impl_or;
  wire       [15:0]   macs_2_1_mac_impl_a;
  wire       [15:0]   macs_2_1_mac_impl_b;
  wire       [31:0]   macs_2_1_mac_impl_c;
  wire                macs_2_1_mac_impl_clr;
  wire                macs_2_1_mac_impl_en;
  reg        [15:0]   macs_2_1_mac_impl_ar;
  reg        [15:0]   macs_2_1_mac_impl_br;
  reg                 macs_2_1_mac_impl_sr;
  reg        [31:0]   macs_2_1_mac_impl_mr;
  reg        [31:0]   macs_2_1_mac_impl_adder;
  reg                 macs_2_1_mac_impl_sr_regNextWhen;
  wire                _zz_12_;
  reg        [15:0]   macs_2_2_mac_io_a;
  reg        [15:0]   macs_2_2_mac_io_b;
  wire       [31:0]   macs_2_2_mac_io_res;
  reg                 macs_2_2_mac_io_clr;
  reg                 macs_2_2_mac_io_en;
  reg        [31:0]   macs_2_2_mac_impl_or;
  wire       [15:0]   macs_2_2_mac_impl_a;
  wire       [15:0]   macs_2_2_mac_impl_b;
  wire       [31:0]   macs_2_2_mac_impl_c;
  wire                macs_2_2_mac_impl_clr;
  wire                macs_2_2_mac_impl_en;
  reg        [15:0]   macs_2_2_mac_impl_ar;
  reg        [15:0]   macs_2_2_mac_impl_br;
  reg                 macs_2_2_mac_impl_sr;
  reg        [31:0]   macs_2_2_mac_impl_mr;
  reg        [31:0]   macs_2_2_mac_impl_adder;
  reg                 macs_2_2_mac_impl_sr_regNextWhen;
  wire                _zz_13_;
  reg        [15:0]   macs_2_3_mac_io_a;
  reg        [15:0]   macs_2_3_mac_io_b;
  wire       [31:0]   macs_2_3_mac_io_res;
  reg                 macs_2_3_mac_io_clr;
  reg                 macs_2_3_mac_io_en;
  reg        [31:0]   macs_2_3_mac_impl_or;
  wire       [15:0]   macs_2_3_mac_impl_a;
  wire       [15:0]   macs_2_3_mac_impl_b;
  wire       [31:0]   macs_2_3_mac_impl_c;
  wire                macs_2_3_mac_impl_clr;
  wire                macs_2_3_mac_impl_en;
  reg        [15:0]   macs_2_3_mac_impl_ar;
  reg        [15:0]   macs_2_3_mac_impl_br;
  reg                 macs_2_3_mac_impl_sr;
  reg        [31:0]   macs_2_3_mac_impl_mr;
  reg        [31:0]   macs_2_3_mac_impl_adder;
  reg                 macs_2_3_mac_impl_sr_regNextWhen;
  wire                _zz_14_;
  reg        [15:0]   macs_2_4_mac_io_a;
  reg        [15:0]   macs_2_4_mac_io_b;
  wire       [31:0]   macs_2_4_mac_io_res;
  reg                 macs_2_4_mac_io_clr;
  reg                 macs_2_4_mac_io_en;
  reg        [31:0]   macs_2_4_mac_impl_or;
  wire       [15:0]   macs_2_4_mac_impl_a;
  wire       [15:0]   macs_2_4_mac_impl_b;
  wire       [31:0]   macs_2_4_mac_impl_c;
  wire                macs_2_4_mac_impl_clr;
  wire                macs_2_4_mac_impl_en;
  reg        [15:0]   macs_2_4_mac_impl_ar;
  reg        [15:0]   macs_2_4_mac_impl_br;
  reg                 macs_2_4_mac_impl_sr;
  reg        [31:0]   macs_2_4_mac_impl_mr;
  reg        [31:0]   macs_2_4_mac_impl_adder;
  reg                 macs_2_4_mac_impl_sr_regNextWhen;
  wire                _zz_15_;
  reg        [15:0]   macs_3_0_mac_io_a;
  reg        [15:0]   macs_3_0_mac_io_b;
  wire       [31:0]   macs_3_0_mac_io_res;
  reg                 macs_3_0_mac_io_clr;
  reg                 macs_3_0_mac_io_en;
  reg        [31:0]   macs_3_0_mac_impl_or;
  wire       [15:0]   macs_3_0_mac_impl_a;
  wire       [15:0]   macs_3_0_mac_impl_b;
  wire       [31:0]   macs_3_0_mac_impl_c;
  wire                macs_3_0_mac_impl_clr;
  wire                macs_3_0_mac_impl_en;
  reg        [15:0]   macs_3_0_mac_impl_ar;
  reg        [15:0]   macs_3_0_mac_impl_br;
  reg                 macs_3_0_mac_impl_sr;
  reg        [31:0]   macs_3_0_mac_impl_mr;
  reg        [31:0]   macs_3_0_mac_impl_adder;
  reg                 macs_3_0_mac_impl_sr_regNextWhen;
  wire                _zz_16_;
  reg        [15:0]   macs_3_1_mac_io_a;
  reg        [15:0]   macs_3_1_mac_io_b;
  wire       [31:0]   macs_3_1_mac_io_res;
  reg                 macs_3_1_mac_io_clr;
  reg                 macs_3_1_mac_io_en;
  reg        [31:0]   macs_3_1_mac_impl_or;
  wire       [15:0]   macs_3_1_mac_impl_a;
  wire       [15:0]   macs_3_1_mac_impl_b;
  wire       [31:0]   macs_3_1_mac_impl_c;
  wire                macs_3_1_mac_impl_clr;
  wire                macs_3_1_mac_impl_en;
  reg        [15:0]   macs_3_1_mac_impl_ar;
  reg        [15:0]   macs_3_1_mac_impl_br;
  reg                 macs_3_1_mac_impl_sr;
  reg        [31:0]   macs_3_1_mac_impl_mr;
  reg        [31:0]   macs_3_1_mac_impl_adder;
  reg                 macs_3_1_mac_impl_sr_regNextWhen;
  wire                _zz_17_;
  reg        [15:0]   macs_3_2_mac_io_a;
  reg        [15:0]   macs_3_2_mac_io_b;
  wire       [31:0]   macs_3_2_mac_io_res;
  reg                 macs_3_2_mac_io_clr;
  reg                 macs_3_2_mac_io_en;
  reg        [31:0]   macs_3_2_mac_impl_or;
  wire       [15:0]   macs_3_2_mac_impl_a;
  wire       [15:0]   macs_3_2_mac_impl_b;
  wire       [31:0]   macs_3_2_mac_impl_c;
  wire                macs_3_2_mac_impl_clr;
  wire                macs_3_2_mac_impl_en;
  reg        [15:0]   macs_3_2_mac_impl_ar;
  reg        [15:0]   macs_3_2_mac_impl_br;
  reg                 macs_3_2_mac_impl_sr;
  reg        [31:0]   macs_3_2_mac_impl_mr;
  reg        [31:0]   macs_3_2_mac_impl_adder;
  reg                 macs_3_2_mac_impl_sr_regNextWhen;
  wire                _zz_18_;
  reg        [15:0]   macs_3_3_mac_io_a;
  reg        [15:0]   macs_3_3_mac_io_b;
  wire       [31:0]   macs_3_3_mac_io_res;
  reg                 macs_3_3_mac_io_clr;
  reg                 macs_3_3_mac_io_en;
  reg        [31:0]   macs_3_3_mac_impl_or;
  wire       [15:0]   macs_3_3_mac_impl_a;
  wire       [15:0]   macs_3_3_mac_impl_b;
  wire       [31:0]   macs_3_3_mac_impl_c;
  wire                macs_3_3_mac_impl_clr;
  wire                macs_3_3_mac_impl_en;
  reg        [15:0]   macs_3_3_mac_impl_ar;
  reg        [15:0]   macs_3_3_mac_impl_br;
  reg                 macs_3_3_mac_impl_sr;
  reg        [31:0]   macs_3_3_mac_impl_mr;
  reg        [31:0]   macs_3_3_mac_impl_adder;
  reg                 macs_3_3_mac_impl_sr_regNextWhen;
  wire                _zz_19_;
  reg        [15:0]   macs_3_4_mac_io_a;
  reg        [15:0]   macs_3_4_mac_io_b;
  wire       [31:0]   macs_3_4_mac_io_res;
  reg                 macs_3_4_mac_io_clr;
  reg                 macs_3_4_mac_io_en;
  reg        [31:0]   macs_3_4_mac_impl_or;
  wire       [15:0]   macs_3_4_mac_impl_a;
  wire       [15:0]   macs_3_4_mac_impl_b;
  wire       [31:0]   macs_3_4_mac_impl_c;
  wire                macs_3_4_mac_impl_clr;
  wire                macs_3_4_mac_impl_en;
  reg        [15:0]   macs_3_4_mac_impl_ar;
  reg        [15:0]   macs_3_4_mac_impl_br;
  reg                 macs_3_4_mac_impl_sr;
  reg        [31:0]   macs_3_4_mac_impl_mr;
  reg        [31:0]   macs_3_4_mac_impl_adder;
  reg                 macs_3_4_mac_impl_sr_regNextWhen;
  wire                _zz_20_;
  reg        [15:0]   macs_4_0_mac_io_a;
  reg        [15:0]   macs_4_0_mac_io_b;
  wire       [31:0]   macs_4_0_mac_io_res;
  reg                 macs_4_0_mac_io_clr;
  reg                 macs_4_0_mac_io_en;
  reg        [31:0]   macs_4_0_mac_impl_or;
  wire       [15:0]   macs_4_0_mac_impl_a;
  wire       [15:0]   macs_4_0_mac_impl_b;
  wire       [31:0]   macs_4_0_mac_impl_c;
  wire                macs_4_0_mac_impl_clr;
  wire                macs_4_0_mac_impl_en;
  reg        [15:0]   macs_4_0_mac_impl_ar;
  reg        [15:0]   macs_4_0_mac_impl_br;
  reg                 macs_4_0_mac_impl_sr;
  reg        [31:0]   macs_4_0_mac_impl_mr;
  reg        [31:0]   macs_4_0_mac_impl_adder;
  reg                 macs_4_0_mac_impl_sr_regNextWhen;
  wire                _zz_21_;
  reg        [15:0]   macs_4_1_mac_io_a;
  reg        [15:0]   macs_4_1_mac_io_b;
  wire       [31:0]   macs_4_1_mac_io_res;
  reg                 macs_4_1_mac_io_clr;
  reg                 macs_4_1_mac_io_en;
  reg        [31:0]   macs_4_1_mac_impl_or;
  wire       [15:0]   macs_4_1_mac_impl_a;
  wire       [15:0]   macs_4_1_mac_impl_b;
  wire       [31:0]   macs_4_1_mac_impl_c;
  wire                macs_4_1_mac_impl_clr;
  wire                macs_4_1_mac_impl_en;
  reg        [15:0]   macs_4_1_mac_impl_ar;
  reg        [15:0]   macs_4_1_mac_impl_br;
  reg                 macs_4_1_mac_impl_sr;
  reg        [31:0]   macs_4_1_mac_impl_mr;
  reg        [31:0]   macs_4_1_mac_impl_adder;
  reg                 macs_4_1_mac_impl_sr_regNextWhen;
  wire                _zz_22_;
  reg        [15:0]   macs_4_2_mac_io_a;
  reg        [15:0]   macs_4_2_mac_io_b;
  wire       [31:0]   macs_4_2_mac_io_res;
  reg                 macs_4_2_mac_io_clr;
  reg                 macs_4_2_mac_io_en;
  reg        [31:0]   macs_4_2_mac_impl_or;
  wire       [15:0]   macs_4_2_mac_impl_a;
  wire       [15:0]   macs_4_2_mac_impl_b;
  wire       [31:0]   macs_4_2_mac_impl_c;
  wire                macs_4_2_mac_impl_clr;
  wire                macs_4_2_mac_impl_en;
  reg        [15:0]   macs_4_2_mac_impl_ar;
  reg        [15:0]   macs_4_2_mac_impl_br;
  reg                 macs_4_2_mac_impl_sr;
  reg        [31:0]   macs_4_2_mac_impl_mr;
  reg        [31:0]   macs_4_2_mac_impl_adder;
  reg                 macs_4_2_mac_impl_sr_regNextWhen;
  wire                _zz_23_;
  reg        [15:0]   macs_4_3_mac_io_a;
  reg        [15:0]   macs_4_3_mac_io_b;
  wire       [31:0]   macs_4_3_mac_io_res;
  reg                 macs_4_3_mac_io_clr;
  reg                 macs_4_3_mac_io_en;
  reg        [31:0]   macs_4_3_mac_impl_or;
  wire       [15:0]   macs_4_3_mac_impl_a;
  wire       [15:0]   macs_4_3_mac_impl_b;
  wire       [31:0]   macs_4_3_mac_impl_c;
  wire                macs_4_3_mac_impl_clr;
  wire                macs_4_3_mac_impl_en;
  reg        [15:0]   macs_4_3_mac_impl_ar;
  reg        [15:0]   macs_4_3_mac_impl_br;
  reg                 macs_4_3_mac_impl_sr;
  reg        [31:0]   macs_4_3_mac_impl_mr;
  reg        [31:0]   macs_4_3_mac_impl_adder;
  reg                 macs_4_3_mac_impl_sr_regNextWhen;
  wire                _zz_24_;
  reg        [15:0]   macs_4_4_mac_io_a;
  reg        [15:0]   macs_4_4_mac_io_b;
  wire       [31:0]   macs_4_4_mac_io_res;
  reg                 macs_4_4_mac_io_clr;
  reg                 macs_4_4_mac_io_en;
  reg        [31:0]   macs_4_4_mac_impl_or;
  wire       [15:0]   macs_4_4_mac_impl_a;
  wire       [15:0]   macs_4_4_mac_impl_b;
  wire       [31:0]   macs_4_4_mac_impl_c;
  wire                macs_4_4_mac_impl_clr;
  wire                macs_4_4_mac_impl_en;
  reg        [15:0]   macs_4_4_mac_impl_ar;
  reg        [15:0]   macs_4_4_mac_impl_br;
  reg                 macs_4_4_mac_impl_sr;
  reg        [31:0]   macs_4_4_mac_impl_mr;
  reg        [31:0]   macs_4_4_mac_impl_adder;
  reg                 macs_4_4_mac_impl_sr_regNextWhen;
  wire                _zz_25_;

  assign _zz_76_ = counters_ai_willIncrement;
  assign _zz_77_ = {2'd0, _zz_76_};
  assign _zz_78_ = counters_aj_willIncrement;
  assign _zz_79_ = {2'd0, _zz_78_};
  assign _zz_80_ = counters_bi_willIncrement;
  assign _zz_81_ = {2'd0, _zz_80_};
  assign _zz_82_ = counters_bj_willIncrement;
  assign _zz_83_ = {2'd0, _zz_82_};
  assign _zz_84_ = (macs_0_0_mac_impl_ar * macs_0_0_mac_impl_br);
  assign _zz_85_ = (macs_0_1_mac_impl_ar * macs_0_1_mac_impl_br);
  assign _zz_86_ = (macs_0_2_mac_impl_ar * macs_0_2_mac_impl_br);
  assign _zz_87_ = (macs_0_3_mac_impl_ar * macs_0_3_mac_impl_br);
  assign _zz_88_ = (macs_0_4_mac_impl_ar * macs_0_4_mac_impl_br);
  assign _zz_89_ = (macs_1_0_mac_impl_ar * macs_1_0_mac_impl_br);
  assign _zz_90_ = (macs_1_1_mac_impl_ar * macs_1_1_mac_impl_br);
  assign _zz_91_ = (macs_1_2_mac_impl_ar * macs_1_2_mac_impl_br);
  assign _zz_92_ = (macs_1_3_mac_impl_ar * macs_1_3_mac_impl_br);
  assign _zz_93_ = (macs_1_4_mac_impl_ar * macs_1_4_mac_impl_br);
  assign _zz_94_ = (macs_2_0_mac_impl_ar * macs_2_0_mac_impl_br);
  assign _zz_95_ = (macs_2_1_mac_impl_ar * macs_2_1_mac_impl_br);
  assign _zz_96_ = (macs_2_2_mac_impl_ar * macs_2_2_mac_impl_br);
  assign _zz_97_ = (macs_2_3_mac_impl_ar * macs_2_3_mac_impl_br);
  assign _zz_98_ = (macs_2_4_mac_impl_ar * macs_2_4_mac_impl_br);
  assign _zz_99_ = (macs_3_0_mac_impl_ar * macs_3_0_mac_impl_br);
  assign _zz_100_ = (macs_3_1_mac_impl_ar * macs_3_1_mac_impl_br);
  assign _zz_101_ = (macs_3_2_mac_impl_ar * macs_3_2_mac_impl_br);
  assign _zz_102_ = (macs_3_3_mac_impl_ar * macs_3_3_mac_impl_br);
  assign _zz_103_ = (macs_3_4_mac_impl_ar * macs_3_4_mac_impl_br);
  assign _zz_104_ = (macs_4_0_mac_impl_ar * macs_4_0_mac_impl_br);
  assign _zz_105_ = (macs_4_1_mac_impl_ar * macs_4_1_mac_impl_br);
  assign _zz_106_ = (macs_4_2_mac_impl_ar * macs_4_2_mac_impl_br);
  assign _zz_107_ = (macs_4_3_mac_impl_ar * macs_4_3_mac_impl_br);
  assign _zz_108_ = (macs_4_4_mac_impl_ar * macs_4_4_mac_impl_br);
  Fifo macs_0_0_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_26_                           ), //i
    .io_pop_data     (macs_0_0_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_0_0_mac_io_en                ), //i
    .io_pop_valid    (macs_0_0_fifoA_io_pop_valid       ), //o
    .io_full         (macs_0_0_fifoA_io_full            ), //o
    .io_empty        (macs_0_0_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_0_0_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_27_                           ), //i
    .io_pop_data     (macs_0_0_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_0_0_mac_io_en                ), //i
    .io_pop_valid    (macs_0_0_fifoB_io_pop_valid       ), //o
    .io_full         (macs_0_0_fifoB_io_full            ), //o
    .io_empty        (macs_0_0_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_0_1_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_28_                           ), //i
    .io_pop_data     (macs_0_1_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_0_1_mac_io_en                ), //i
    .io_pop_valid    (macs_0_1_fifoA_io_pop_valid       ), //o
    .io_full         (macs_0_1_fifoA_io_full            ), //o
    .io_empty        (macs_0_1_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_0_1_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_29_                           ), //i
    .io_pop_data     (macs_0_1_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_0_1_mac_io_en                ), //i
    .io_pop_valid    (macs_0_1_fifoB_io_pop_valid       ), //o
    .io_full         (macs_0_1_fifoB_io_full            ), //o
    .io_empty        (macs_0_1_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_0_2_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_30_                           ), //i
    .io_pop_data     (macs_0_2_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_0_2_mac_io_en                ), //i
    .io_pop_valid    (macs_0_2_fifoA_io_pop_valid       ), //o
    .io_full         (macs_0_2_fifoA_io_full            ), //o
    .io_empty        (macs_0_2_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_0_2_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_31_                           ), //i
    .io_pop_data     (macs_0_2_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_0_2_mac_io_en                ), //i
    .io_pop_valid    (macs_0_2_fifoB_io_pop_valid       ), //o
    .io_full         (macs_0_2_fifoB_io_full            ), //o
    .io_empty        (macs_0_2_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_0_3_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_32_                           ), //i
    .io_pop_data     (macs_0_3_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_0_3_mac_io_en                ), //i
    .io_pop_valid    (macs_0_3_fifoA_io_pop_valid       ), //o
    .io_full         (macs_0_3_fifoA_io_full            ), //o
    .io_empty        (macs_0_3_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_0_3_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_33_                           ), //i
    .io_pop_data     (macs_0_3_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_0_3_mac_io_en                ), //i
    .io_pop_valid    (macs_0_3_fifoB_io_pop_valid       ), //o
    .io_full         (macs_0_3_fifoB_io_full            ), //o
    .io_empty        (macs_0_3_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_0_4_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_34_                           ), //i
    .io_pop_data     (macs_0_4_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_0_4_mac_io_en                ), //i
    .io_pop_valid    (macs_0_4_fifoA_io_pop_valid       ), //o
    .io_full         (macs_0_4_fifoA_io_full            ), //o
    .io_empty        (macs_0_4_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_0_4_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_35_                           ), //i
    .io_pop_data     (macs_0_4_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_0_4_mac_io_en                ), //i
    .io_pop_valid    (macs_0_4_fifoB_io_pop_valid       ), //o
    .io_full         (macs_0_4_fifoB_io_full            ), //o
    .io_empty        (macs_0_4_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_1_0_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_36_                           ), //i
    .io_pop_data     (macs_1_0_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_1_0_mac_io_en                ), //i
    .io_pop_valid    (macs_1_0_fifoA_io_pop_valid       ), //o
    .io_full         (macs_1_0_fifoA_io_full            ), //o
    .io_empty        (macs_1_0_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_1_0_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_37_                           ), //i
    .io_pop_data     (macs_1_0_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_1_0_mac_io_en                ), //i
    .io_pop_valid    (macs_1_0_fifoB_io_pop_valid       ), //o
    .io_full         (macs_1_0_fifoB_io_full            ), //o
    .io_empty        (macs_1_0_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_1_1_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_38_                           ), //i
    .io_pop_data     (macs_1_1_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_1_1_mac_io_en                ), //i
    .io_pop_valid    (macs_1_1_fifoA_io_pop_valid       ), //o
    .io_full         (macs_1_1_fifoA_io_full            ), //o
    .io_empty        (macs_1_1_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_1_1_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_39_                           ), //i
    .io_pop_data     (macs_1_1_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_1_1_mac_io_en                ), //i
    .io_pop_valid    (macs_1_1_fifoB_io_pop_valid       ), //o
    .io_full         (macs_1_1_fifoB_io_full            ), //o
    .io_empty        (macs_1_1_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_1_2_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_40_                           ), //i
    .io_pop_data     (macs_1_2_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_1_2_mac_io_en                ), //i
    .io_pop_valid    (macs_1_2_fifoA_io_pop_valid       ), //o
    .io_full         (macs_1_2_fifoA_io_full            ), //o
    .io_empty        (macs_1_2_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_1_2_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_41_                           ), //i
    .io_pop_data     (macs_1_2_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_1_2_mac_io_en                ), //i
    .io_pop_valid    (macs_1_2_fifoB_io_pop_valid       ), //o
    .io_full         (macs_1_2_fifoB_io_full            ), //o
    .io_empty        (macs_1_2_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_1_3_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_42_                           ), //i
    .io_pop_data     (macs_1_3_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_1_3_mac_io_en                ), //i
    .io_pop_valid    (macs_1_3_fifoA_io_pop_valid       ), //o
    .io_full         (macs_1_3_fifoA_io_full            ), //o
    .io_empty        (macs_1_3_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_1_3_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_43_                           ), //i
    .io_pop_data     (macs_1_3_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_1_3_mac_io_en                ), //i
    .io_pop_valid    (macs_1_3_fifoB_io_pop_valid       ), //o
    .io_full         (macs_1_3_fifoB_io_full            ), //o
    .io_empty        (macs_1_3_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_1_4_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_44_                           ), //i
    .io_pop_data     (macs_1_4_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_1_4_mac_io_en                ), //i
    .io_pop_valid    (macs_1_4_fifoA_io_pop_valid       ), //o
    .io_full         (macs_1_4_fifoA_io_full            ), //o
    .io_empty        (macs_1_4_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_1_4_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_45_                           ), //i
    .io_pop_data     (macs_1_4_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_1_4_mac_io_en                ), //i
    .io_pop_valid    (macs_1_4_fifoB_io_pop_valid       ), //o
    .io_full         (macs_1_4_fifoB_io_full            ), //o
    .io_empty        (macs_1_4_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_2_0_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_46_                           ), //i
    .io_pop_data     (macs_2_0_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_2_0_mac_io_en                ), //i
    .io_pop_valid    (macs_2_0_fifoA_io_pop_valid       ), //o
    .io_full         (macs_2_0_fifoA_io_full            ), //o
    .io_empty        (macs_2_0_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_2_0_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_47_                           ), //i
    .io_pop_data     (macs_2_0_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_2_0_mac_io_en                ), //i
    .io_pop_valid    (macs_2_0_fifoB_io_pop_valid       ), //o
    .io_full         (macs_2_0_fifoB_io_full            ), //o
    .io_empty        (macs_2_0_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_2_1_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_48_                           ), //i
    .io_pop_data     (macs_2_1_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_2_1_mac_io_en                ), //i
    .io_pop_valid    (macs_2_1_fifoA_io_pop_valid       ), //o
    .io_full         (macs_2_1_fifoA_io_full            ), //o
    .io_empty        (macs_2_1_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_2_1_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_49_                           ), //i
    .io_pop_data     (macs_2_1_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_2_1_mac_io_en                ), //i
    .io_pop_valid    (macs_2_1_fifoB_io_pop_valid       ), //o
    .io_full         (macs_2_1_fifoB_io_full            ), //o
    .io_empty        (macs_2_1_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_2_2_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_50_                           ), //i
    .io_pop_data     (macs_2_2_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_2_2_mac_io_en                ), //i
    .io_pop_valid    (macs_2_2_fifoA_io_pop_valid       ), //o
    .io_full         (macs_2_2_fifoA_io_full            ), //o
    .io_empty        (macs_2_2_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_2_2_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_51_                           ), //i
    .io_pop_data     (macs_2_2_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_2_2_mac_io_en                ), //i
    .io_pop_valid    (macs_2_2_fifoB_io_pop_valid       ), //o
    .io_full         (macs_2_2_fifoB_io_full            ), //o
    .io_empty        (macs_2_2_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_2_3_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_52_                           ), //i
    .io_pop_data     (macs_2_3_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_2_3_mac_io_en                ), //i
    .io_pop_valid    (macs_2_3_fifoA_io_pop_valid       ), //o
    .io_full         (macs_2_3_fifoA_io_full            ), //o
    .io_empty        (macs_2_3_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_2_3_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_53_                           ), //i
    .io_pop_data     (macs_2_3_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_2_3_mac_io_en                ), //i
    .io_pop_valid    (macs_2_3_fifoB_io_pop_valid       ), //o
    .io_full         (macs_2_3_fifoB_io_full            ), //o
    .io_empty        (macs_2_3_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_2_4_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_54_                           ), //i
    .io_pop_data     (macs_2_4_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_2_4_mac_io_en                ), //i
    .io_pop_valid    (macs_2_4_fifoA_io_pop_valid       ), //o
    .io_full         (macs_2_4_fifoA_io_full            ), //o
    .io_empty        (macs_2_4_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_2_4_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_55_                           ), //i
    .io_pop_data     (macs_2_4_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_2_4_mac_io_en                ), //i
    .io_pop_valid    (macs_2_4_fifoB_io_pop_valid       ), //o
    .io_full         (macs_2_4_fifoB_io_full            ), //o
    .io_empty        (macs_2_4_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_3_0_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_56_                           ), //i
    .io_pop_data     (macs_3_0_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_3_0_mac_io_en                ), //i
    .io_pop_valid    (macs_3_0_fifoA_io_pop_valid       ), //o
    .io_full         (macs_3_0_fifoA_io_full            ), //o
    .io_empty        (macs_3_0_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_3_0_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_57_                           ), //i
    .io_pop_data     (macs_3_0_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_3_0_mac_io_en                ), //i
    .io_pop_valid    (macs_3_0_fifoB_io_pop_valid       ), //o
    .io_full         (macs_3_0_fifoB_io_full            ), //o
    .io_empty        (macs_3_0_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_3_1_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_58_                           ), //i
    .io_pop_data     (macs_3_1_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_3_1_mac_io_en                ), //i
    .io_pop_valid    (macs_3_1_fifoA_io_pop_valid       ), //o
    .io_full         (macs_3_1_fifoA_io_full            ), //o
    .io_empty        (macs_3_1_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_3_1_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_59_                           ), //i
    .io_pop_data     (macs_3_1_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_3_1_mac_io_en                ), //i
    .io_pop_valid    (macs_3_1_fifoB_io_pop_valid       ), //o
    .io_full         (macs_3_1_fifoB_io_full            ), //o
    .io_empty        (macs_3_1_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_3_2_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_60_                           ), //i
    .io_pop_data     (macs_3_2_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_3_2_mac_io_en                ), //i
    .io_pop_valid    (macs_3_2_fifoA_io_pop_valid       ), //o
    .io_full         (macs_3_2_fifoA_io_full            ), //o
    .io_empty        (macs_3_2_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_3_2_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_61_                           ), //i
    .io_pop_data     (macs_3_2_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_3_2_mac_io_en                ), //i
    .io_pop_valid    (macs_3_2_fifoB_io_pop_valid       ), //o
    .io_full         (macs_3_2_fifoB_io_full            ), //o
    .io_empty        (macs_3_2_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_3_3_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_62_                           ), //i
    .io_pop_data     (macs_3_3_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_3_3_mac_io_en                ), //i
    .io_pop_valid    (macs_3_3_fifoA_io_pop_valid       ), //o
    .io_full         (macs_3_3_fifoA_io_full            ), //o
    .io_empty        (macs_3_3_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_3_3_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_63_                           ), //i
    .io_pop_data     (macs_3_3_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_3_3_mac_io_en                ), //i
    .io_pop_valid    (macs_3_3_fifoB_io_pop_valid       ), //o
    .io_full         (macs_3_3_fifoB_io_full            ), //o
    .io_empty        (macs_3_3_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_3_4_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_64_                           ), //i
    .io_pop_data     (macs_3_4_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_3_4_mac_io_en                ), //i
    .io_pop_valid    (macs_3_4_fifoA_io_pop_valid       ), //o
    .io_full         (macs_3_4_fifoA_io_full            ), //o
    .io_empty        (macs_3_4_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_3_4_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_65_                           ), //i
    .io_pop_data     (macs_3_4_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_3_4_mac_io_en                ), //i
    .io_pop_valid    (macs_3_4_fifoB_io_pop_valid       ), //o
    .io_full         (macs_3_4_fifoB_io_full            ), //o
    .io_empty        (macs_3_4_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_4_0_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_66_                           ), //i
    .io_pop_data     (macs_4_0_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_4_0_mac_io_en                ), //i
    .io_pop_valid    (macs_4_0_fifoA_io_pop_valid       ), //o
    .io_full         (macs_4_0_fifoA_io_full            ), //o
    .io_empty        (macs_4_0_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_4_0_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_67_                           ), //i
    .io_pop_data     (macs_4_0_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_4_0_mac_io_en                ), //i
    .io_pop_valid    (macs_4_0_fifoB_io_pop_valid       ), //o
    .io_full         (macs_4_0_fifoB_io_full            ), //o
    .io_empty        (macs_4_0_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_4_1_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_68_                           ), //i
    .io_pop_data     (macs_4_1_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_4_1_mac_io_en                ), //i
    .io_pop_valid    (macs_4_1_fifoA_io_pop_valid       ), //o
    .io_full         (macs_4_1_fifoA_io_full            ), //o
    .io_empty        (macs_4_1_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_4_1_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_69_                           ), //i
    .io_pop_data     (macs_4_1_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_4_1_mac_io_en                ), //i
    .io_pop_valid    (macs_4_1_fifoB_io_pop_valid       ), //o
    .io_full         (macs_4_1_fifoB_io_full            ), //o
    .io_empty        (macs_4_1_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_4_2_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_70_                           ), //i
    .io_pop_data     (macs_4_2_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_4_2_mac_io_en                ), //i
    .io_pop_valid    (macs_4_2_fifoA_io_pop_valid       ), //o
    .io_full         (macs_4_2_fifoA_io_full            ), //o
    .io_empty        (macs_4_2_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_4_2_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_71_                           ), //i
    .io_pop_data     (macs_4_2_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_4_2_mac_io_en                ), //i
    .io_pop_valid    (macs_4_2_fifoB_io_pop_valid       ), //o
    .io_full         (macs_4_2_fifoB_io_full            ), //o
    .io_empty        (macs_4_2_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_4_3_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_72_                           ), //i
    .io_pop_data     (macs_4_3_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_4_3_mac_io_en                ), //i
    .io_pop_valid    (macs_4_3_fifoA_io_pop_valid       ), //o
    .io_full         (macs_4_3_fifoA_io_full            ), //o
    .io_empty        (macs_4_3_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_4_3_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_73_                           ), //i
    .io_pop_data     (macs_4_3_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_4_3_mac_io_en                ), //i
    .io_pop_valid    (macs_4_3_fifoB_io_pop_valid       ), //o
    .io_full         (macs_4_3_fifoB_io_full            ), //o
    .io_empty        (macs_4_3_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_4_4_fifoA ( 
    .io_push_data    (io_flowA_payload[15:0]            ), //i
    .io_push_en      (_zz_74_                           ), //i
    .io_pop_data     (macs_4_4_fifoA_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_4_4_mac_io_en                ), //i
    .io_pop_valid    (macs_4_4_fifoA_io_pop_valid       ), //o
    .io_full         (macs_4_4_fifoA_io_full            ), //o
    .io_empty        (macs_4_4_fifoA_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Fifo macs_4_4_fifoB ( 
    .io_push_data    (io_flowB_payload[15:0]            ), //i
    .io_push_en      (_zz_75_                           ), //i
    .io_pop_data     (macs_4_4_fifoB_io_pop_data[15:0]  ), //o
    .io_pop_en       (macs_4_4_mac_io_en                ), //i
    .io_pop_valid    (macs_4_4_fifoB_io_pop_valid       ), //o
    .io_full         (macs_4_4_fifoB_io_full            ), //o
    .io_empty        (macs_4_4_fifoB_io_empty           ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  always @ (*) begin
    counters_ai_willIncrement = 1'b0;
    if(io_flowA_valid)begin
      if(counters_aj_willOverflow)begin
        counters_ai_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    counters_ai_willClear = 1'b0;
    if(io_clear)begin
      counters_ai_willClear = 1'b1;
    end
  end

  assign counters_ai_willOverflowIfInc = (counters_ai_value == (3'b100));
  assign counters_ai_willOverflow = (counters_ai_willOverflowIfInc && counters_ai_willIncrement);
  always @ (*) begin
    if(counters_ai_willOverflow)begin
      counters_ai_valueNext = (3'b000);
    end else begin
      counters_ai_valueNext = (counters_ai_value + _zz_77_);
    end
    if(counters_ai_willClear)begin
      counters_ai_valueNext = (3'b000);
    end
  end

  always @ (*) begin
    counters_aj_willIncrement = 1'b0;
    if(io_flowA_valid)begin
      counters_aj_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    counters_aj_willClear = 1'b0;
    if(io_clear)begin
      counters_aj_willClear = 1'b1;
    end
  end

  assign counters_aj_willOverflowIfInc = (counters_aj_value == (3'b100));
  assign counters_aj_willOverflow = (counters_aj_willOverflowIfInc && counters_aj_willIncrement);
  always @ (*) begin
    if(counters_aj_willOverflow)begin
      counters_aj_valueNext = (3'b000);
    end else begin
      counters_aj_valueNext = (counters_aj_value + _zz_79_);
    end
    if(counters_aj_willClear)begin
      counters_aj_valueNext = (3'b000);
    end
  end

  always @ (*) begin
    counters_bi_willIncrement = 1'b0;
    if(io_flowB_valid)begin
      if(counters_bj_willOverflow)begin
        counters_bi_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    counters_bi_willClear = 1'b0;
    if(io_clear)begin
      counters_bi_willClear = 1'b1;
    end
  end

  assign counters_bi_willOverflowIfInc = (counters_bi_value == (3'b100));
  assign counters_bi_willOverflow = (counters_bi_willOverflowIfInc && counters_bi_willIncrement);
  always @ (*) begin
    if(counters_bi_willOverflow)begin
      counters_bi_valueNext = (3'b000);
    end else begin
      counters_bi_valueNext = (counters_bi_value + _zz_81_);
    end
    if(counters_bi_willClear)begin
      counters_bi_valueNext = (3'b000);
    end
  end

  always @ (*) begin
    counters_bj_willIncrement = 1'b0;
    if(io_flowB_valid)begin
      counters_bj_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    counters_bj_willClear = 1'b0;
    if(io_clear)begin
      counters_bj_willClear = 1'b1;
    end
  end

  assign counters_bj_willOverflowIfInc = (counters_bj_value == (3'b100));
  assign counters_bj_willOverflow = (counters_bj_willOverflowIfInc && counters_bj_willIncrement);
  always @ (*) begin
    if(counters_bj_willOverflow)begin
      counters_bj_valueNext = (3'b000);
    end else begin
      counters_bj_valueNext = (counters_bj_value + _zz_83_);
    end
    if(counters_bj_willClear)begin
      counters_bj_valueNext = (3'b000);
    end
  end

  assign last = (counters_lastA && counters_lastB);
  assign edge_1_ = ((! last_regNext) && last);
  assign io_done = edge_1__delay_3;
  assign io_last = last;
  always @ (*) begin
    if(macs_0_0_mac_impl_sr_regNextWhen)begin
      macs_0_0_mac_impl_or = 32'h0;
    end else begin
      macs_0_0_mac_impl_or = macs_0_0_mac_impl_adder;
    end
  end

  assign macs_0_0_mac_impl_c = macs_0_0_mac_impl_adder;
  assign macs_0_0_mac_impl_a = macs_0_0_mac_io_a;
  assign macs_0_0_mac_impl_b = macs_0_0_mac_io_b;
  assign macs_0_0_mac_io_res = macs_0_0_mac_impl_c;
  assign macs_0_0_mac_impl_clr = macs_0_0_mac_io_clr;
  assign macs_0_0_mac_impl_en = macs_0_0_mac_io_en;
  assign _zz_26_ = (io_flowA_valid && (counters_ai_value == (3'b000)));
  assign _zz_27_ = (io_flowB_valid && (counters_bj_value == (3'b000)));
  always @ (*) begin
    macs_0_0_mac_io_a = macs_0_0_fifoA_io_pop_data;
    if(last)begin
      macs_0_0_mac_io_a = (_zz_1_ ? macs_0_0_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_0_0_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_0_0_mac_io_b = macs_0_0_fifoB_io_pop_data;
    if(last)begin
      macs_0_0_mac_io_b = (_zz_1_ ? macs_0_0_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_0_0_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_0_0_mac_io_en = ((! macs_0_0_fifoA_io_empty) && (! macs_0_0_fifoB_io_empty));
    if(last)begin
      macs_0_0_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_0_0_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_0_0_mac_io_clr = 1'b0;
    if(last)begin
      macs_0_0_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_0_0_mac_io_clr = 1'b1;
    end
  end

  assign _zz_1_ = (! macs_0_0_fifoA_io_empty);
  assign io_results_0_0 = macs_0_0_mac_io_res;
  always @ (*) begin
    if(macs_0_1_mac_impl_sr_regNextWhen)begin
      macs_0_1_mac_impl_or = 32'h0;
    end else begin
      macs_0_1_mac_impl_or = macs_0_1_mac_impl_adder;
    end
  end

  assign macs_0_1_mac_impl_c = macs_0_1_mac_impl_adder;
  assign macs_0_1_mac_impl_a = macs_0_1_mac_io_a;
  assign macs_0_1_mac_impl_b = macs_0_1_mac_io_b;
  assign macs_0_1_mac_io_res = macs_0_1_mac_impl_c;
  assign macs_0_1_mac_impl_clr = macs_0_1_mac_io_clr;
  assign macs_0_1_mac_impl_en = macs_0_1_mac_io_en;
  assign _zz_28_ = (io_flowA_valid && (counters_ai_value == (3'b000)));
  assign _zz_29_ = (io_flowB_valid && (counters_bj_value == (3'b001)));
  always @ (*) begin
    macs_0_1_mac_io_a = macs_0_1_fifoA_io_pop_data;
    if(last)begin
      macs_0_1_mac_io_a = (_zz_2_ ? macs_0_1_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_0_1_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_0_1_mac_io_b = macs_0_1_fifoB_io_pop_data;
    if(last)begin
      macs_0_1_mac_io_b = (_zz_2_ ? macs_0_1_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_0_1_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_0_1_mac_io_en = ((! macs_0_1_fifoA_io_empty) && (! macs_0_1_fifoB_io_empty));
    if(last)begin
      macs_0_1_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_0_1_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_0_1_mac_io_clr = 1'b0;
    if(last)begin
      macs_0_1_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_0_1_mac_io_clr = 1'b1;
    end
  end

  assign _zz_2_ = (! macs_0_1_fifoA_io_empty);
  assign io_results_0_1 = macs_0_1_mac_io_res;
  always @ (*) begin
    if(macs_0_2_mac_impl_sr_regNextWhen)begin
      macs_0_2_mac_impl_or = 32'h0;
    end else begin
      macs_0_2_mac_impl_or = macs_0_2_mac_impl_adder;
    end
  end

  assign macs_0_2_mac_impl_c = macs_0_2_mac_impl_adder;
  assign macs_0_2_mac_impl_a = macs_0_2_mac_io_a;
  assign macs_0_2_mac_impl_b = macs_0_2_mac_io_b;
  assign macs_0_2_mac_io_res = macs_0_2_mac_impl_c;
  assign macs_0_2_mac_impl_clr = macs_0_2_mac_io_clr;
  assign macs_0_2_mac_impl_en = macs_0_2_mac_io_en;
  assign _zz_30_ = (io_flowA_valid && (counters_ai_value == (3'b000)));
  assign _zz_31_ = (io_flowB_valid && (counters_bj_value == (3'b010)));
  always @ (*) begin
    macs_0_2_mac_io_a = macs_0_2_fifoA_io_pop_data;
    if(last)begin
      macs_0_2_mac_io_a = (_zz_3_ ? macs_0_2_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_0_2_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_0_2_mac_io_b = macs_0_2_fifoB_io_pop_data;
    if(last)begin
      macs_0_2_mac_io_b = (_zz_3_ ? macs_0_2_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_0_2_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_0_2_mac_io_en = ((! macs_0_2_fifoA_io_empty) && (! macs_0_2_fifoB_io_empty));
    if(last)begin
      macs_0_2_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_0_2_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_0_2_mac_io_clr = 1'b0;
    if(last)begin
      macs_0_2_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_0_2_mac_io_clr = 1'b1;
    end
  end

  assign _zz_3_ = (! macs_0_2_fifoA_io_empty);
  assign io_results_0_2 = macs_0_2_mac_io_res;
  always @ (*) begin
    if(macs_0_3_mac_impl_sr_regNextWhen)begin
      macs_0_3_mac_impl_or = 32'h0;
    end else begin
      macs_0_3_mac_impl_or = macs_0_3_mac_impl_adder;
    end
  end

  assign macs_0_3_mac_impl_c = macs_0_3_mac_impl_adder;
  assign macs_0_3_mac_impl_a = macs_0_3_mac_io_a;
  assign macs_0_3_mac_impl_b = macs_0_3_mac_io_b;
  assign macs_0_3_mac_io_res = macs_0_3_mac_impl_c;
  assign macs_0_3_mac_impl_clr = macs_0_3_mac_io_clr;
  assign macs_0_3_mac_impl_en = macs_0_3_mac_io_en;
  assign _zz_32_ = (io_flowA_valid && (counters_ai_value == (3'b000)));
  assign _zz_33_ = (io_flowB_valid && (counters_bj_value == (3'b011)));
  always @ (*) begin
    macs_0_3_mac_io_a = macs_0_3_fifoA_io_pop_data;
    if(last)begin
      macs_0_3_mac_io_a = (_zz_4_ ? macs_0_3_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_0_3_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_0_3_mac_io_b = macs_0_3_fifoB_io_pop_data;
    if(last)begin
      macs_0_3_mac_io_b = (_zz_4_ ? macs_0_3_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_0_3_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_0_3_mac_io_en = ((! macs_0_3_fifoA_io_empty) && (! macs_0_3_fifoB_io_empty));
    if(last)begin
      macs_0_3_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_0_3_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_0_3_mac_io_clr = 1'b0;
    if(last)begin
      macs_0_3_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_0_3_mac_io_clr = 1'b1;
    end
  end

  assign _zz_4_ = (! macs_0_3_fifoA_io_empty);
  assign io_results_0_3 = macs_0_3_mac_io_res;
  always @ (*) begin
    if(macs_0_4_mac_impl_sr_regNextWhen)begin
      macs_0_4_mac_impl_or = 32'h0;
    end else begin
      macs_0_4_mac_impl_or = macs_0_4_mac_impl_adder;
    end
  end

  assign macs_0_4_mac_impl_c = macs_0_4_mac_impl_adder;
  assign macs_0_4_mac_impl_a = macs_0_4_mac_io_a;
  assign macs_0_4_mac_impl_b = macs_0_4_mac_io_b;
  assign macs_0_4_mac_io_res = macs_0_4_mac_impl_c;
  assign macs_0_4_mac_impl_clr = macs_0_4_mac_io_clr;
  assign macs_0_4_mac_impl_en = macs_0_4_mac_io_en;
  assign _zz_34_ = (io_flowA_valid && (counters_ai_value == (3'b000)));
  assign _zz_35_ = (io_flowB_valid && (counters_bj_value == (3'b100)));
  always @ (*) begin
    macs_0_4_mac_io_a = macs_0_4_fifoA_io_pop_data;
    if(last)begin
      macs_0_4_mac_io_a = (_zz_5_ ? macs_0_4_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_0_4_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_0_4_mac_io_b = macs_0_4_fifoB_io_pop_data;
    if(last)begin
      macs_0_4_mac_io_b = (_zz_5_ ? macs_0_4_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_0_4_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_0_4_mac_io_en = ((! macs_0_4_fifoA_io_empty) && (! macs_0_4_fifoB_io_empty));
    if(last)begin
      macs_0_4_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_0_4_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_0_4_mac_io_clr = 1'b0;
    if(last)begin
      macs_0_4_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_0_4_mac_io_clr = 1'b1;
    end
  end

  assign _zz_5_ = (! macs_0_4_fifoA_io_empty);
  assign io_results_0_4 = macs_0_4_mac_io_res;
  always @ (*) begin
    if(macs_1_0_mac_impl_sr_regNextWhen)begin
      macs_1_0_mac_impl_or = 32'h0;
    end else begin
      macs_1_0_mac_impl_or = macs_1_0_mac_impl_adder;
    end
  end

  assign macs_1_0_mac_impl_c = macs_1_0_mac_impl_adder;
  assign macs_1_0_mac_impl_a = macs_1_0_mac_io_a;
  assign macs_1_0_mac_impl_b = macs_1_0_mac_io_b;
  assign macs_1_0_mac_io_res = macs_1_0_mac_impl_c;
  assign macs_1_0_mac_impl_clr = macs_1_0_mac_io_clr;
  assign macs_1_0_mac_impl_en = macs_1_0_mac_io_en;
  assign _zz_36_ = (io_flowA_valid && (counters_ai_value == (3'b001)));
  assign _zz_37_ = (io_flowB_valid && (counters_bj_value == (3'b000)));
  always @ (*) begin
    macs_1_0_mac_io_a = macs_1_0_fifoA_io_pop_data;
    if(last)begin
      macs_1_0_mac_io_a = (_zz_6_ ? macs_1_0_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_1_0_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_1_0_mac_io_b = macs_1_0_fifoB_io_pop_data;
    if(last)begin
      macs_1_0_mac_io_b = (_zz_6_ ? macs_1_0_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_1_0_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_1_0_mac_io_en = ((! macs_1_0_fifoA_io_empty) && (! macs_1_0_fifoB_io_empty));
    if(last)begin
      macs_1_0_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_1_0_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_1_0_mac_io_clr = 1'b0;
    if(last)begin
      macs_1_0_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_1_0_mac_io_clr = 1'b1;
    end
  end

  assign _zz_6_ = (! macs_1_0_fifoA_io_empty);
  assign io_results_1_0 = macs_1_0_mac_io_res;
  always @ (*) begin
    if(macs_1_1_mac_impl_sr_regNextWhen)begin
      macs_1_1_mac_impl_or = 32'h0;
    end else begin
      macs_1_1_mac_impl_or = macs_1_1_mac_impl_adder;
    end
  end

  assign macs_1_1_mac_impl_c = macs_1_1_mac_impl_adder;
  assign macs_1_1_mac_impl_a = macs_1_1_mac_io_a;
  assign macs_1_1_mac_impl_b = macs_1_1_mac_io_b;
  assign macs_1_1_mac_io_res = macs_1_1_mac_impl_c;
  assign macs_1_1_mac_impl_clr = macs_1_1_mac_io_clr;
  assign macs_1_1_mac_impl_en = macs_1_1_mac_io_en;
  assign _zz_38_ = (io_flowA_valid && (counters_ai_value == (3'b001)));
  assign _zz_39_ = (io_flowB_valid && (counters_bj_value == (3'b001)));
  always @ (*) begin
    macs_1_1_mac_io_a = macs_1_1_fifoA_io_pop_data;
    if(last)begin
      macs_1_1_mac_io_a = (_zz_7_ ? macs_1_1_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_1_1_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_1_1_mac_io_b = macs_1_1_fifoB_io_pop_data;
    if(last)begin
      macs_1_1_mac_io_b = (_zz_7_ ? macs_1_1_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_1_1_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_1_1_mac_io_en = ((! macs_1_1_fifoA_io_empty) && (! macs_1_1_fifoB_io_empty));
    if(last)begin
      macs_1_1_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_1_1_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_1_1_mac_io_clr = 1'b0;
    if(last)begin
      macs_1_1_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_1_1_mac_io_clr = 1'b1;
    end
  end

  assign _zz_7_ = (! macs_1_1_fifoA_io_empty);
  assign io_results_1_1 = macs_1_1_mac_io_res;
  always @ (*) begin
    if(macs_1_2_mac_impl_sr_regNextWhen)begin
      macs_1_2_mac_impl_or = 32'h0;
    end else begin
      macs_1_2_mac_impl_or = macs_1_2_mac_impl_adder;
    end
  end

  assign macs_1_2_mac_impl_c = macs_1_2_mac_impl_adder;
  assign macs_1_2_mac_impl_a = macs_1_2_mac_io_a;
  assign macs_1_2_mac_impl_b = macs_1_2_mac_io_b;
  assign macs_1_2_mac_io_res = macs_1_2_mac_impl_c;
  assign macs_1_2_mac_impl_clr = macs_1_2_mac_io_clr;
  assign macs_1_2_mac_impl_en = macs_1_2_mac_io_en;
  assign _zz_40_ = (io_flowA_valid && (counters_ai_value == (3'b001)));
  assign _zz_41_ = (io_flowB_valid && (counters_bj_value == (3'b010)));
  always @ (*) begin
    macs_1_2_mac_io_a = macs_1_2_fifoA_io_pop_data;
    if(last)begin
      macs_1_2_mac_io_a = (_zz_8_ ? macs_1_2_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_1_2_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_1_2_mac_io_b = macs_1_2_fifoB_io_pop_data;
    if(last)begin
      macs_1_2_mac_io_b = (_zz_8_ ? macs_1_2_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_1_2_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_1_2_mac_io_en = ((! macs_1_2_fifoA_io_empty) && (! macs_1_2_fifoB_io_empty));
    if(last)begin
      macs_1_2_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_1_2_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_1_2_mac_io_clr = 1'b0;
    if(last)begin
      macs_1_2_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_1_2_mac_io_clr = 1'b1;
    end
  end

  assign _zz_8_ = (! macs_1_2_fifoA_io_empty);
  assign io_results_1_2 = macs_1_2_mac_io_res;
  always @ (*) begin
    if(macs_1_3_mac_impl_sr_regNextWhen)begin
      macs_1_3_mac_impl_or = 32'h0;
    end else begin
      macs_1_3_mac_impl_or = macs_1_3_mac_impl_adder;
    end
  end

  assign macs_1_3_mac_impl_c = macs_1_3_mac_impl_adder;
  assign macs_1_3_mac_impl_a = macs_1_3_mac_io_a;
  assign macs_1_3_mac_impl_b = macs_1_3_mac_io_b;
  assign macs_1_3_mac_io_res = macs_1_3_mac_impl_c;
  assign macs_1_3_mac_impl_clr = macs_1_3_mac_io_clr;
  assign macs_1_3_mac_impl_en = macs_1_3_mac_io_en;
  assign _zz_42_ = (io_flowA_valid && (counters_ai_value == (3'b001)));
  assign _zz_43_ = (io_flowB_valid && (counters_bj_value == (3'b011)));
  always @ (*) begin
    macs_1_3_mac_io_a = macs_1_3_fifoA_io_pop_data;
    if(last)begin
      macs_1_3_mac_io_a = (_zz_9_ ? macs_1_3_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_1_3_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_1_3_mac_io_b = macs_1_3_fifoB_io_pop_data;
    if(last)begin
      macs_1_3_mac_io_b = (_zz_9_ ? macs_1_3_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_1_3_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_1_3_mac_io_en = ((! macs_1_3_fifoA_io_empty) && (! macs_1_3_fifoB_io_empty));
    if(last)begin
      macs_1_3_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_1_3_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_1_3_mac_io_clr = 1'b0;
    if(last)begin
      macs_1_3_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_1_3_mac_io_clr = 1'b1;
    end
  end

  assign _zz_9_ = (! macs_1_3_fifoA_io_empty);
  assign io_results_1_3 = macs_1_3_mac_io_res;
  always @ (*) begin
    if(macs_1_4_mac_impl_sr_regNextWhen)begin
      macs_1_4_mac_impl_or = 32'h0;
    end else begin
      macs_1_4_mac_impl_or = macs_1_4_mac_impl_adder;
    end
  end

  assign macs_1_4_mac_impl_c = macs_1_4_mac_impl_adder;
  assign macs_1_4_mac_impl_a = macs_1_4_mac_io_a;
  assign macs_1_4_mac_impl_b = macs_1_4_mac_io_b;
  assign macs_1_4_mac_io_res = macs_1_4_mac_impl_c;
  assign macs_1_4_mac_impl_clr = macs_1_4_mac_io_clr;
  assign macs_1_4_mac_impl_en = macs_1_4_mac_io_en;
  assign _zz_44_ = (io_flowA_valid && (counters_ai_value == (3'b001)));
  assign _zz_45_ = (io_flowB_valid && (counters_bj_value == (3'b100)));
  always @ (*) begin
    macs_1_4_mac_io_a = macs_1_4_fifoA_io_pop_data;
    if(last)begin
      macs_1_4_mac_io_a = (_zz_10_ ? macs_1_4_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_1_4_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_1_4_mac_io_b = macs_1_4_fifoB_io_pop_data;
    if(last)begin
      macs_1_4_mac_io_b = (_zz_10_ ? macs_1_4_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_1_4_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_1_4_mac_io_en = ((! macs_1_4_fifoA_io_empty) && (! macs_1_4_fifoB_io_empty));
    if(last)begin
      macs_1_4_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_1_4_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_1_4_mac_io_clr = 1'b0;
    if(last)begin
      macs_1_4_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_1_4_mac_io_clr = 1'b1;
    end
  end

  assign _zz_10_ = (! macs_1_4_fifoA_io_empty);
  assign io_results_1_4 = macs_1_4_mac_io_res;
  always @ (*) begin
    if(macs_2_0_mac_impl_sr_regNextWhen)begin
      macs_2_0_mac_impl_or = 32'h0;
    end else begin
      macs_2_0_mac_impl_or = macs_2_0_mac_impl_adder;
    end
  end

  assign macs_2_0_mac_impl_c = macs_2_0_mac_impl_adder;
  assign macs_2_0_mac_impl_a = macs_2_0_mac_io_a;
  assign macs_2_0_mac_impl_b = macs_2_0_mac_io_b;
  assign macs_2_0_mac_io_res = macs_2_0_mac_impl_c;
  assign macs_2_0_mac_impl_clr = macs_2_0_mac_io_clr;
  assign macs_2_0_mac_impl_en = macs_2_0_mac_io_en;
  assign _zz_46_ = (io_flowA_valid && (counters_ai_value == (3'b010)));
  assign _zz_47_ = (io_flowB_valid && (counters_bj_value == (3'b000)));
  always @ (*) begin
    macs_2_0_mac_io_a = macs_2_0_fifoA_io_pop_data;
    if(last)begin
      macs_2_0_mac_io_a = (_zz_11_ ? macs_2_0_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_2_0_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_2_0_mac_io_b = macs_2_0_fifoB_io_pop_data;
    if(last)begin
      macs_2_0_mac_io_b = (_zz_11_ ? macs_2_0_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_2_0_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_2_0_mac_io_en = ((! macs_2_0_fifoA_io_empty) && (! macs_2_0_fifoB_io_empty));
    if(last)begin
      macs_2_0_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_2_0_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_2_0_mac_io_clr = 1'b0;
    if(last)begin
      macs_2_0_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_2_0_mac_io_clr = 1'b1;
    end
  end

  assign _zz_11_ = (! macs_2_0_fifoA_io_empty);
  assign io_results_2_0 = macs_2_0_mac_io_res;
  always @ (*) begin
    if(macs_2_1_mac_impl_sr_regNextWhen)begin
      macs_2_1_mac_impl_or = 32'h0;
    end else begin
      macs_2_1_mac_impl_or = macs_2_1_mac_impl_adder;
    end
  end

  assign macs_2_1_mac_impl_c = macs_2_1_mac_impl_adder;
  assign macs_2_1_mac_impl_a = macs_2_1_mac_io_a;
  assign macs_2_1_mac_impl_b = macs_2_1_mac_io_b;
  assign macs_2_1_mac_io_res = macs_2_1_mac_impl_c;
  assign macs_2_1_mac_impl_clr = macs_2_1_mac_io_clr;
  assign macs_2_1_mac_impl_en = macs_2_1_mac_io_en;
  assign _zz_48_ = (io_flowA_valid && (counters_ai_value == (3'b010)));
  assign _zz_49_ = (io_flowB_valid && (counters_bj_value == (3'b001)));
  always @ (*) begin
    macs_2_1_mac_io_a = macs_2_1_fifoA_io_pop_data;
    if(last)begin
      macs_2_1_mac_io_a = (_zz_12_ ? macs_2_1_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_2_1_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_2_1_mac_io_b = macs_2_1_fifoB_io_pop_data;
    if(last)begin
      macs_2_1_mac_io_b = (_zz_12_ ? macs_2_1_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_2_1_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_2_1_mac_io_en = ((! macs_2_1_fifoA_io_empty) && (! macs_2_1_fifoB_io_empty));
    if(last)begin
      macs_2_1_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_2_1_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_2_1_mac_io_clr = 1'b0;
    if(last)begin
      macs_2_1_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_2_1_mac_io_clr = 1'b1;
    end
  end

  assign _zz_12_ = (! macs_2_1_fifoA_io_empty);
  assign io_results_2_1 = macs_2_1_mac_io_res;
  always @ (*) begin
    if(macs_2_2_mac_impl_sr_regNextWhen)begin
      macs_2_2_mac_impl_or = 32'h0;
    end else begin
      macs_2_2_mac_impl_or = macs_2_2_mac_impl_adder;
    end
  end

  assign macs_2_2_mac_impl_c = macs_2_2_mac_impl_adder;
  assign macs_2_2_mac_impl_a = macs_2_2_mac_io_a;
  assign macs_2_2_mac_impl_b = macs_2_2_mac_io_b;
  assign macs_2_2_mac_io_res = macs_2_2_mac_impl_c;
  assign macs_2_2_mac_impl_clr = macs_2_2_mac_io_clr;
  assign macs_2_2_mac_impl_en = macs_2_2_mac_io_en;
  assign _zz_50_ = (io_flowA_valid && (counters_ai_value == (3'b010)));
  assign _zz_51_ = (io_flowB_valid && (counters_bj_value == (3'b010)));
  always @ (*) begin
    macs_2_2_mac_io_a = macs_2_2_fifoA_io_pop_data;
    if(last)begin
      macs_2_2_mac_io_a = (_zz_13_ ? macs_2_2_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_2_2_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_2_2_mac_io_b = macs_2_2_fifoB_io_pop_data;
    if(last)begin
      macs_2_2_mac_io_b = (_zz_13_ ? macs_2_2_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_2_2_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_2_2_mac_io_en = ((! macs_2_2_fifoA_io_empty) && (! macs_2_2_fifoB_io_empty));
    if(last)begin
      macs_2_2_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_2_2_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_2_2_mac_io_clr = 1'b0;
    if(last)begin
      macs_2_2_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_2_2_mac_io_clr = 1'b1;
    end
  end

  assign _zz_13_ = (! macs_2_2_fifoA_io_empty);
  assign io_results_2_2 = macs_2_2_mac_io_res;
  always @ (*) begin
    if(macs_2_3_mac_impl_sr_regNextWhen)begin
      macs_2_3_mac_impl_or = 32'h0;
    end else begin
      macs_2_3_mac_impl_or = macs_2_3_mac_impl_adder;
    end
  end

  assign macs_2_3_mac_impl_c = macs_2_3_mac_impl_adder;
  assign macs_2_3_mac_impl_a = macs_2_3_mac_io_a;
  assign macs_2_3_mac_impl_b = macs_2_3_mac_io_b;
  assign macs_2_3_mac_io_res = macs_2_3_mac_impl_c;
  assign macs_2_3_mac_impl_clr = macs_2_3_mac_io_clr;
  assign macs_2_3_mac_impl_en = macs_2_3_mac_io_en;
  assign _zz_52_ = (io_flowA_valid && (counters_ai_value == (3'b010)));
  assign _zz_53_ = (io_flowB_valid && (counters_bj_value == (3'b011)));
  always @ (*) begin
    macs_2_3_mac_io_a = macs_2_3_fifoA_io_pop_data;
    if(last)begin
      macs_2_3_mac_io_a = (_zz_14_ ? macs_2_3_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_2_3_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_2_3_mac_io_b = macs_2_3_fifoB_io_pop_data;
    if(last)begin
      macs_2_3_mac_io_b = (_zz_14_ ? macs_2_3_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_2_3_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_2_3_mac_io_en = ((! macs_2_3_fifoA_io_empty) && (! macs_2_3_fifoB_io_empty));
    if(last)begin
      macs_2_3_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_2_3_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_2_3_mac_io_clr = 1'b0;
    if(last)begin
      macs_2_3_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_2_3_mac_io_clr = 1'b1;
    end
  end

  assign _zz_14_ = (! macs_2_3_fifoA_io_empty);
  assign io_results_2_3 = macs_2_3_mac_io_res;
  always @ (*) begin
    if(macs_2_4_mac_impl_sr_regNextWhen)begin
      macs_2_4_mac_impl_or = 32'h0;
    end else begin
      macs_2_4_mac_impl_or = macs_2_4_mac_impl_adder;
    end
  end

  assign macs_2_4_mac_impl_c = macs_2_4_mac_impl_adder;
  assign macs_2_4_mac_impl_a = macs_2_4_mac_io_a;
  assign macs_2_4_mac_impl_b = macs_2_4_mac_io_b;
  assign macs_2_4_mac_io_res = macs_2_4_mac_impl_c;
  assign macs_2_4_mac_impl_clr = macs_2_4_mac_io_clr;
  assign macs_2_4_mac_impl_en = macs_2_4_mac_io_en;
  assign _zz_54_ = (io_flowA_valid && (counters_ai_value == (3'b010)));
  assign _zz_55_ = (io_flowB_valid && (counters_bj_value == (3'b100)));
  always @ (*) begin
    macs_2_4_mac_io_a = macs_2_4_fifoA_io_pop_data;
    if(last)begin
      macs_2_4_mac_io_a = (_zz_15_ ? macs_2_4_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_2_4_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_2_4_mac_io_b = macs_2_4_fifoB_io_pop_data;
    if(last)begin
      macs_2_4_mac_io_b = (_zz_15_ ? macs_2_4_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_2_4_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_2_4_mac_io_en = ((! macs_2_4_fifoA_io_empty) && (! macs_2_4_fifoB_io_empty));
    if(last)begin
      macs_2_4_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_2_4_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_2_4_mac_io_clr = 1'b0;
    if(last)begin
      macs_2_4_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_2_4_mac_io_clr = 1'b1;
    end
  end

  assign _zz_15_ = (! macs_2_4_fifoA_io_empty);
  assign io_results_2_4 = macs_2_4_mac_io_res;
  always @ (*) begin
    if(macs_3_0_mac_impl_sr_regNextWhen)begin
      macs_3_0_mac_impl_or = 32'h0;
    end else begin
      macs_3_0_mac_impl_or = macs_3_0_mac_impl_adder;
    end
  end

  assign macs_3_0_mac_impl_c = macs_3_0_mac_impl_adder;
  assign macs_3_0_mac_impl_a = macs_3_0_mac_io_a;
  assign macs_3_0_mac_impl_b = macs_3_0_mac_io_b;
  assign macs_3_0_mac_io_res = macs_3_0_mac_impl_c;
  assign macs_3_0_mac_impl_clr = macs_3_0_mac_io_clr;
  assign macs_3_0_mac_impl_en = macs_3_0_mac_io_en;
  assign _zz_56_ = (io_flowA_valid && (counters_ai_value == (3'b011)));
  assign _zz_57_ = (io_flowB_valid && (counters_bj_value == (3'b000)));
  always @ (*) begin
    macs_3_0_mac_io_a = macs_3_0_fifoA_io_pop_data;
    if(last)begin
      macs_3_0_mac_io_a = (_zz_16_ ? macs_3_0_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_3_0_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_3_0_mac_io_b = macs_3_0_fifoB_io_pop_data;
    if(last)begin
      macs_3_0_mac_io_b = (_zz_16_ ? macs_3_0_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_3_0_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_3_0_mac_io_en = ((! macs_3_0_fifoA_io_empty) && (! macs_3_0_fifoB_io_empty));
    if(last)begin
      macs_3_0_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_3_0_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_3_0_mac_io_clr = 1'b0;
    if(last)begin
      macs_3_0_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_3_0_mac_io_clr = 1'b1;
    end
  end

  assign _zz_16_ = (! macs_3_0_fifoA_io_empty);
  assign io_results_3_0 = macs_3_0_mac_io_res;
  always @ (*) begin
    if(macs_3_1_mac_impl_sr_regNextWhen)begin
      macs_3_1_mac_impl_or = 32'h0;
    end else begin
      macs_3_1_mac_impl_or = macs_3_1_mac_impl_adder;
    end
  end

  assign macs_3_1_mac_impl_c = macs_3_1_mac_impl_adder;
  assign macs_3_1_mac_impl_a = macs_3_1_mac_io_a;
  assign macs_3_1_mac_impl_b = macs_3_1_mac_io_b;
  assign macs_3_1_mac_io_res = macs_3_1_mac_impl_c;
  assign macs_3_1_mac_impl_clr = macs_3_1_mac_io_clr;
  assign macs_3_1_mac_impl_en = macs_3_1_mac_io_en;
  assign _zz_58_ = (io_flowA_valid && (counters_ai_value == (3'b011)));
  assign _zz_59_ = (io_flowB_valid && (counters_bj_value == (3'b001)));
  always @ (*) begin
    macs_3_1_mac_io_a = macs_3_1_fifoA_io_pop_data;
    if(last)begin
      macs_3_1_mac_io_a = (_zz_17_ ? macs_3_1_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_3_1_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_3_1_mac_io_b = macs_3_1_fifoB_io_pop_data;
    if(last)begin
      macs_3_1_mac_io_b = (_zz_17_ ? macs_3_1_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_3_1_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_3_1_mac_io_en = ((! macs_3_1_fifoA_io_empty) && (! macs_3_1_fifoB_io_empty));
    if(last)begin
      macs_3_1_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_3_1_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_3_1_mac_io_clr = 1'b0;
    if(last)begin
      macs_3_1_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_3_1_mac_io_clr = 1'b1;
    end
  end

  assign _zz_17_ = (! macs_3_1_fifoA_io_empty);
  assign io_results_3_1 = macs_3_1_mac_io_res;
  always @ (*) begin
    if(macs_3_2_mac_impl_sr_regNextWhen)begin
      macs_3_2_mac_impl_or = 32'h0;
    end else begin
      macs_3_2_mac_impl_or = macs_3_2_mac_impl_adder;
    end
  end

  assign macs_3_2_mac_impl_c = macs_3_2_mac_impl_adder;
  assign macs_3_2_mac_impl_a = macs_3_2_mac_io_a;
  assign macs_3_2_mac_impl_b = macs_3_2_mac_io_b;
  assign macs_3_2_mac_io_res = macs_3_2_mac_impl_c;
  assign macs_3_2_mac_impl_clr = macs_3_2_mac_io_clr;
  assign macs_3_2_mac_impl_en = macs_3_2_mac_io_en;
  assign _zz_60_ = (io_flowA_valid && (counters_ai_value == (3'b011)));
  assign _zz_61_ = (io_flowB_valid && (counters_bj_value == (3'b010)));
  always @ (*) begin
    macs_3_2_mac_io_a = macs_3_2_fifoA_io_pop_data;
    if(last)begin
      macs_3_2_mac_io_a = (_zz_18_ ? macs_3_2_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_3_2_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_3_2_mac_io_b = macs_3_2_fifoB_io_pop_data;
    if(last)begin
      macs_3_2_mac_io_b = (_zz_18_ ? macs_3_2_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_3_2_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_3_2_mac_io_en = ((! macs_3_2_fifoA_io_empty) && (! macs_3_2_fifoB_io_empty));
    if(last)begin
      macs_3_2_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_3_2_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_3_2_mac_io_clr = 1'b0;
    if(last)begin
      macs_3_2_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_3_2_mac_io_clr = 1'b1;
    end
  end

  assign _zz_18_ = (! macs_3_2_fifoA_io_empty);
  assign io_results_3_2 = macs_3_2_mac_io_res;
  always @ (*) begin
    if(macs_3_3_mac_impl_sr_regNextWhen)begin
      macs_3_3_mac_impl_or = 32'h0;
    end else begin
      macs_3_3_mac_impl_or = macs_3_3_mac_impl_adder;
    end
  end

  assign macs_3_3_mac_impl_c = macs_3_3_mac_impl_adder;
  assign macs_3_3_mac_impl_a = macs_3_3_mac_io_a;
  assign macs_3_3_mac_impl_b = macs_3_3_mac_io_b;
  assign macs_3_3_mac_io_res = macs_3_3_mac_impl_c;
  assign macs_3_3_mac_impl_clr = macs_3_3_mac_io_clr;
  assign macs_3_3_mac_impl_en = macs_3_3_mac_io_en;
  assign _zz_62_ = (io_flowA_valid && (counters_ai_value == (3'b011)));
  assign _zz_63_ = (io_flowB_valid && (counters_bj_value == (3'b011)));
  always @ (*) begin
    macs_3_3_mac_io_a = macs_3_3_fifoA_io_pop_data;
    if(last)begin
      macs_3_3_mac_io_a = (_zz_19_ ? macs_3_3_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_3_3_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_3_3_mac_io_b = macs_3_3_fifoB_io_pop_data;
    if(last)begin
      macs_3_3_mac_io_b = (_zz_19_ ? macs_3_3_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_3_3_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_3_3_mac_io_en = ((! macs_3_3_fifoA_io_empty) && (! macs_3_3_fifoB_io_empty));
    if(last)begin
      macs_3_3_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_3_3_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_3_3_mac_io_clr = 1'b0;
    if(last)begin
      macs_3_3_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_3_3_mac_io_clr = 1'b1;
    end
  end

  assign _zz_19_ = (! macs_3_3_fifoA_io_empty);
  assign io_results_3_3 = macs_3_3_mac_io_res;
  always @ (*) begin
    if(macs_3_4_mac_impl_sr_regNextWhen)begin
      macs_3_4_mac_impl_or = 32'h0;
    end else begin
      macs_3_4_mac_impl_or = macs_3_4_mac_impl_adder;
    end
  end

  assign macs_3_4_mac_impl_c = macs_3_4_mac_impl_adder;
  assign macs_3_4_mac_impl_a = macs_3_4_mac_io_a;
  assign macs_3_4_mac_impl_b = macs_3_4_mac_io_b;
  assign macs_3_4_mac_io_res = macs_3_4_mac_impl_c;
  assign macs_3_4_mac_impl_clr = macs_3_4_mac_io_clr;
  assign macs_3_4_mac_impl_en = macs_3_4_mac_io_en;
  assign _zz_64_ = (io_flowA_valid && (counters_ai_value == (3'b011)));
  assign _zz_65_ = (io_flowB_valid && (counters_bj_value == (3'b100)));
  always @ (*) begin
    macs_3_4_mac_io_a = macs_3_4_fifoA_io_pop_data;
    if(last)begin
      macs_3_4_mac_io_a = (_zz_20_ ? macs_3_4_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_3_4_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_3_4_mac_io_b = macs_3_4_fifoB_io_pop_data;
    if(last)begin
      macs_3_4_mac_io_b = (_zz_20_ ? macs_3_4_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_3_4_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_3_4_mac_io_en = ((! macs_3_4_fifoA_io_empty) && (! macs_3_4_fifoB_io_empty));
    if(last)begin
      macs_3_4_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_3_4_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_3_4_mac_io_clr = 1'b0;
    if(last)begin
      macs_3_4_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_3_4_mac_io_clr = 1'b1;
    end
  end

  assign _zz_20_ = (! macs_3_4_fifoA_io_empty);
  assign io_results_3_4 = macs_3_4_mac_io_res;
  always @ (*) begin
    if(macs_4_0_mac_impl_sr_regNextWhen)begin
      macs_4_0_mac_impl_or = 32'h0;
    end else begin
      macs_4_0_mac_impl_or = macs_4_0_mac_impl_adder;
    end
  end

  assign macs_4_0_mac_impl_c = macs_4_0_mac_impl_adder;
  assign macs_4_0_mac_impl_a = macs_4_0_mac_io_a;
  assign macs_4_0_mac_impl_b = macs_4_0_mac_io_b;
  assign macs_4_0_mac_io_res = macs_4_0_mac_impl_c;
  assign macs_4_0_mac_impl_clr = macs_4_0_mac_io_clr;
  assign macs_4_0_mac_impl_en = macs_4_0_mac_io_en;
  assign _zz_66_ = (io_flowA_valid && (counters_ai_value == (3'b100)));
  assign _zz_67_ = (io_flowB_valid && (counters_bj_value == (3'b000)));
  always @ (*) begin
    macs_4_0_mac_io_a = macs_4_0_fifoA_io_pop_data;
    if(last)begin
      macs_4_0_mac_io_a = (_zz_21_ ? macs_4_0_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_4_0_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_4_0_mac_io_b = macs_4_0_fifoB_io_pop_data;
    if(last)begin
      macs_4_0_mac_io_b = (_zz_21_ ? macs_4_0_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_4_0_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_4_0_mac_io_en = ((! macs_4_0_fifoA_io_empty) && (! macs_4_0_fifoB_io_empty));
    if(last)begin
      macs_4_0_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_4_0_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_4_0_mac_io_clr = 1'b0;
    if(last)begin
      macs_4_0_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_4_0_mac_io_clr = 1'b1;
    end
  end

  assign _zz_21_ = (! macs_4_0_fifoA_io_empty);
  assign io_results_4_0 = macs_4_0_mac_io_res;
  always @ (*) begin
    if(macs_4_1_mac_impl_sr_regNextWhen)begin
      macs_4_1_mac_impl_or = 32'h0;
    end else begin
      macs_4_1_mac_impl_or = macs_4_1_mac_impl_adder;
    end
  end

  assign macs_4_1_mac_impl_c = macs_4_1_mac_impl_adder;
  assign macs_4_1_mac_impl_a = macs_4_1_mac_io_a;
  assign macs_4_1_mac_impl_b = macs_4_1_mac_io_b;
  assign macs_4_1_mac_io_res = macs_4_1_mac_impl_c;
  assign macs_4_1_mac_impl_clr = macs_4_1_mac_io_clr;
  assign macs_4_1_mac_impl_en = macs_4_1_mac_io_en;
  assign _zz_68_ = (io_flowA_valid && (counters_ai_value == (3'b100)));
  assign _zz_69_ = (io_flowB_valid && (counters_bj_value == (3'b001)));
  always @ (*) begin
    macs_4_1_mac_io_a = macs_4_1_fifoA_io_pop_data;
    if(last)begin
      macs_4_1_mac_io_a = (_zz_22_ ? macs_4_1_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_4_1_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_4_1_mac_io_b = macs_4_1_fifoB_io_pop_data;
    if(last)begin
      macs_4_1_mac_io_b = (_zz_22_ ? macs_4_1_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_4_1_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_4_1_mac_io_en = ((! macs_4_1_fifoA_io_empty) && (! macs_4_1_fifoB_io_empty));
    if(last)begin
      macs_4_1_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_4_1_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_4_1_mac_io_clr = 1'b0;
    if(last)begin
      macs_4_1_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_4_1_mac_io_clr = 1'b1;
    end
  end

  assign _zz_22_ = (! macs_4_1_fifoA_io_empty);
  assign io_results_4_1 = macs_4_1_mac_io_res;
  always @ (*) begin
    if(macs_4_2_mac_impl_sr_regNextWhen)begin
      macs_4_2_mac_impl_or = 32'h0;
    end else begin
      macs_4_2_mac_impl_or = macs_4_2_mac_impl_adder;
    end
  end

  assign macs_4_2_mac_impl_c = macs_4_2_mac_impl_adder;
  assign macs_4_2_mac_impl_a = macs_4_2_mac_io_a;
  assign macs_4_2_mac_impl_b = macs_4_2_mac_io_b;
  assign macs_4_2_mac_io_res = macs_4_2_mac_impl_c;
  assign macs_4_2_mac_impl_clr = macs_4_2_mac_io_clr;
  assign macs_4_2_mac_impl_en = macs_4_2_mac_io_en;
  assign _zz_70_ = (io_flowA_valid && (counters_ai_value == (3'b100)));
  assign _zz_71_ = (io_flowB_valid && (counters_bj_value == (3'b010)));
  always @ (*) begin
    macs_4_2_mac_io_a = macs_4_2_fifoA_io_pop_data;
    if(last)begin
      macs_4_2_mac_io_a = (_zz_23_ ? macs_4_2_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_4_2_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_4_2_mac_io_b = macs_4_2_fifoB_io_pop_data;
    if(last)begin
      macs_4_2_mac_io_b = (_zz_23_ ? macs_4_2_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_4_2_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_4_2_mac_io_en = ((! macs_4_2_fifoA_io_empty) && (! macs_4_2_fifoB_io_empty));
    if(last)begin
      macs_4_2_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_4_2_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_4_2_mac_io_clr = 1'b0;
    if(last)begin
      macs_4_2_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_4_2_mac_io_clr = 1'b1;
    end
  end

  assign _zz_23_ = (! macs_4_2_fifoA_io_empty);
  assign io_results_4_2 = macs_4_2_mac_io_res;
  always @ (*) begin
    if(macs_4_3_mac_impl_sr_regNextWhen)begin
      macs_4_3_mac_impl_or = 32'h0;
    end else begin
      macs_4_3_mac_impl_or = macs_4_3_mac_impl_adder;
    end
  end

  assign macs_4_3_mac_impl_c = macs_4_3_mac_impl_adder;
  assign macs_4_3_mac_impl_a = macs_4_3_mac_io_a;
  assign macs_4_3_mac_impl_b = macs_4_3_mac_io_b;
  assign macs_4_3_mac_io_res = macs_4_3_mac_impl_c;
  assign macs_4_3_mac_impl_clr = macs_4_3_mac_io_clr;
  assign macs_4_3_mac_impl_en = macs_4_3_mac_io_en;
  assign _zz_72_ = (io_flowA_valid && (counters_ai_value == (3'b100)));
  assign _zz_73_ = (io_flowB_valid && (counters_bj_value == (3'b011)));
  always @ (*) begin
    macs_4_3_mac_io_a = macs_4_3_fifoA_io_pop_data;
    if(last)begin
      macs_4_3_mac_io_a = (_zz_24_ ? macs_4_3_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_4_3_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_4_3_mac_io_b = macs_4_3_fifoB_io_pop_data;
    if(last)begin
      macs_4_3_mac_io_b = (_zz_24_ ? macs_4_3_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_4_3_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_4_3_mac_io_en = ((! macs_4_3_fifoA_io_empty) && (! macs_4_3_fifoB_io_empty));
    if(last)begin
      macs_4_3_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_4_3_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_4_3_mac_io_clr = 1'b0;
    if(last)begin
      macs_4_3_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_4_3_mac_io_clr = 1'b1;
    end
  end

  assign _zz_24_ = (! macs_4_3_fifoA_io_empty);
  assign io_results_4_3 = macs_4_3_mac_io_res;
  always @ (*) begin
    if(macs_4_4_mac_impl_sr_regNextWhen)begin
      macs_4_4_mac_impl_or = 32'h0;
    end else begin
      macs_4_4_mac_impl_or = macs_4_4_mac_impl_adder;
    end
  end

  assign macs_4_4_mac_impl_c = macs_4_4_mac_impl_adder;
  assign macs_4_4_mac_impl_a = macs_4_4_mac_io_a;
  assign macs_4_4_mac_impl_b = macs_4_4_mac_io_b;
  assign macs_4_4_mac_io_res = macs_4_4_mac_impl_c;
  assign macs_4_4_mac_impl_clr = macs_4_4_mac_io_clr;
  assign macs_4_4_mac_impl_en = macs_4_4_mac_io_en;
  assign _zz_74_ = (io_flowA_valid && (counters_ai_value == (3'b100)));
  assign _zz_75_ = (io_flowB_valid && (counters_bj_value == (3'b100)));
  always @ (*) begin
    macs_4_4_mac_io_a = macs_4_4_fifoA_io_pop_data;
    if(last)begin
      macs_4_4_mac_io_a = (_zz_25_ ? macs_4_4_fifoA_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_4_4_mac_io_a = 16'h0;
    end
  end

  always @ (*) begin
    macs_4_4_mac_io_b = macs_4_4_fifoB_io_pop_data;
    if(last)begin
      macs_4_4_mac_io_b = (_zz_25_ ? macs_4_4_fifoB_io_pop_data : 16'h0);
    end
    if(io_clear)begin
      macs_4_4_mac_io_b = 16'h0;
    end
  end

  always @ (*) begin
    macs_4_4_mac_io_en = ((! macs_4_4_fifoA_io_empty) && (! macs_4_4_fifoB_io_empty));
    if(last)begin
      macs_4_4_mac_io_en = 1'b1;
    end
    if(io_clear)begin
      macs_4_4_mac_io_en = 1'b1;
    end
  end

  always @ (*) begin
    macs_4_4_mac_io_clr = 1'b0;
    if(last)begin
      macs_4_4_mac_io_clr = 1'b0;
    end
    if(io_clear)begin
      macs_4_4_mac_io_clr = 1'b1;
    end
  end

  assign _zz_25_ = (! macs_4_4_fifoA_io_empty);
  assign io_results_4_4 = macs_4_4_mac_io_res;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      counters_ai_value <= (3'b000);
      counters_aj_value <= (3'b000);
      counters_bi_value <= (3'b000);
      counters_bj_value <= (3'b000);
      counters_lastA <= 1'b0;
      counters_lastB <= 1'b0;
      macs_0_0_mac_impl_ar <= 16'h0;
      macs_0_0_mac_impl_br <= 16'h0;
      macs_0_0_mac_impl_mr <= 32'h0;
      macs_0_0_mac_impl_adder <= 32'h0;
      macs_0_1_mac_impl_ar <= 16'h0;
      macs_0_1_mac_impl_br <= 16'h0;
      macs_0_1_mac_impl_mr <= 32'h0;
      macs_0_1_mac_impl_adder <= 32'h0;
      macs_0_2_mac_impl_ar <= 16'h0;
      macs_0_2_mac_impl_br <= 16'h0;
      macs_0_2_mac_impl_mr <= 32'h0;
      macs_0_2_mac_impl_adder <= 32'h0;
      macs_0_3_mac_impl_ar <= 16'h0;
      macs_0_3_mac_impl_br <= 16'h0;
      macs_0_3_mac_impl_mr <= 32'h0;
      macs_0_3_mac_impl_adder <= 32'h0;
      macs_0_4_mac_impl_ar <= 16'h0;
      macs_0_4_mac_impl_br <= 16'h0;
      macs_0_4_mac_impl_mr <= 32'h0;
      macs_0_4_mac_impl_adder <= 32'h0;
      macs_1_0_mac_impl_ar <= 16'h0;
      macs_1_0_mac_impl_br <= 16'h0;
      macs_1_0_mac_impl_mr <= 32'h0;
      macs_1_0_mac_impl_adder <= 32'h0;
      macs_1_1_mac_impl_ar <= 16'h0;
      macs_1_1_mac_impl_br <= 16'h0;
      macs_1_1_mac_impl_mr <= 32'h0;
      macs_1_1_mac_impl_adder <= 32'h0;
      macs_1_2_mac_impl_ar <= 16'h0;
      macs_1_2_mac_impl_br <= 16'h0;
      macs_1_2_mac_impl_mr <= 32'h0;
      macs_1_2_mac_impl_adder <= 32'h0;
      macs_1_3_mac_impl_ar <= 16'h0;
      macs_1_3_mac_impl_br <= 16'h0;
      macs_1_3_mac_impl_mr <= 32'h0;
      macs_1_3_mac_impl_adder <= 32'h0;
      macs_1_4_mac_impl_ar <= 16'h0;
      macs_1_4_mac_impl_br <= 16'h0;
      macs_1_4_mac_impl_mr <= 32'h0;
      macs_1_4_mac_impl_adder <= 32'h0;
      macs_2_0_mac_impl_ar <= 16'h0;
      macs_2_0_mac_impl_br <= 16'h0;
      macs_2_0_mac_impl_mr <= 32'h0;
      macs_2_0_mac_impl_adder <= 32'h0;
      macs_2_1_mac_impl_ar <= 16'h0;
      macs_2_1_mac_impl_br <= 16'h0;
      macs_2_1_mac_impl_mr <= 32'h0;
      macs_2_1_mac_impl_adder <= 32'h0;
      macs_2_2_mac_impl_ar <= 16'h0;
      macs_2_2_mac_impl_br <= 16'h0;
      macs_2_2_mac_impl_mr <= 32'h0;
      macs_2_2_mac_impl_adder <= 32'h0;
      macs_2_3_mac_impl_ar <= 16'h0;
      macs_2_3_mac_impl_br <= 16'h0;
      macs_2_3_mac_impl_mr <= 32'h0;
      macs_2_3_mac_impl_adder <= 32'h0;
      macs_2_4_mac_impl_ar <= 16'h0;
      macs_2_4_mac_impl_br <= 16'h0;
      macs_2_4_mac_impl_mr <= 32'h0;
      macs_2_4_mac_impl_adder <= 32'h0;
      macs_3_0_mac_impl_ar <= 16'h0;
      macs_3_0_mac_impl_br <= 16'h0;
      macs_3_0_mac_impl_mr <= 32'h0;
      macs_3_0_mac_impl_adder <= 32'h0;
      macs_3_1_mac_impl_ar <= 16'h0;
      macs_3_1_mac_impl_br <= 16'h0;
      macs_3_1_mac_impl_mr <= 32'h0;
      macs_3_1_mac_impl_adder <= 32'h0;
      macs_3_2_mac_impl_ar <= 16'h0;
      macs_3_2_mac_impl_br <= 16'h0;
      macs_3_2_mac_impl_mr <= 32'h0;
      macs_3_2_mac_impl_adder <= 32'h0;
      macs_3_3_mac_impl_ar <= 16'h0;
      macs_3_3_mac_impl_br <= 16'h0;
      macs_3_3_mac_impl_mr <= 32'h0;
      macs_3_3_mac_impl_adder <= 32'h0;
      macs_3_4_mac_impl_ar <= 16'h0;
      macs_3_4_mac_impl_br <= 16'h0;
      macs_3_4_mac_impl_mr <= 32'h0;
      macs_3_4_mac_impl_adder <= 32'h0;
      macs_4_0_mac_impl_ar <= 16'h0;
      macs_4_0_mac_impl_br <= 16'h0;
      macs_4_0_mac_impl_mr <= 32'h0;
      macs_4_0_mac_impl_adder <= 32'h0;
      macs_4_1_mac_impl_ar <= 16'h0;
      macs_4_1_mac_impl_br <= 16'h0;
      macs_4_1_mac_impl_mr <= 32'h0;
      macs_4_1_mac_impl_adder <= 32'h0;
      macs_4_2_mac_impl_ar <= 16'h0;
      macs_4_2_mac_impl_br <= 16'h0;
      macs_4_2_mac_impl_mr <= 32'h0;
      macs_4_2_mac_impl_adder <= 32'h0;
      macs_4_3_mac_impl_ar <= 16'h0;
      macs_4_3_mac_impl_br <= 16'h0;
      macs_4_3_mac_impl_mr <= 32'h0;
      macs_4_3_mac_impl_adder <= 32'h0;
      macs_4_4_mac_impl_ar <= 16'h0;
      macs_4_4_mac_impl_br <= 16'h0;
      macs_4_4_mac_impl_mr <= 32'h0;
      macs_4_4_mac_impl_adder <= 32'h0;
    end else begin
      counters_ai_value <= counters_ai_valueNext;
      counters_aj_value <= counters_aj_valueNext;
      counters_bi_value <= counters_bi_valueNext;
      counters_bj_value <= counters_bj_valueNext;
      if((counters_ai_willOverflow && io_flowA_valid))begin
        counters_lastA <= 1'b1;
      end
      if(io_clear)begin
        counters_lastA <= 1'b0;
      end
      if((counters_bi_willOverflow && io_flowB_valid))begin
        counters_lastB <= 1'b1;
      end
      if(io_clear)begin
        counters_lastB <= 1'b0;
      end
      if(macs_0_0_mac_impl_en)begin
        macs_0_0_mac_impl_ar <= macs_0_0_mac_impl_a;
      end
      if(macs_0_0_mac_impl_en)begin
        macs_0_0_mac_impl_br <= macs_0_0_mac_impl_b;
      end
      if(macs_0_0_mac_impl_en)begin
        macs_0_0_mac_impl_mr <= _zz_84_;
      end
      if(macs_0_0_mac_impl_en)begin
        macs_0_0_mac_impl_adder <= (macs_0_0_mac_impl_or + macs_0_0_mac_impl_mr);
      end
      if(macs_0_1_mac_impl_en)begin
        macs_0_1_mac_impl_ar <= macs_0_1_mac_impl_a;
      end
      if(macs_0_1_mac_impl_en)begin
        macs_0_1_mac_impl_br <= macs_0_1_mac_impl_b;
      end
      if(macs_0_1_mac_impl_en)begin
        macs_0_1_mac_impl_mr <= _zz_85_;
      end
      if(macs_0_1_mac_impl_en)begin
        macs_0_1_mac_impl_adder <= (macs_0_1_mac_impl_or + macs_0_1_mac_impl_mr);
      end
      if(macs_0_2_mac_impl_en)begin
        macs_0_2_mac_impl_ar <= macs_0_2_mac_impl_a;
      end
      if(macs_0_2_mac_impl_en)begin
        macs_0_2_mac_impl_br <= macs_0_2_mac_impl_b;
      end
      if(macs_0_2_mac_impl_en)begin
        macs_0_2_mac_impl_mr <= _zz_86_;
      end
      if(macs_0_2_mac_impl_en)begin
        macs_0_2_mac_impl_adder <= (macs_0_2_mac_impl_or + macs_0_2_mac_impl_mr);
      end
      if(macs_0_3_mac_impl_en)begin
        macs_0_3_mac_impl_ar <= macs_0_3_mac_impl_a;
      end
      if(macs_0_3_mac_impl_en)begin
        macs_0_3_mac_impl_br <= macs_0_3_mac_impl_b;
      end
      if(macs_0_3_mac_impl_en)begin
        macs_0_3_mac_impl_mr <= _zz_87_;
      end
      if(macs_0_3_mac_impl_en)begin
        macs_0_3_mac_impl_adder <= (macs_0_3_mac_impl_or + macs_0_3_mac_impl_mr);
      end
      if(macs_0_4_mac_impl_en)begin
        macs_0_4_mac_impl_ar <= macs_0_4_mac_impl_a;
      end
      if(macs_0_4_mac_impl_en)begin
        macs_0_4_mac_impl_br <= macs_0_4_mac_impl_b;
      end
      if(macs_0_4_mac_impl_en)begin
        macs_0_4_mac_impl_mr <= _zz_88_;
      end
      if(macs_0_4_mac_impl_en)begin
        macs_0_4_mac_impl_adder <= (macs_0_4_mac_impl_or + macs_0_4_mac_impl_mr);
      end
      if(macs_1_0_mac_impl_en)begin
        macs_1_0_mac_impl_ar <= macs_1_0_mac_impl_a;
      end
      if(macs_1_0_mac_impl_en)begin
        macs_1_0_mac_impl_br <= macs_1_0_mac_impl_b;
      end
      if(macs_1_0_mac_impl_en)begin
        macs_1_0_mac_impl_mr <= _zz_89_;
      end
      if(macs_1_0_mac_impl_en)begin
        macs_1_0_mac_impl_adder <= (macs_1_0_mac_impl_or + macs_1_0_mac_impl_mr);
      end
      if(macs_1_1_mac_impl_en)begin
        macs_1_1_mac_impl_ar <= macs_1_1_mac_impl_a;
      end
      if(macs_1_1_mac_impl_en)begin
        macs_1_1_mac_impl_br <= macs_1_1_mac_impl_b;
      end
      if(macs_1_1_mac_impl_en)begin
        macs_1_1_mac_impl_mr <= _zz_90_;
      end
      if(macs_1_1_mac_impl_en)begin
        macs_1_1_mac_impl_adder <= (macs_1_1_mac_impl_or + macs_1_1_mac_impl_mr);
      end
      if(macs_1_2_mac_impl_en)begin
        macs_1_2_mac_impl_ar <= macs_1_2_mac_impl_a;
      end
      if(macs_1_2_mac_impl_en)begin
        macs_1_2_mac_impl_br <= macs_1_2_mac_impl_b;
      end
      if(macs_1_2_mac_impl_en)begin
        macs_1_2_mac_impl_mr <= _zz_91_;
      end
      if(macs_1_2_mac_impl_en)begin
        macs_1_2_mac_impl_adder <= (macs_1_2_mac_impl_or + macs_1_2_mac_impl_mr);
      end
      if(macs_1_3_mac_impl_en)begin
        macs_1_3_mac_impl_ar <= macs_1_3_mac_impl_a;
      end
      if(macs_1_3_mac_impl_en)begin
        macs_1_3_mac_impl_br <= macs_1_3_mac_impl_b;
      end
      if(macs_1_3_mac_impl_en)begin
        macs_1_3_mac_impl_mr <= _zz_92_;
      end
      if(macs_1_3_mac_impl_en)begin
        macs_1_3_mac_impl_adder <= (macs_1_3_mac_impl_or + macs_1_3_mac_impl_mr);
      end
      if(macs_1_4_mac_impl_en)begin
        macs_1_4_mac_impl_ar <= macs_1_4_mac_impl_a;
      end
      if(macs_1_4_mac_impl_en)begin
        macs_1_4_mac_impl_br <= macs_1_4_mac_impl_b;
      end
      if(macs_1_4_mac_impl_en)begin
        macs_1_4_mac_impl_mr <= _zz_93_;
      end
      if(macs_1_4_mac_impl_en)begin
        macs_1_4_mac_impl_adder <= (macs_1_4_mac_impl_or + macs_1_4_mac_impl_mr);
      end
      if(macs_2_0_mac_impl_en)begin
        macs_2_0_mac_impl_ar <= macs_2_0_mac_impl_a;
      end
      if(macs_2_0_mac_impl_en)begin
        macs_2_0_mac_impl_br <= macs_2_0_mac_impl_b;
      end
      if(macs_2_0_mac_impl_en)begin
        macs_2_0_mac_impl_mr <= _zz_94_;
      end
      if(macs_2_0_mac_impl_en)begin
        macs_2_0_mac_impl_adder <= (macs_2_0_mac_impl_or + macs_2_0_mac_impl_mr);
      end
      if(macs_2_1_mac_impl_en)begin
        macs_2_1_mac_impl_ar <= macs_2_1_mac_impl_a;
      end
      if(macs_2_1_mac_impl_en)begin
        macs_2_1_mac_impl_br <= macs_2_1_mac_impl_b;
      end
      if(macs_2_1_mac_impl_en)begin
        macs_2_1_mac_impl_mr <= _zz_95_;
      end
      if(macs_2_1_mac_impl_en)begin
        macs_2_1_mac_impl_adder <= (macs_2_1_mac_impl_or + macs_2_1_mac_impl_mr);
      end
      if(macs_2_2_mac_impl_en)begin
        macs_2_2_mac_impl_ar <= macs_2_2_mac_impl_a;
      end
      if(macs_2_2_mac_impl_en)begin
        macs_2_2_mac_impl_br <= macs_2_2_mac_impl_b;
      end
      if(macs_2_2_mac_impl_en)begin
        macs_2_2_mac_impl_mr <= _zz_96_;
      end
      if(macs_2_2_mac_impl_en)begin
        macs_2_2_mac_impl_adder <= (macs_2_2_mac_impl_or + macs_2_2_mac_impl_mr);
      end
      if(macs_2_3_mac_impl_en)begin
        macs_2_3_mac_impl_ar <= macs_2_3_mac_impl_a;
      end
      if(macs_2_3_mac_impl_en)begin
        macs_2_3_mac_impl_br <= macs_2_3_mac_impl_b;
      end
      if(macs_2_3_mac_impl_en)begin
        macs_2_3_mac_impl_mr <= _zz_97_;
      end
      if(macs_2_3_mac_impl_en)begin
        macs_2_3_mac_impl_adder <= (macs_2_3_mac_impl_or + macs_2_3_mac_impl_mr);
      end
      if(macs_2_4_mac_impl_en)begin
        macs_2_4_mac_impl_ar <= macs_2_4_mac_impl_a;
      end
      if(macs_2_4_mac_impl_en)begin
        macs_2_4_mac_impl_br <= macs_2_4_mac_impl_b;
      end
      if(macs_2_4_mac_impl_en)begin
        macs_2_4_mac_impl_mr <= _zz_98_;
      end
      if(macs_2_4_mac_impl_en)begin
        macs_2_4_mac_impl_adder <= (macs_2_4_mac_impl_or + macs_2_4_mac_impl_mr);
      end
      if(macs_3_0_mac_impl_en)begin
        macs_3_0_mac_impl_ar <= macs_3_0_mac_impl_a;
      end
      if(macs_3_0_mac_impl_en)begin
        macs_3_0_mac_impl_br <= macs_3_0_mac_impl_b;
      end
      if(macs_3_0_mac_impl_en)begin
        macs_3_0_mac_impl_mr <= _zz_99_;
      end
      if(macs_3_0_mac_impl_en)begin
        macs_3_0_mac_impl_adder <= (macs_3_0_mac_impl_or + macs_3_0_mac_impl_mr);
      end
      if(macs_3_1_mac_impl_en)begin
        macs_3_1_mac_impl_ar <= macs_3_1_mac_impl_a;
      end
      if(macs_3_1_mac_impl_en)begin
        macs_3_1_mac_impl_br <= macs_3_1_mac_impl_b;
      end
      if(macs_3_1_mac_impl_en)begin
        macs_3_1_mac_impl_mr <= _zz_100_;
      end
      if(macs_3_1_mac_impl_en)begin
        macs_3_1_mac_impl_adder <= (macs_3_1_mac_impl_or + macs_3_1_mac_impl_mr);
      end
      if(macs_3_2_mac_impl_en)begin
        macs_3_2_mac_impl_ar <= macs_3_2_mac_impl_a;
      end
      if(macs_3_2_mac_impl_en)begin
        macs_3_2_mac_impl_br <= macs_3_2_mac_impl_b;
      end
      if(macs_3_2_mac_impl_en)begin
        macs_3_2_mac_impl_mr <= _zz_101_;
      end
      if(macs_3_2_mac_impl_en)begin
        macs_3_2_mac_impl_adder <= (macs_3_2_mac_impl_or + macs_3_2_mac_impl_mr);
      end
      if(macs_3_3_mac_impl_en)begin
        macs_3_3_mac_impl_ar <= macs_3_3_mac_impl_a;
      end
      if(macs_3_3_mac_impl_en)begin
        macs_3_3_mac_impl_br <= macs_3_3_mac_impl_b;
      end
      if(macs_3_3_mac_impl_en)begin
        macs_3_3_mac_impl_mr <= _zz_102_;
      end
      if(macs_3_3_mac_impl_en)begin
        macs_3_3_mac_impl_adder <= (macs_3_3_mac_impl_or + macs_3_3_mac_impl_mr);
      end
      if(macs_3_4_mac_impl_en)begin
        macs_3_4_mac_impl_ar <= macs_3_4_mac_impl_a;
      end
      if(macs_3_4_mac_impl_en)begin
        macs_3_4_mac_impl_br <= macs_3_4_mac_impl_b;
      end
      if(macs_3_4_mac_impl_en)begin
        macs_3_4_mac_impl_mr <= _zz_103_;
      end
      if(macs_3_4_mac_impl_en)begin
        macs_3_4_mac_impl_adder <= (macs_3_4_mac_impl_or + macs_3_4_mac_impl_mr);
      end
      if(macs_4_0_mac_impl_en)begin
        macs_4_0_mac_impl_ar <= macs_4_0_mac_impl_a;
      end
      if(macs_4_0_mac_impl_en)begin
        macs_4_0_mac_impl_br <= macs_4_0_mac_impl_b;
      end
      if(macs_4_0_mac_impl_en)begin
        macs_4_0_mac_impl_mr <= _zz_104_;
      end
      if(macs_4_0_mac_impl_en)begin
        macs_4_0_mac_impl_adder <= (macs_4_0_mac_impl_or + macs_4_0_mac_impl_mr);
      end
      if(macs_4_1_mac_impl_en)begin
        macs_4_1_mac_impl_ar <= macs_4_1_mac_impl_a;
      end
      if(macs_4_1_mac_impl_en)begin
        macs_4_1_mac_impl_br <= macs_4_1_mac_impl_b;
      end
      if(macs_4_1_mac_impl_en)begin
        macs_4_1_mac_impl_mr <= _zz_105_;
      end
      if(macs_4_1_mac_impl_en)begin
        macs_4_1_mac_impl_adder <= (macs_4_1_mac_impl_or + macs_4_1_mac_impl_mr);
      end
      if(macs_4_2_mac_impl_en)begin
        macs_4_2_mac_impl_ar <= macs_4_2_mac_impl_a;
      end
      if(macs_4_2_mac_impl_en)begin
        macs_4_2_mac_impl_br <= macs_4_2_mac_impl_b;
      end
      if(macs_4_2_mac_impl_en)begin
        macs_4_2_mac_impl_mr <= _zz_106_;
      end
      if(macs_4_2_mac_impl_en)begin
        macs_4_2_mac_impl_adder <= (macs_4_2_mac_impl_or + macs_4_2_mac_impl_mr);
      end
      if(macs_4_3_mac_impl_en)begin
        macs_4_3_mac_impl_ar <= macs_4_3_mac_impl_a;
      end
      if(macs_4_3_mac_impl_en)begin
        macs_4_3_mac_impl_br <= macs_4_3_mac_impl_b;
      end
      if(macs_4_3_mac_impl_en)begin
        macs_4_3_mac_impl_mr <= _zz_107_;
      end
      if(macs_4_3_mac_impl_en)begin
        macs_4_3_mac_impl_adder <= (macs_4_3_mac_impl_or + macs_4_3_mac_impl_mr);
      end
      if(macs_4_4_mac_impl_en)begin
        macs_4_4_mac_impl_ar <= macs_4_4_mac_impl_a;
      end
      if(macs_4_4_mac_impl_en)begin
        macs_4_4_mac_impl_br <= macs_4_4_mac_impl_b;
      end
      if(macs_4_4_mac_impl_en)begin
        macs_4_4_mac_impl_mr <= _zz_108_;
      end
      if(macs_4_4_mac_impl_en)begin
        macs_4_4_mac_impl_adder <= (macs_4_4_mac_impl_or + macs_4_4_mac_impl_mr);
      end
    end
  end

  always @ (posedge clk) begin
    last_regNext <= last;
    edge_1__delay_1 <= edge_1_;
    edge_1__delay_2 <= edge_1__delay_1;
    edge_1__delay_3 <= edge_1__delay_2;
    if(macs_0_0_mac_impl_en)begin
      macs_0_0_mac_impl_sr <= macs_0_0_mac_impl_clr;
    end
    if(macs_0_0_mac_impl_en)begin
      macs_0_0_mac_impl_sr_regNextWhen <= macs_0_0_mac_impl_sr;
    end
    if(macs_0_1_mac_impl_en)begin
      macs_0_1_mac_impl_sr <= macs_0_1_mac_impl_clr;
    end
    if(macs_0_1_mac_impl_en)begin
      macs_0_1_mac_impl_sr_regNextWhen <= macs_0_1_mac_impl_sr;
    end
    if(macs_0_2_mac_impl_en)begin
      macs_0_2_mac_impl_sr <= macs_0_2_mac_impl_clr;
    end
    if(macs_0_2_mac_impl_en)begin
      macs_0_2_mac_impl_sr_regNextWhen <= macs_0_2_mac_impl_sr;
    end
    if(macs_0_3_mac_impl_en)begin
      macs_0_3_mac_impl_sr <= macs_0_3_mac_impl_clr;
    end
    if(macs_0_3_mac_impl_en)begin
      macs_0_3_mac_impl_sr_regNextWhen <= macs_0_3_mac_impl_sr;
    end
    if(macs_0_4_mac_impl_en)begin
      macs_0_4_mac_impl_sr <= macs_0_4_mac_impl_clr;
    end
    if(macs_0_4_mac_impl_en)begin
      macs_0_4_mac_impl_sr_regNextWhen <= macs_0_4_mac_impl_sr;
    end
    if(macs_1_0_mac_impl_en)begin
      macs_1_0_mac_impl_sr <= macs_1_0_mac_impl_clr;
    end
    if(macs_1_0_mac_impl_en)begin
      macs_1_0_mac_impl_sr_regNextWhen <= macs_1_0_mac_impl_sr;
    end
    if(macs_1_1_mac_impl_en)begin
      macs_1_1_mac_impl_sr <= macs_1_1_mac_impl_clr;
    end
    if(macs_1_1_mac_impl_en)begin
      macs_1_1_mac_impl_sr_regNextWhen <= macs_1_1_mac_impl_sr;
    end
    if(macs_1_2_mac_impl_en)begin
      macs_1_2_mac_impl_sr <= macs_1_2_mac_impl_clr;
    end
    if(macs_1_2_mac_impl_en)begin
      macs_1_2_mac_impl_sr_regNextWhen <= macs_1_2_mac_impl_sr;
    end
    if(macs_1_3_mac_impl_en)begin
      macs_1_3_mac_impl_sr <= macs_1_3_mac_impl_clr;
    end
    if(macs_1_3_mac_impl_en)begin
      macs_1_3_mac_impl_sr_regNextWhen <= macs_1_3_mac_impl_sr;
    end
    if(macs_1_4_mac_impl_en)begin
      macs_1_4_mac_impl_sr <= macs_1_4_mac_impl_clr;
    end
    if(macs_1_4_mac_impl_en)begin
      macs_1_4_mac_impl_sr_regNextWhen <= macs_1_4_mac_impl_sr;
    end
    if(macs_2_0_mac_impl_en)begin
      macs_2_0_mac_impl_sr <= macs_2_0_mac_impl_clr;
    end
    if(macs_2_0_mac_impl_en)begin
      macs_2_0_mac_impl_sr_regNextWhen <= macs_2_0_mac_impl_sr;
    end
    if(macs_2_1_mac_impl_en)begin
      macs_2_1_mac_impl_sr <= macs_2_1_mac_impl_clr;
    end
    if(macs_2_1_mac_impl_en)begin
      macs_2_1_mac_impl_sr_regNextWhen <= macs_2_1_mac_impl_sr;
    end
    if(macs_2_2_mac_impl_en)begin
      macs_2_2_mac_impl_sr <= macs_2_2_mac_impl_clr;
    end
    if(macs_2_2_mac_impl_en)begin
      macs_2_2_mac_impl_sr_regNextWhen <= macs_2_2_mac_impl_sr;
    end
    if(macs_2_3_mac_impl_en)begin
      macs_2_3_mac_impl_sr <= macs_2_3_mac_impl_clr;
    end
    if(macs_2_3_mac_impl_en)begin
      macs_2_3_mac_impl_sr_regNextWhen <= macs_2_3_mac_impl_sr;
    end
    if(macs_2_4_mac_impl_en)begin
      macs_2_4_mac_impl_sr <= macs_2_4_mac_impl_clr;
    end
    if(macs_2_4_mac_impl_en)begin
      macs_2_4_mac_impl_sr_regNextWhen <= macs_2_4_mac_impl_sr;
    end
    if(macs_3_0_mac_impl_en)begin
      macs_3_0_mac_impl_sr <= macs_3_0_mac_impl_clr;
    end
    if(macs_3_0_mac_impl_en)begin
      macs_3_0_mac_impl_sr_regNextWhen <= macs_3_0_mac_impl_sr;
    end
    if(macs_3_1_mac_impl_en)begin
      macs_3_1_mac_impl_sr <= macs_3_1_mac_impl_clr;
    end
    if(macs_3_1_mac_impl_en)begin
      macs_3_1_mac_impl_sr_regNextWhen <= macs_3_1_mac_impl_sr;
    end
    if(macs_3_2_mac_impl_en)begin
      macs_3_2_mac_impl_sr <= macs_3_2_mac_impl_clr;
    end
    if(macs_3_2_mac_impl_en)begin
      macs_3_2_mac_impl_sr_regNextWhen <= macs_3_2_mac_impl_sr;
    end
    if(macs_3_3_mac_impl_en)begin
      macs_3_3_mac_impl_sr <= macs_3_3_mac_impl_clr;
    end
    if(macs_3_3_mac_impl_en)begin
      macs_3_3_mac_impl_sr_regNextWhen <= macs_3_3_mac_impl_sr;
    end
    if(macs_3_4_mac_impl_en)begin
      macs_3_4_mac_impl_sr <= macs_3_4_mac_impl_clr;
    end
    if(macs_3_4_mac_impl_en)begin
      macs_3_4_mac_impl_sr_regNextWhen <= macs_3_4_mac_impl_sr;
    end
    if(macs_4_0_mac_impl_en)begin
      macs_4_0_mac_impl_sr <= macs_4_0_mac_impl_clr;
    end
    if(macs_4_0_mac_impl_en)begin
      macs_4_0_mac_impl_sr_regNextWhen <= macs_4_0_mac_impl_sr;
    end
    if(macs_4_1_mac_impl_en)begin
      macs_4_1_mac_impl_sr <= macs_4_1_mac_impl_clr;
    end
    if(macs_4_1_mac_impl_en)begin
      macs_4_1_mac_impl_sr_regNextWhen <= macs_4_1_mac_impl_sr;
    end
    if(macs_4_2_mac_impl_en)begin
      macs_4_2_mac_impl_sr <= macs_4_2_mac_impl_clr;
    end
    if(macs_4_2_mac_impl_en)begin
      macs_4_2_mac_impl_sr_regNextWhen <= macs_4_2_mac_impl_sr;
    end
    if(macs_4_3_mac_impl_en)begin
      macs_4_3_mac_impl_sr <= macs_4_3_mac_impl_clr;
    end
    if(macs_4_3_mac_impl_en)begin
      macs_4_3_mac_impl_sr_regNextWhen <= macs_4_3_mac_impl_sr;
    end
    if(macs_4_4_mac_impl_en)begin
      macs_4_4_mac_impl_sr <= macs_4_4_mac_impl_clr;
    end
    if(macs_4_4_mac_impl_en)begin
      macs_4_4_mac_impl_sr_regNextWhen <= macs_4_4_mac_impl_sr;
    end
  end


endmodule

module PeStream (
  input               streamA_valid,
  output              streamA_ready,
  input      [15:0]   streamA_payload,
  input               streamB_valid,
  output              streamB_ready,
  input      [15:0]   streamB_payload,
  output              streamR_valid,
  input               streamR_ready,
  output     [31:0]   streamR_payload,
  input               clk,
  input               reset 
);
  reg                 _zz_2_;
  reg                 _zz_3_;
  reg        [31:0]   _zz_4_;
  wire       [31:0]   pe_1__io_results_0_0;
  wire       [31:0]   pe_1__io_results_0_1;
  wire       [31:0]   pe_1__io_results_0_2;
  wire       [31:0]   pe_1__io_results_0_3;
  wire       [31:0]   pe_1__io_results_0_4;
  wire       [31:0]   pe_1__io_results_1_0;
  wire       [31:0]   pe_1__io_results_1_1;
  wire       [31:0]   pe_1__io_results_1_2;
  wire       [31:0]   pe_1__io_results_1_3;
  wire       [31:0]   pe_1__io_results_1_4;
  wire       [31:0]   pe_1__io_results_2_0;
  wire       [31:0]   pe_1__io_results_2_1;
  wire       [31:0]   pe_1__io_results_2_2;
  wire       [31:0]   pe_1__io_results_2_3;
  wire       [31:0]   pe_1__io_results_2_4;
  wire       [31:0]   pe_1__io_results_3_0;
  wire       [31:0]   pe_1__io_results_3_1;
  wire       [31:0]   pe_1__io_results_3_2;
  wire       [31:0]   pe_1__io_results_3_3;
  wire       [31:0]   pe_1__io_results_3_4;
  wire       [31:0]   pe_1__io_results_4_0;
  wire       [31:0]   pe_1__io_results_4_1;
  wire       [31:0]   pe_1__io_results_4_2;
  wire       [31:0]   pe_1__io_results_4_3;
  wire       [31:0]   pe_1__io_results_4_4;
  wire                pe_1__io_done;
  wire                pe_1__io_last;
  wire                _zz_5_;
  wire       [0:0]    _zz_6_;
  wire       [4:0]    _zz_7_;
  reg        [15:0]   payloadA;
  reg        [15:0]   payloadB;
  wire                outBlocked;
  wire                done;
  reg        [31:0]   resultStream_results_0;
  reg        [31:0]   resultStream_results_1;
  reg        [31:0]   resultStream_results_2;
  reg        [31:0]   resultStream_results_3;
  reg        [31:0]   resultStream_results_4;
  reg        [31:0]   resultStream_results_5;
  reg        [31:0]   resultStream_results_6;
  reg        [31:0]   resultStream_results_7;
  reg        [31:0]   resultStream_results_8;
  reg        [31:0]   resultStream_results_9;
  reg        [31:0]   resultStream_results_10;
  reg        [31:0]   resultStream_results_11;
  reg        [31:0]   resultStream_results_12;
  reg        [31:0]   resultStream_results_13;
  reg        [31:0]   resultStream_results_14;
  reg        [31:0]   resultStream_results_15;
  reg        [31:0]   resultStream_results_16;
  reg        [31:0]   resultStream_results_17;
  reg        [31:0]   resultStream_results_18;
  reg        [31:0]   resultStream_results_19;
  reg        [31:0]   resultStream_results_20;
  reg        [31:0]   resultStream_results_21;
  reg        [31:0]   resultStream_results_22;
  reg        [31:0]   resultStream_results_23;
  reg        [31:0]   resultStream_results_24;
  reg                 resultStream_counter_willIncrement;
  reg                 resultStream_counter_willClear;
  reg        [4:0]    resultStream_counter_valueNext;
  reg        [4:0]    resultStream_counter_value;
  wire                resultStream_counter_willOverflowIfInc;
  wire                resultStream_counter_willOverflow;
  reg                 resultStream_valid;
  wire       [31:0]   _zz_1_;
  reg        [31:0]   resultStream_payload;
  reg        [31:0]   resultStream_payload_regNext;
  reg                 resultStream_valid_regNext;

  assign _zz_5_ = (pe_1__io_last || outBlocked);
  assign _zz_6_ = resultStream_counter_willIncrement;
  assign _zz_7_ = {4'd0, _zz_6_};
  Pe pe_1_ ( 
    .io_flowA_valid      (_zz_2_                      ), //i
    .io_flowA_payload    (payloadA[15:0]              ), //i
    .io_flowB_valid      (_zz_3_                      ), //i
    .io_flowB_payload    (payloadB[15:0]              ), //i
    .io_results_0_0      (pe_1__io_results_0_0[31:0]  ), //o
    .io_results_0_1      (pe_1__io_results_0_1[31:0]  ), //o
    .io_results_0_2      (pe_1__io_results_0_2[31:0]  ), //o
    .io_results_0_3      (pe_1__io_results_0_3[31:0]  ), //o
    .io_results_0_4      (pe_1__io_results_0_4[31:0]  ), //o
    .io_results_1_0      (pe_1__io_results_1_0[31:0]  ), //o
    .io_results_1_1      (pe_1__io_results_1_1[31:0]  ), //o
    .io_results_1_2      (pe_1__io_results_1_2[31:0]  ), //o
    .io_results_1_3      (pe_1__io_results_1_3[31:0]  ), //o
    .io_results_1_4      (pe_1__io_results_1_4[31:0]  ), //o
    .io_results_2_0      (pe_1__io_results_2_0[31:0]  ), //o
    .io_results_2_1      (pe_1__io_results_2_1[31:0]  ), //o
    .io_results_2_2      (pe_1__io_results_2_2[31:0]  ), //o
    .io_results_2_3      (pe_1__io_results_2_3[31:0]  ), //o
    .io_results_2_4      (pe_1__io_results_2_4[31:0]  ), //o
    .io_results_3_0      (pe_1__io_results_3_0[31:0]  ), //o
    .io_results_3_1      (pe_1__io_results_3_1[31:0]  ), //o
    .io_results_3_2      (pe_1__io_results_3_2[31:0]  ), //o
    .io_results_3_3      (pe_1__io_results_3_3[31:0]  ), //o
    .io_results_3_4      (pe_1__io_results_3_4[31:0]  ), //o
    .io_results_4_0      (pe_1__io_results_4_0[31:0]  ), //o
    .io_results_4_1      (pe_1__io_results_4_1[31:0]  ), //o
    .io_results_4_2      (pe_1__io_results_4_2[31:0]  ), //o
    .io_results_4_3      (pe_1__io_results_4_3[31:0]  ), //o
    .io_results_4_4      (pe_1__io_results_4_4[31:0]  ), //o
    .io_clear            (done                        ), //i
    .io_done             (pe_1__io_done               ), //o
    .io_last             (pe_1__io_last               ), //o
    .clk                 (clk                         ), //i
    .reset               (reset                       )  //i
  );
  always @(*) begin
    case(resultStream_counter_value)
      5'b00000 : begin
        _zz_4_ = resultStream_results_0;
      end
      5'b00001 : begin
        _zz_4_ = resultStream_results_1;
      end
      5'b00010 : begin
        _zz_4_ = resultStream_results_2;
      end
      5'b00011 : begin
        _zz_4_ = resultStream_results_3;
      end
      5'b00100 : begin
        _zz_4_ = resultStream_results_4;
      end
      5'b00101 : begin
        _zz_4_ = resultStream_results_5;
      end
      5'b00110 : begin
        _zz_4_ = resultStream_results_6;
      end
      5'b00111 : begin
        _zz_4_ = resultStream_results_7;
      end
      5'b01000 : begin
        _zz_4_ = resultStream_results_8;
      end
      5'b01001 : begin
        _zz_4_ = resultStream_results_9;
      end
      5'b01010 : begin
        _zz_4_ = resultStream_results_10;
      end
      5'b01011 : begin
        _zz_4_ = resultStream_results_11;
      end
      5'b01100 : begin
        _zz_4_ = resultStream_results_12;
      end
      5'b01101 : begin
        _zz_4_ = resultStream_results_13;
      end
      5'b01110 : begin
        _zz_4_ = resultStream_results_14;
      end
      5'b01111 : begin
        _zz_4_ = resultStream_results_15;
      end
      5'b10000 : begin
        _zz_4_ = resultStream_results_16;
      end
      5'b10001 : begin
        _zz_4_ = resultStream_results_17;
      end
      5'b10010 : begin
        _zz_4_ = resultStream_results_18;
      end
      5'b10011 : begin
        _zz_4_ = resultStream_results_19;
      end
      5'b10100 : begin
        _zz_4_ = resultStream_results_20;
      end
      5'b10101 : begin
        _zz_4_ = resultStream_results_21;
      end
      5'b10110 : begin
        _zz_4_ = resultStream_results_22;
      end
      5'b10111 : begin
        _zz_4_ = resultStream_results_23;
      end
      default : begin
        _zz_4_ = resultStream_results_24;
      end
    endcase
  end

  always @ (*) begin
    payloadA[15 : 8] = streamA_payload[7 : 0];
    payloadA[7 : 0] = streamA_payload[15 : 8];
  end

  always @ (*) begin
    payloadB[15 : 8] = streamB_payload[7 : 0];
    payloadB[7 : 0] = streamB_payload[15 : 8];
  end

  always @ (*) begin
    _zz_2_ = streamA_valid;
    if(_zz_5_)begin
      _zz_2_ = 1'b0;
    end
  end

  always @ (*) begin
    _zz_3_ = streamB_valid;
    if(_zz_5_)begin
      _zz_3_ = 1'b0;
    end
  end

  assign outBlocked = ((! streamR_ready) && streamR_valid);
  assign streamA_ready = ((! pe_1__io_last) && (! outBlocked));
  assign streamB_ready = ((! pe_1__io_last) && (! outBlocked));
  assign done = (pe_1__io_done && pe_1__io_last);
  always @ (*) begin
    resultStream_counter_willIncrement = 1'b0;
    if((streamR_ready && resultStream_valid))begin
      resultStream_counter_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    resultStream_counter_willClear = 1'b0;
    if(done)begin
      resultStream_counter_willClear = 1'b1;
    end
  end

  assign resultStream_counter_willOverflowIfInc = (resultStream_counter_value == 5'h18);
  assign resultStream_counter_willOverflow = (resultStream_counter_willOverflowIfInc && resultStream_counter_willIncrement);
  always @ (*) begin
    if(resultStream_counter_willOverflow)begin
      resultStream_counter_valueNext = 5'h0;
    end else begin
      resultStream_counter_valueNext = (resultStream_counter_value + _zz_7_);
    end
    if(resultStream_counter_willClear)begin
      resultStream_counter_valueNext = 5'h0;
    end
  end

  assign _zz_1_ = _zz_4_;
  always @ (*) begin
    resultStream_payload[31 : 24] = _zz_1_[7 : 0];
    resultStream_payload[23 : 16] = _zz_1_[15 : 8];
    resultStream_payload[15 : 8] = _zz_1_[23 : 16];
    resultStream_payload[7 : 0] = _zz_1_[31 : 24];
  end

  assign streamR_payload = resultStream_payload_regNext;
  assign streamR_valid = resultStream_valid_regNext;
  always @ (posedge clk) begin
    if(done)begin
      resultStream_results_0 <= pe_1__io_results_0_0;
      resultStream_results_1 <= pe_1__io_results_0_1;
      resultStream_results_2 <= pe_1__io_results_0_2;
      resultStream_results_3 <= pe_1__io_results_0_3;
      resultStream_results_4 <= pe_1__io_results_0_4;
      resultStream_results_5 <= pe_1__io_results_1_0;
      resultStream_results_6 <= pe_1__io_results_1_1;
      resultStream_results_7 <= pe_1__io_results_1_2;
      resultStream_results_8 <= pe_1__io_results_1_3;
      resultStream_results_9 <= pe_1__io_results_1_4;
      resultStream_results_10 <= pe_1__io_results_2_0;
      resultStream_results_11 <= pe_1__io_results_2_1;
      resultStream_results_12 <= pe_1__io_results_2_2;
      resultStream_results_13 <= pe_1__io_results_2_3;
      resultStream_results_14 <= pe_1__io_results_2_4;
      resultStream_results_15 <= pe_1__io_results_3_0;
      resultStream_results_16 <= pe_1__io_results_3_1;
      resultStream_results_17 <= pe_1__io_results_3_2;
      resultStream_results_18 <= pe_1__io_results_3_3;
      resultStream_results_19 <= pe_1__io_results_3_4;
      resultStream_results_20 <= pe_1__io_results_4_0;
      resultStream_results_21 <= pe_1__io_results_4_1;
      resultStream_results_22 <= pe_1__io_results_4_2;
      resultStream_results_23 <= pe_1__io_results_4_3;
      resultStream_results_24 <= pe_1__io_results_4_4;
    end
    resultStream_payload_regNext <= resultStream_payload;
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      resultStream_counter_value <= 5'h0;
      resultStream_valid <= 1'b0;
      resultStream_valid_regNext <= 1'b0;
    end else begin
      resultStream_counter_value <= resultStream_counter_valueNext;
      if(done)begin
        resultStream_valid <= 1'b1;
      end
      if(resultStream_counter_willOverflow)begin
        resultStream_valid <= 1'b0;
      end
      resultStream_valid_regNext <= resultStream_valid;
    end
  end


endmodule
