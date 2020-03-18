// Generator : SpinalHDL v1.3.8    git head : 57d97088b91271a094cebad32ed86479199955df
// Date      : 18/03/2020, 13:53:47
// Component : PeStream


module Fifo (
      input  [15:0] io_push_data,
      input   io_push_en,
      output [15:0] io_pop_data,
      input   io_pop_en,
      output reg  io_pop_valid,
      output  io_full,
      output  io_empty,
      input   clk,
      input   reset);
  wire [15:0] _zz_2_;
  wire  _zz_3_;
  wire  _zz_4_;
  wire [1:0] _zz_5_;
  wire [0:0] _zz_6_;
  wire [2:0] _zz_7_;
  wire [2:0] _zz_8_;
  wire [0:0] _zz_9_;
  wire [2:0] _zz_10_;
  wire [2:0] _zz_11_;
  wire [15:0] _zz_12_;
  reg  _zz_1_;
  reg [2:0] wPtr;
  reg [2:0] rPtr;
  reg [3:0] count;
  wire  countLogic_push;
  wire  countLogic_pop;
  reg [15:0] mem [0:4];
  assign _zz_3_ = (io_push_en && (! io_full));
  assign _zz_4_ = (io_pop_en && (! io_empty));
  assign _zz_5_ = {countLogic_push,countLogic_pop};
  assign _zz_6_ = (1'b0);
  assign _zz_7_ = {2'd0, _zz_6_};
  assign _zz_8_ = (wPtr + (3'b001));
  assign _zz_9_ = (1'b0);
  assign _zz_10_ = {2'd0, _zz_9_};
  assign _zz_11_ = (rPtr + (3'b001));
  assign _zz_12_ = io_push_data;
  always @ (posedge clk) begin
    if(_zz_1_) begin
      mem[wPtr] <= _zz_12_;
    end
  end

  assign _zz_2_ = mem[rPtr];
  always @ (*) begin
    _zz_1_ = 1'b0;
    if(_zz_3_)begin
      _zz_1_ = 1'b1;
    end
  end

  assign io_empty = (count == (4'b0000));
  assign io_full = (count == (4'b0101));
  assign io_pop_data = _zz_2_;
  always @ (*) begin
    if(_zz_4_)begin
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
      if(_zz_3_)begin
        wPtr <= ((wPtr == (3'b100)) ? _zz_7_ : _zz_8_);
      end
      if(_zz_4_)begin
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

endmodule


//Fifo_1_ remplaced by Fifo

module Mac (
      input  [15:0] io_a,
      input  [15:0] io_b,
      output [31:0] io_res,
      input   io_clr,
      input   io_en,
      input   clk,
      input   reset);
  wire [31:0] _zz_1_;
  reg [31:0] impl_or;
  wire [15:0] impl_a;
  wire [15:0] impl_b;
  wire [31:0] impl_c;
  wire  impl_clr;
  wire  impl_en;
  reg [15:0] impl_ar;
  reg [15:0] impl_br;
  reg  impl_sr;
  reg [31:0] impl_mr;
  reg [31:0] impl_adder;
  reg  impl_sr_regNextWhen;
  assign _zz_1_ = (impl_ar * impl_br);
  always @ (*) begin
    if(impl_sr_regNextWhen)begin
      impl_or = (32'b00000000000000000000000000000000);
    end else begin
      impl_or = impl_adder;
    end
  end

  assign impl_c = impl_adder;
  assign impl_a = io_a;
  assign impl_b = io_b;
  assign io_res = impl_c;
  assign impl_clr = io_clr;
  assign impl_en = io_en;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      impl_ar <= (16'b0000000000000000);
      impl_br <= (16'b0000000000000000);
      impl_mr <= (32'b00000000000000000000000000000000);
      impl_adder <= (32'b00000000000000000000000000000000);
    end else begin
      if(impl_en)begin
        impl_ar <= impl_a;
      end
      if(impl_en)begin
        impl_br <= impl_b;
      end
      if(impl_en)begin
        impl_mr <= _zz_1_;
      end
      if(impl_en)begin
        impl_adder <= (impl_or + impl_mr);
      end
    end
  end

  always @ (posedge clk) begin
    if(impl_en)begin
      impl_sr <= impl_clr;
    end
    if(impl_en)begin
      impl_sr_regNextWhen <= impl_sr;
    end
  end

endmodule


//Fifo_2_ remplaced by Fifo


//Fifo_3_ remplaced by Fifo


//Mac_1_ remplaced by Mac


//Fifo_4_ remplaced by Fifo


//Fifo_5_ remplaced by Fifo


//Mac_2_ remplaced by Mac


//Fifo_6_ remplaced by Fifo


//Fifo_7_ remplaced by Fifo


//Mac_3_ remplaced by Mac


//Fifo_8_ remplaced by Fifo


//Fifo_9_ remplaced by Fifo


//Mac_4_ remplaced by Mac


//Fifo_10_ remplaced by Fifo


//Fifo_11_ remplaced by Fifo


//Mac_5_ remplaced by Mac


//Fifo_12_ remplaced by Fifo


//Fifo_13_ remplaced by Fifo


//Mac_6_ remplaced by Mac


//Fifo_14_ remplaced by Fifo


//Fifo_15_ remplaced by Fifo


//Mac_7_ remplaced by Mac


//Fifo_16_ remplaced by Fifo


//Fifo_17_ remplaced by Fifo


//Mac_8_ remplaced by Mac


//Fifo_18_ remplaced by Fifo


//Fifo_19_ remplaced by Fifo


//Mac_9_ remplaced by Mac


//Fifo_20_ remplaced by Fifo


//Fifo_21_ remplaced by Fifo


//Mac_10_ remplaced by Mac


//Fifo_22_ remplaced by Fifo


//Fifo_23_ remplaced by Fifo


//Mac_11_ remplaced by Mac


//Fifo_24_ remplaced by Fifo


//Fifo_25_ remplaced by Fifo


//Mac_12_ remplaced by Mac


//Fifo_26_ remplaced by Fifo


//Fifo_27_ remplaced by Fifo


//Mac_13_ remplaced by Mac


//Fifo_28_ remplaced by Fifo


//Fifo_29_ remplaced by Fifo


//Mac_14_ remplaced by Mac


//Fifo_30_ remplaced by Fifo


//Fifo_31_ remplaced by Fifo


//Mac_15_ remplaced by Mac


//Fifo_32_ remplaced by Fifo


//Fifo_33_ remplaced by Fifo


//Mac_16_ remplaced by Mac


//Fifo_34_ remplaced by Fifo


//Fifo_35_ remplaced by Fifo


//Mac_17_ remplaced by Mac


//Fifo_36_ remplaced by Fifo


//Fifo_37_ remplaced by Fifo


//Mac_18_ remplaced by Mac


//Fifo_38_ remplaced by Fifo


//Fifo_39_ remplaced by Fifo


//Mac_19_ remplaced by Mac


//Fifo_40_ remplaced by Fifo


//Fifo_41_ remplaced by Fifo


//Mac_20_ remplaced by Mac


//Fifo_42_ remplaced by Fifo


//Fifo_43_ remplaced by Fifo


//Mac_21_ remplaced by Mac


//Fifo_44_ remplaced by Fifo


//Fifo_45_ remplaced by Fifo


//Mac_22_ remplaced by Mac


//Fifo_46_ remplaced by Fifo


//Fifo_47_ remplaced by Fifo


//Mac_23_ remplaced by Mac


//Fifo_48_ remplaced by Fifo


//Fifo_49_ remplaced by Fifo


//Mac_24_ remplaced by Mac

module Pe (
      input   io_flowA_valid,
      input  [15:0] io_flowA_payload,
      input   io_flowB_valid,
      input  [15:0] io_flowB_payload,
      output [31:0] io_results_0_0,
      output [31:0] io_results_0_1,
      output [31:0] io_results_0_2,
      output [31:0] io_results_0_3,
      output [31:0] io_results_0_4,
      output [31:0] io_results_1_0,
      output [31:0] io_results_1_1,
      output [31:0] io_results_1_2,
      output [31:0] io_results_1_3,
      output [31:0] io_results_1_4,
      output [31:0] io_results_2_0,
      output [31:0] io_results_2_1,
      output [31:0] io_results_2_2,
      output [31:0] io_results_2_3,
      output [31:0] io_results_2_4,
      output [31:0] io_results_3_0,
      output [31:0] io_results_3_1,
      output [31:0] io_results_3_2,
      output [31:0] io_results_3_3,
      output [31:0] io_results_3_4,
      output [31:0] io_results_4_0,
      output [31:0] io_results_4_1,
      output [31:0] io_results_4_2,
      output [31:0] io_results_4_3,
      output [31:0] io_results_4_4,
      input   io_clear,
      output  io_done,
      output  io_last,
      input   clk,
      input   reset);
  wire  _zz_26_;
  wire  _zz_27_;
  reg [15:0] _zz_28_;
  reg [15:0] _zz_29_;
  reg  _zz_30_;
  reg  _zz_31_;
  wire  _zz_32_;
  wire  _zz_33_;
  reg [15:0] _zz_34_;
  reg [15:0] _zz_35_;
  reg  _zz_36_;
  reg  _zz_37_;
  wire  _zz_38_;
  wire  _zz_39_;
  reg [15:0] _zz_40_;
  reg [15:0] _zz_41_;
  reg  _zz_42_;
  reg  _zz_43_;
  wire  _zz_44_;
  wire  _zz_45_;
  reg [15:0] _zz_46_;
  reg [15:0] _zz_47_;
  reg  _zz_48_;
  reg  _zz_49_;
  wire  _zz_50_;
  wire  _zz_51_;
  reg [15:0] _zz_52_;
  reg [15:0] _zz_53_;
  reg  _zz_54_;
  reg  _zz_55_;
  wire  _zz_56_;
  wire  _zz_57_;
  reg [15:0] _zz_58_;
  reg [15:0] _zz_59_;
  reg  _zz_60_;
  reg  _zz_61_;
  wire  _zz_62_;
  wire  _zz_63_;
  reg [15:0] _zz_64_;
  reg [15:0] _zz_65_;
  reg  _zz_66_;
  reg  _zz_67_;
  wire  _zz_68_;
  wire  _zz_69_;
  reg [15:0] _zz_70_;
  reg [15:0] _zz_71_;
  reg  _zz_72_;
  reg  _zz_73_;
  wire  _zz_74_;
  wire  _zz_75_;
  reg [15:0] _zz_76_;
  reg [15:0] _zz_77_;
  reg  _zz_78_;
  reg  _zz_79_;
  wire  _zz_80_;
  wire  _zz_81_;
  reg [15:0] _zz_82_;
  reg [15:0] _zz_83_;
  reg  _zz_84_;
  reg  _zz_85_;
  wire  _zz_86_;
  wire  _zz_87_;
  reg [15:0] _zz_88_;
  reg [15:0] _zz_89_;
  reg  _zz_90_;
  reg  _zz_91_;
  wire  _zz_92_;
  wire  _zz_93_;
  reg [15:0] _zz_94_;
  reg [15:0] _zz_95_;
  reg  _zz_96_;
  reg  _zz_97_;
  wire  _zz_98_;
  wire  _zz_99_;
  reg [15:0] _zz_100_;
  reg [15:0] _zz_101_;
  reg  _zz_102_;
  reg  _zz_103_;
  wire  _zz_104_;
  wire  _zz_105_;
  reg [15:0] _zz_106_;
  reg [15:0] _zz_107_;
  reg  _zz_108_;
  reg  _zz_109_;
  wire  _zz_110_;
  wire  _zz_111_;
  reg [15:0] _zz_112_;
  reg [15:0] _zz_113_;
  reg  _zz_114_;
  reg  _zz_115_;
  wire  _zz_116_;
  wire  _zz_117_;
  reg [15:0] _zz_118_;
  reg [15:0] _zz_119_;
  reg  _zz_120_;
  reg  _zz_121_;
  wire  _zz_122_;
  wire  _zz_123_;
  reg [15:0] _zz_124_;
  reg [15:0] _zz_125_;
  reg  _zz_126_;
  reg  _zz_127_;
  wire  _zz_128_;
  wire  _zz_129_;
  reg [15:0] _zz_130_;
  reg [15:0] _zz_131_;
  reg  _zz_132_;
  reg  _zz_133_;
  wire  _zz_134_;
  wire  _zz_135_;
  reg [15:0] _zz_136_;
  reg [15:0] _zz_137_;
  reg  _zz_138_;
  reg  _zz_139_;
  wire  _zz_140_;
  wire  _zz_141_;
  reg [15:0] _zz_142_;
  reg [15:0] _zz_143_;
  reg  _zz_144_;
  reg  _zz_145_;
  wire  _zz_146_;
  wire  _zz_147_;
  reg [15:0] _zz_148_;
  reg [15:0] _zz_149_;
  reg  _zz_150_;
  reg  _zz_151_;
  wire  _zz_152_;
  wire  _zz_153_;
  reg [15:0] _zz_154_;
  reg [15:0] _zz_155_;
  reg  _zz_156_;
  reg  _zz_157_;
  wire  _zz_158_;
  wire  _zz_159_;
  reg [15:0] _zz_160_;
  reg [15:0] _zz_161_;
  reg  _zz_162_;
  reg  _zz_163_;
  wire  _zz_164_;
  wire  _zz_165_;
  reg [15:0] _zz_166_;
  reg [15:0] _zz_167_;
  reg  _zz_168_;
  reg  _zz_169_;
  wire  _zz_170_;
  wire  _zz_171_;
  reg [15:0] _zz_172_;
  reg [15:0] _zz_173_;
  reg  _zz_174_;
  reg  _zz_175_;
  wire [15:0] macs_0_0_fifoA_io_pop_data;
  wire  macs_0_0_fifoA_io_pop_valid;
  wire  macs_0_0_fifoA_io_full;
  wire  macs_0_0_fifoA_io_empty;
  wire [15:0] macs_0_0_fifoB_io_pop_data;
  wire  macs_0_0_fifoB_io_pop_valid;
  wire  macs_0_0_fifoB_io_full;
  wire  macs_0_0_fifoB_io_empty;
  wire [31:0] macs_0_0_mac_io_res;
  wire [15:0] macs_0_1_fifoA_io_pop_data;
  wire  macs_0_1_fifoA_io_pop_valid;
  wire  macs_0_1_fifoA_io_full;
  wire  macs_0_1_fifoA_io_empty;
  wire [15:0] macs_0_1_fifoB_io_pop_data;
  wire  macs_0_1_fifoB_io_pop_valid;
  wire  macs_0_1_fifoB_io_full;
  wire  macs_0_1_fifoB_io_empty;
  wire [31:0] macs_0_1_mac_io_res;
  wire [15:0] macs_0_2_fifoA_io_pop_data;
  wire  macs_0_2_fifoA_io_pop_valid;
  wire  macs_0_2_fifoA_io_full;
  wire  macs_0_2_fifoA_io_empty;
  wire [15:0] macs_0_2_fifoB_io_pop_data;
  wire  macs_0_2_fifoB_io_pop_valid;
  wire  macs_0_2_fifoB_io_full;
  wire  macs_0_2_fifoB_io_empty;
  wire [31:0] macs_0_2_mac_io_res;
  wire [15:0] macs_0_3_fifoA_io_pop_data;
  wire  macs_0_3_fifoA_io_pop_valid;
  wire  macs_0_3_fifoA_io_full;
  wire  macs_0_3_fifoA_io_empty;
  wire [15:0] macs_0_3_fifoB_io_pop_data;
  wire  macs_0_3_fifoB_io_pop_valid;
  wire  macs_0_3_fifoB_io_full;
  wire  macs_0_3_fifoB_io_empty;
  wire [31:0] macs_0_3_mac_io_res;
  wire [15:0] macs_0_4_fifoA_io_pop_data;
  wire  macs_0_4_fifoA_io_pop_valid;
  wire  macs_0_4_fifoA_io_full;
  wire  macs_0_4_fifoA_io_empty;
  wire [15:0] macs_0_4_fifoB_io_pop_data;
  wire  macs_0_4_fifoB_io_pop_valid;
  wire  macs_0_4_fifoB_io_full;
  wire  macs_0_4_fifoB_io_empty;
  wire [31:0] macs_0_4_mac_io_res;
  wire [15:0] macs_1_0_fifoA_io_pop_data;
  wire  macs_1_0_fifoA_io_pop_valid;
  wire  macs_1_0_fifoA_io_full;
  wire  macs_1_0_fifoA_io_empty;
  wire [15:0] macs_1_0_fifoB_io_pop_data;
  wire  macs_1_0_fifoB_io_pop_valid;
  wire  macs_1_0_fifoB_io_full;
  wire  macs_1_0_fifoB_io_empty;
  wire [31:0] macs_1_0_mac_io_res;
  wire [15:0] macs_1_1_fifoA_io_pop_data;
  wire  macs_1_1_fifoA_io_pop_valid;
  wire  macs_1_1_fifoA_io_full;
  wire  macs_1_1_fifoA_io_empty;
  wire [15:0] macs_1_1_fifoB_io_pop_data;
  wire  macs_1_1_fifoB_io_pop_valid;
  wire  macs_1_1_fifoB_io_full;
  wire  macs_1_1_fifoB_io_empty;
  wire [31:0] macs_1_1_mac_io_res;
  wire [15:0] macs_1_2_fifoA_io_pop_data;
  wire  macs_1_2_fifoA_io_pop_valid;
  wire  macs_1_2_fifoA_io_full;
  wire  macs_1_2_fifoA_io_empty;
  wire [15:0] macs_1_2_fifoB_io_pop_data;
  wire  macs_1_2_fifoB_io_pop_valid;
  wire  macs_1_2_fifoB_io_full;
  wire  macs_1_2_fifoB_io_empty;
  wire [31:0] macs_1_2_mac_io_res;
  wire [15:0] macs_1_3_fifoA_io_pop_data;
  wire  macs_1_3_fifoA_io_pop_valid;
  wire  macs_1_3_fifoA_io_full;
  wire  macs_1_3_fifoA_io_empty;
  wire [15:0] macs_1_3_fifoB_io_pop_data;
  wire  macs_1_3_fifoB_io_pop_valid;
  wire  macs_1_3_fifoB_io_full;
  wire  macs_1_3_fifoB_io_empty;
  wire [31:0] macs_1_3_mac_io_res;
  wire [15:0] macs_1_4_fifoA_io_pop_data;
  wire  macs_1_4_fifoA_io_pop_valid;
  wire  macs_1_4_fifoA_io_full;
  wire  macs_1_4_fifoA_io_empty;
  wire [15:0] macs_1_4_fifoB_io_pop_data;
  wire  macs_1_4_fifoB_io_pop_valid;
  wire  macs_1_4_fifoB_io_full;
  wire  macs_1_4_fifoB_io_empty;
  wire [31:0] macs_1_4_mac_io_res;
  wire [15:0] macs_2_0_fifoA_io_pop_data;
  wire  macs_2_0_fifoA_io_pop_valid;
  wire  macs_2_0_fifoA_io_full;
  wire  macs_2_0_fifoA_io_empty;
  wire [15:0] macs_2_0_fifoB_io_pop_data;
  wire  macs_2_0_fifoB_io_pop_valid;
  wire  macs_2_0_fifoB_io_full;
  wire  macs_2_0_fifoB_io_empty;
  wire [31:0] macs_2_0_mac_io_res;
  wire [15:0] macs_2_1_fifoA_io_pop_data;
  wire  macs_2_1_fifoA_io_pop_valid;
  wire  macs_2_1_fifoA_io_full;
  wire  macs_2_1_fifoA_io_empty;
  wire [15:0] macs_2_1_fifoB_io_pop_data;
  wire  macs_2_1_fifoB_io_pop_valid;
  wire  macs_2_1_fifoB_io_full;
  wire  macs_2_1_fifoB_io_empty;
  wire [31:0] macs_2_1_mac_io_res;
  wire [15:0] macs_2_2_fifoA_io_pop_data;
  wire  macs_2_2_fifoA_io_pop_valid;
  wire  macs_2_2_fifoA_io_full;
  wire  macs_2_2_fifoA_io_empty;
  wire [15:0] macs_2_2_fifoB_io_pop_data;
  wire  macs_2_2_fifoB_io_pop_valid;
  wire  macs_2_2_fifoB_io_full;
  wire  macs_2_2_fifoB_io_empty;
  wire [31:0] macs_2_2_mac_io_res;
  wire [15:0] macs_2_3_fifoA_io_pop_data;
  wire  macs_2_3_fifoA_io_pop_valid;
  wire  macs_2_3_fifoA_io_full;
  wire  macs_2_3_fifoA_io_empty;
  wire [15:0] macs_2_3_fifoB_io_pop_data;
  wire  macs_2_3_fifoB_io_pop_valid;
  wire  macs_2_3_fifoB_io_full;
  wire  macs_2_3_fifoB_io_empty;
  wire [31:0] macs_2_3_mac_io_res;
  wire [15:0] macs_2_4_fifoA_io_pop_data;
  wire  macs_2_4_fifoA_io_pop_valid;
  wire  macs_2_4_fifoA_io_full;
  wire  macs_2_4_fifoA_io_empty;
  wire [15:0] macs_2_4_fifoB_io_pop_data;
  wire  macs_2_4_fifoB_io_pop_valid;
  wire  macs_2_4_fifoB_io_full;
  wire  macs_2_4_fifoB_io_empty;
  wire [31:0] macs_2_4_mac_io_res;
  wire [15:0] macs_3_0_fifoA_io_pop_data;
  wire  macs_3_0_fifoA_io_pop_valid;
  wire  macs_3_0_fifoA_io_full;
  wire  macs_3_0_fifoA_io_empty;
  wire [15:0] macs_3_0_fifoB_io_pop_data;
  wire  macs_3_0_fifoB_io_pop_valid;
  wire  macs_3_0_fifoB_io_full;
  wire  macs_3_0_fifoB_io_empty;
  wire [31:0] macs_3_0_mac_io_res;
  wire [15:0] macs_3_1_fifoA_io_pop_data;
  wire  macs_3_1_fifoA_io_pop_valid;
  wire  macs_3_1_fifoA_io_full;
  wire  macs_3_1_fifoA_io_empty;
  wire [15:0] macs_3_1_fifoB_io_pop_data;
  wire  macs_3_1_fifoB_io_pop_valid;
  wire  macs_3_1_fifoB_io_full;
  wire  macs_3_1_fifoB_io_empty;
  wire [31:0] macs_3_1_mac_io_res;
  wire [15:0] macs_3_2_fifoA_io_pop_data;
  wire  macs_3_2_fifoA_io_pop_valid;
  wire  macs_3_2_fifoA_io_full;
  wire  macs_3_2_fifoA_io_empty;
  wire [15:0] macs_3_2_fifoB_io_pop_data;
  wire  macs_3_2_fifoB_io_pop_valid;
  wire  macs_3_2_fifoB_io_full;
  wire  macs_3_2_fifoB_io_empty;
  wire [31:0] macs_3_2_mac_io_res;
  wire [15:0] macs_3_3_fifoA_io_pop_data;
  wire  macs_3_3_fifoA_io_pop_valid;
  wire  macs_3_3_fifoA_io_full;
  wire  macs_3_3_fifoA_io_empty;
  wire [15:0] macs_3_3_fifoB_io_pop_data;
  wire  macs_3_3_fifoB_io_pop_valid;
  wire  macs_3_3_fifoB_io_full;
  wire  macs_3_3_fifoB_io_empty;
  wire [31:0] macs_3_3_mac_io_res;
  wire [15:0] macs_3_4_fifoA_io_pop_data;
  wire  macs_3_4_fifoA_io_pop_valid;
  wire  macs_3_4_fifoA_io_full;
  wire  macs_3_4_fifoA_io_empty;
  wire [15:0] macs_3_4_fifoB_io_pop_data;
  wire  macs_3_4_fifoB_io_pop_valid;
  wire  macs_3_4_fifoB_io_full;
  wire  macs_3_4_fifoB_io_empty;
  wire [31:0] macs_3_4_mac_io_res;
  wire [15:0] macs_4_0_fifoA_io_pop_data;
  wire  macs_4_0_fifoA_io_pop_valid;
  wire  macs_4_0_fifoA_io_full;
  wire  macs_4_0_fifoA_io_empty;
  wire [15:0] macs_4_0_fifoB_io_pop_data;
  wire  macs_4_0_fifoB_io_pop_valid;
  wire  macs_4_0_fifoB_io_full;
  wire  macs_4_0_fifoB_io_empty;
  wire [31:0] macs_4_0_mac_io_res;
  wire [15:0] macs_4_1_fifoA_io_pop_data;
  wire  macs_4_1_fifoA_io_pop_valid;
  wire  macs_4_1_fifoA_io_full;
  wire  macs_4_1_fifoA_io_empty;
  wire [15:0] macs_4_1_fifoB_io_pop_data;
  wire  macs_4_1_fifoB_io_pop_valid;
  wire  macs_4_1_fifoB_io_full;
  wire  macs_4_1_fifoB_io_empty;
  wire [31:0] macs_4_1_mac_io_res;
  wire [15:0] macs_4_2_fifoA_io_pop_data;
  wire  macs_4_2_fifoA_io_pop_valid;
  wire  macs_4_2_fifoA_io_full;
  wire  macs_4_2_fifoA_io_empty;
  wire [15:0] macs_4_2_fifoB_io_pop_data;
  wire  macs_4_2_fifoB_io_pop_valid;
  wire  macs_4_2_fifoB_io_full;
  wire  macs_4_2_fifoB_io_empty;
  wire [31:0] macs_4_2_mac_io_res;
  wire [15:0] macs_4_3_fifoA_io_pop_data;
  wire  macs_4_3_fifoA_io_pop_valid;
  wire  macs_4_3_fifoA_io_full;
  wire  macs_4_3_fifoA_io_empty;
  wire [15:0] macs_4_3_fifoB_io_pop_data;
  wire  macs_4_3_fifoB_io_pop_valid;
  wire  macs_4_3_fifoB_io_full;
  wire  macs_4_3_fifoB_io_empty;
  wire [31:0] macs_4_3_mac_io_res;
  wire [15:0] macs_4_4_fifoA_io_pop_data;
  wire  macs_4_4_fifoA_io_pop_valid;
  wire  macs_4_4_fifoA_io_full;
  wire  macs_4_4_fifoA_io_empty;
  wire [15:0] macs_4_4_fifoB_io_pop_data;
  wire  macs_4_4_fifoB_io_pop_valid;
  wire  macs_4_4_fifoB_io_full;
  wire  macs_4_4_fifoB_io_empty;
  wire [31:0] macs_4_4_mac_io_res;
  wire [0:0] _zz_176_;
  wire [2:0] _zz_177_;
  wire [0:0] _zz_178_;
  wire [2:0] _zz_179_;
  wire [0:0] _zz_180_;
  wire [2:0] _zz_181_;
  wire [0:0] _zz_182_;
  wire [2:0] _zz_183_;
  reg  counters_ai_willIncrement;
  reg  counters_ai_willClear;
  reg [2:0] counters_ai_valueNext;
  reg [2:0] counters_ai_value;
  wire  counters_ai_willOverflowIfInc;
  wire  counters_ai_willOverflow;
  reg  counters_aj_willIncrement;
  reg  counters_aj_willClear;
  reg [2:0] counters_aj_valueNext;
  reg [2:0] counters_aj_value;
  wire  counters_aj_willOverflowIfInc;
  wire  counters_aj_willOverflow;
  reg  counters_bi_willIncrement;
  reg  counters_bi_willClear;
  reg [2:0] counters_bi_valueNext;
  reg [2:0] counters_bi_value;
  wire  counters_bi_willOverflowIfInc;
  wire  counters_bi_willOverflow;
  reg  counters_bj_willIncrement;
  reg  counters_bj_willClear;
  reg [2:0] counters_bj_valueNext;
  reg [2:0] counters_bj_value;
  wire  counters_bj_willOverflowIfInc;
  wire  counters_bj_willOverflow;
  reg  counters_lastA;
  reg  counters_lastB;
  wire  last;
  reg  last_regNext;
  wire  edge_1_;
  reg  edge_1__delay_1;
  reg  edge_1__delay_2;
  reg  edge_1__delay_3;
  wire  _zz_1_;
  wire  _zz_2_;
  wire  _zz_3_;
  wire  _zz_4_;
  wire  _zz_5_;
  wire  _zz_6_;
  wire  _zz_7_;
  wire  _zz_8_;
  wire  _zz_9_;
  wire  _zz_10_;
  wire  _zz_11_;
  wire  _zz_12_;
  wire  _zz_13_;
  wire  _zz_14_;
  wire  _zz_15_;
  wire  _zz_16_;
  wire  _zz_17_;
  wire  _zz_18_;
  wire  _zz_19_;
  wire  _zz_20_;
  wire  _zz_21_;
  wire  _zz_22_;
  wire  _zz_23_;
  wire  _zz_24_;
  wire  _zz_25_;
  assign _zz_176_ = counters_ai_willIncrement;
  assign _zz_177_ = {2'd0, _zz_176_};
  assign _zz_178_ = counters_aj_willIncrement;
  assign _zz_179_ = {2'd0, _zz_178_};
  assign _zz_180_ = counters_bi_willIncrement;
  assign _zz_181_ = {2'd0, _zz_180_};
  assign _zz_182_ = counters_bj_willIncrement;
  assign _zz_183_ = {2'd0, _zz_182_};
  Fifo macs_0_0_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_26_),
    .io_pop_data(macs_0_0_fifoA_io_pop_data),
    .io_pop_en(_zz_31_),
    .io_pop_valid(macs_0_0_fifoA_io_pop_valid),
    .io_full(macs_0_0_fifoA_io_full),
    .io_empty(macs_0_0_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_0_0_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_27_),
    .io_pop_data(macs_0_0_fifoB_io_pop_data),
    .io_pop_en(_zz_31_),
    .io_pop_valid(macs_0_0_fifoB_io_pop_valid),
    .io_full(macs_0_0_fifoB_io_full),
    .io_empty(macs_0_0_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_0_0_mac ( 
    .io_a(_zz_28_),
    .io_b(_zz_29_),
    .io_res(macs_0_0_mac_io_res),
    .io_clr(_zz_30_),
    .io_en(_zz_31_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_0_1_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_32_),
    .io_pop_data(macs_0_1_fifoA_io_pop_data),
    .io_pop_en(_zz_37_),
    .io_pop_valid(macs_0_1_fifoA_io_pop_valid),
    .io_full(macs_0_1_fifoA_io_full),
    .io_empty(macs_0_1_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_0_1_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_33_),
    .io_pop_data(macs_0_1_fifoB_io_pop_data),
    .io_pop_en(_zz_37_),
    .io_pop_valid(macs_0_1_fifoB_io_pop_valid),
    .io_full(macs_0_1_fifoB_io_full),
    .io_empty(macs_0_1_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_0_1_mac ( 
    .io_a(_zz_34_),
    .io_b(_zz_35_),
    .io_res(macs_0_1_mac_io_res),
    .io_clr(_zz_36_),
    .io_en(_zz_37_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_0_2_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_38_),
    .io_pop_data(macs_0_2_fifoA_io_pop_data),
    .io_pop_en(_zz_43_),
    .io_pop_valid(macs_0_2_fifoA_io_pop_valid),
    .io_full(macs_0_2_fifoA_io_full),
    .io_empty(macs_0_2_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_0_2_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_39_),
    .io_pop_data(macs_0_2_fifoB_io_pop_data),
    .io_pop_en(_zz_43_),
    .io_pop_valid(macs_0_2_fifoB_io_pop_valid),
    .io_full(macs_0_2_fifoB_io_full),
    .io_empty(macs_0_2_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_0_2_mac ( 
    .io_a(_zz_40_),
    .io_b(_zz_41_),
    .io_res(macs_0_2_mac_io_res),
    .io_clr(_zz_42_),
    .io_en(_zz_43_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_0_3_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_44_),
    .io_pop_data(macs_0_3_fifoA_io_pop_data),
    .io_pop_en(_zz_49_),
    .io_pop_valid(macs_0_3_fifoA_io_pop_valid),
    .io_full(macs_0_3_fifoA_io_full),
    .io_empty(macs_0_3_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_0_3_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_45_),
    .io_pop_data(macs_0_3_fifoB_io_pop_data),
    .io_pop_en(_zz_49_),
    .io_pop_valid(macs_0_3_fifoB_io_pop_valid),
    .io_full(macs_0_3_fifoB_io_full),
    .io_empty(macs_0_3_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_0_3_mac ( 
    .io_a(_zz_46_),
    .io_b(_zz_47_),
    .io_res(macs_0_3_mac_io_res),
    .io_clr(_zz_48_),
    .io_en(_zz_49_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_0_4_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_50_),
    .io_pop_data(macs_0_4_fifoA_io_pop_data),
    .io_pop_en(_zz_55_),
    .io_pop_valid(macs_0_4_fifoA_io_pop_valid),
    .io_full(macs_0_4_fifoA_io_full),
    .io_empty(macs_0_4_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_0_4_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_51_),
    .io_pop_data(macs_0_4_fifoB_io_pop_data),
    .io_pop_en(_zz_55_),
    .io_pop_valid(macs_0_4_fifoB_io_pop_valid),
    .io_full(macs_0_4_fifoB_io_full),
    .io_empty(macs_0_4_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_0_4_mac ( 
    .io_a(_zz_52_),
    .io_b(_zz_53_),
    .io_res(macs_0_4_mac_io_res),
    .io_clr(_zz_54_),
    .io_en(_zz_55_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_1_0_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_56_),
    .io_pop_data(macs_1_0_fifoA_io_pop_data),
    .io_pop_en(_zz_61_),
    .io_pop_valid(macs_1_0_fifoA_io_pop_valid),
    .io_full(macs_1_0_fifoA_io_full),
    .io_empty(macs_1_0_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_1_0_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_57_),
    .io_pop_data(macs_1_0_fifoB_io_pop_data),
    .io_pop_en(_zz_61_),
    .io_pop_valid(macs_1_0_fifoB_io_pop_valid),
    .io_full(macs_1_0_fifoB_io_full),
    .io_empty(macs_1_0_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_1_0_mac ( 
    .io_a(_zz_58_),
    .io_b(_zz_59_),
    .io_res(macs_1_0_mac_io_res),
    .io_clr(_zz_60_),
    .io_en(_zz_61_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_1_1_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_62_),
    .io_pop_data(macs_1_1_fifoA_io_pop_data),
    .io_pop_en(_zz_67_),
    .io_pop_valid(macs_1_1_fifoA_io_pop_valid),
    .io_full(macs_1_1_fifoA_io_full),
    .io_empty(macs_1_1_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_1_1_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_63_),
    .io_pop_data(macs_1_1_fifoB_io_pop_data),
    .io_pop_en(_zz_67_),
    .io_pop_valid(macs_1_1_fifoB_io_pop_valid),
    .io_full(macs_1_1_fifoB_io_full),
    .io_empty(macs_1_1_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_1_1_mac ( 
    .io_a(_zz_64_),
    .io_b(_zz_65_),
    .io_res(macs_1_1_mac_io_res),
    .io_clr(_zz_66_),
    .io_en(_zz_67_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_1_2_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_68_),
    .io_pop_data(macs_1_2_fifoA_io_pop_data),
    .io_pop_en(_zz_73_),
    .io_pop_valid(macs_1_2_fifoA_io_pop_valid),
    .io_full(macs_1_2_fifoA_io_full),
    .io_empty(macs_1_2_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_1_2_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_69_),
    .io_pop_data(macs_1_2_fifoB_io_pop_data),
    .io_pop_en(_zz_73_),
    .io_pop_valid(macs_1_2_fifoB_io_pop_valid),
    .io_full(macs_1_2_fifoB_io_full),
    .io_empty(macs_1_2_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_1_2_mac ( 
    .io_a(_zz_70_),
    .io_b(_zz_71_),
    .io_res(macs_1_2_mac_io_res),
    .io_clr(_zz_72_),
    .io_en(_zz_73_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_1_3_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_74_),
    .io_pop_data(macs_1_3_fifoA_io_pop_data),
    .io_pop_en(_zz_79_),
    .io_pop_valid(macs_1_3_fifoA_io_pop_valid),
    .io_full(macs_1_3_fifoA_io_full),
    .io_empty(macs_1_3_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_1_3_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_75_),
    .io_pop_data(macs_1_3_fifoB_io_pop_data),
    .io_pop_en(_zz_79_),
    .io_pop_valid(macs_1_3_fifoB_io_pop_valid),
    .io_full(macs_1_3_fifoB_io_full),
    .io_empty(macs_1_3_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_1_3_mac ( 
    .io_a(_zz_76_),
    .io_b(_zz_77_),
    .io_res(macs_1_3_mac_io_res),
    .io_clr(_zz_78_),
    .io_en(_zz_79_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_1_4_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_80_),
    .io_pop_data(macs_1_4_fifoA_io_pop_data),
    .io_pop_en(_zz_85_),
    .io_pop_valid(macs_1_4_fifoA_io_pop_valid),
    .io_full(macs_1_4_fifoA_io_full),
    .io_empty(macs_1_4_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_1_4_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_81_),
    .io_pop_data(macs_1_4_fifoB_io_pop_data),
    .io_pop_en(_zz_85_),
    .io_pop_valid(macs_1_4_fifoB_io_pop_valid),
    .io_full(macs_1_4_fifoB_io_full),
    .io_empty(macs_1_4_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_1_4_mac ( 
    .io_a(_zz_82_),
    .io_b(_zz_83_),
    .io_res(macs_1_4_mac_io_res),
    .io_clr(_zz_84_),
    .io_en(_zz_85_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_2_0_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_86_),
    .io_pop_data(macs_2_0_fifoA_io_pop_data),
    .io_pop_en(_zz_91_),
    .io_pop_valid(macs_2_0_fifoA_io_pop_valid),
    .io_full(macs_2_0_fifoA_io_full),
    .io_empty(macs_2_0_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_2_0_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_87_),
    .io_pop_data(macs_2_0_fifoB_io_pop_data),
    .io_pop_en(_zz_91_),
    .io_pop_valid(macs_2_0_fifoB_io_pop_valid),
    .io_full(macs_2_0_fifoB_io_full),
    .io_empty(macs_2_0_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_2_0_mac ( 
    .io_a(_zz_88_),
    .io_b(_zz_89_),
    .io_res(macs_2_0_mac_io_res),
    .io_clr(_zz_90_),
    .io_en(_zz_91_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_2_1_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_92_),
    .io_pop_data(macs_2_1_fifoA_io_pop_data),
    .io_pop_en(_zz_97_),
    .io_pop_valid(macs_2_1_fifoA_io_pop_valid),
    .io_full(macs_2_1_fifoA_io_full),
    .io_empty(macs_2_1_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_2_1_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_93_),
    .io_pop_data(macs_2_1_fifoB_io_pop_data),
    .io_pop_en(_zz_97_),
    .io_pop_valid(macs_2_1_fifoB_io_pop_valid),
    .io_full(macs_2_1_fifoB_io_full),
    .io_empty(macs_2_1_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_2_1_mac ( 
    .io_a(_zz_94_),
    .io_b(_zz_95_),
    .io_res(macs_2_1_mac_io_res),
    .io_clr(_zz_96_),
    .io_en(_zz_97_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_2_2_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_98_),
    .io_pop_data(macs_2_2_fifoA_io_pop_data),
    .io_pop_en(_zz_103_),
    .io_pop_valid(macs_2_2_fifoA_io_pop_valid),
    .io_full(macs_2_2_fifoA_io_full),
    .io_empty(macs_2_2_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_2_2_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_99_),
    .io_pop_data(macs_2_2_fifoB_io_pop_data),
    .io_pop_en(_zz_103_),
    .io_pop_valid(macs_2_2_fifoB_io_pop_valid),
    .io_full(macs_2_2_fifoB_io_full),
    .io_empty(macs_2_2_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_2_2_mac ( 
    .io_a(_zz_100_),
    .io_b(_zz_101_),
    .io_res(macs_2_2_mac_io_res),
    .io_clr(_zz_102_),
    .io_en(_zz_103_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_2_3_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_104_),
    .io_pop_data(macs_2_3_fifoA_io_pop_data),
    .io_pop_en(_zz_109_),
    .io_pop_valid(macs_2_3_fifoA_io_pop_valid),
    .io_full(macs_2_3_fifoA_io_full),
    .io_empty(macs_2_3_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_2_3_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_105_),
    .io_pop_data(macs_2_3_fifoB_io_pop_data),
    .io_pop_en(_zz_109_),
    .io_pop_valid(macs_2_3_fifoB_io_pop_valid),
    .io_full(macs_2_3_fifoB_io_full),
    .io_empty(macs_2_3_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_2_3_mac ( 
    .io_a(_zz_106_),
    .io_b(_zz_107_),
    .io_res(macs_2_3_mac_io_res),
    .io_clr(_zz_108_),
    .io_en(_zz_109_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_2_4_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_110_),
    .io_pop_data(macs_2_4_fifoA_io_pop_data),
    .io_pop_en(_zz_115_),
    .io_pop_valid(macs_2_4_fifoA_io_pop_valid),
    .io_full(macs_2_4_fifoA_io_full),
    .io_empty(macs_2_4_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_2_4_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_111_),
    .io_pop_data(macs_2_4_fifoB_io_pop_data),
    .io_pop_en(_zz_115_),
    .io_pop_valid(macs_2_4_fifoB_io_pop_valid),
    .io_full(macs_2_4_fifoB_io_full),
    .io_empty(macs_2_4_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_2_4_mac ( 
    .io_a(_zz_112_),
    .io_b(_zz_113_),
    .io_res(macs_2_4_mac_io_res),
    .io_clr(_zz_114_),
    .io_en(_zz_115_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_3_0_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_116_),
    .io_pop_data(macs_3_0_fifoA_io_pop_data),
    .io_pop_en(_zz_121_),
    .io_pop_valid(macs_3_0_fifoA_io_pop_valid),
    .io_full(macs_3_0_fifoA_io_full),
    .io_empty(macs_3_0_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_3_0_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_117_),
    .io_pop_data(macs_3_0_fifoB_io_pop_data),
    .io_pop_en(_zz_121_),
    .io_pop_valid(macs_3_0_fifoB_io_pop_valid),
    .io_full(macs_3_0_fifoB_io_full),
    .io_empty(macs_3_0_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_3_0_mac ( 
    .io_a(_zz_118_),
    .io_b(_zz_119_),
    .io_res(macs_3_0_mac_io_res),
    .io_clr(_zz_120_),
    .io_en(_zz_121_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_3_1_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_122_),
    .io_pop_data(macs_3_1_fifoA_io_pop_data),
    .io_pop_en(_zz_127_),
    .io_pop_valid(macs_3_1_fifoA_io_pop_valid),
    .io_full(macs_3_1_fifoA_io_full),
    .io_empty(macs_3_1_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_3_1_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_123_),
    .io_pop_data(macs_3_1_fifoB_io_pop_data),
    .io_pop_en(_zz_127_),
    .io_pop_valid(macs_3_1_fifoB_io_pop_valid),
    .io_full(macs_3_1_fifoB_io_full),
    .io_empty(macs_3_1_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_3_1_mac ( 
    .io_a(_zz_124_),
    .io_b(_zz_125_),
    .io_res(macs_3_1_mac_io_res),
    .io_clr(_zz_126_),
    .io_en(_zz_127_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_3_2_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_128_),
    .io_pop_data(macs_3_2_fifoA_io_pop_data),
    .io_pop_en(_zz_133_),
    .io_pop_valid(macs_3_2_fifoA_io_pop_valid),
    .io_full(macs_3_2_fifoA_io_full),
    .io_empty(macs_3_2_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_3_2_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_129_),
    .io_pop_data(macs_3_2_fifoB_io_pop_data),
    .io_pop_en(_zz_133_),
    .io_pop_valid(macs_3_2_fifoB_io_pop_valid),
    .io_full(macs_3_2_fifoB_io_full),
    .io_empty(macs_3_2_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_3_2_mac ( 
    .io_a(_zz_130_),
    .io_b(_zz_131_),
    .io_res(macs_3_2_mac_io_res),
    .io_clr(_zz_132_),
    .io_en(_zz_133_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_3_3_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_134_),
    .io_pop_data(macs_3_3_fifoA_io_pop_data),
    .io_pop_en(_zz_139_),
    .io_pop_valid(macs_3_3_fifoA_io_pop_valid),
    .io_full(macs_3_3_fifoA_io_full),
    .io_empty(macs_3_3_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_3_3_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_135_),
    .io_pop_data(macs_3_3_fifoB_io_pop_data),
    .io_pop_en(_zz_139_),
    .io_pop_valid(macs_3_3_fifoB_io_pop_valid),
    .io_full(macs_3_3_fifoB_io_full),
    .io_empty(macs_3_3_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_3_3_mac ( 
    .io_a(_zz_136_),
    .io_b(_zz_137_),
    .io_res(macs_3_3_mac_io_res),
    .io_clr(_zz_138_),
    .io_en(_zz_139_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_3_4_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_140_),
    .io_pop_data(macs_3_4_fifoA_io_pop_data),
    .io_pop_en(_zz_145_),
    .io_pop_valid(macs_3_4_fifoA_io_pop_valid),
    .io_full(macs_3_4_fifoA_io_full),
    .io_empty(macs_3_4_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_3_4_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_141_),
    .io_pop_data(macs_3_4_fifoB_io_pop_data),
    .io_pop_en(_zz_145_),
    .io_pop_valid(macs_3_4_fifoB_io_pop_valid),
    .io_full(macs_3_4_fifoB_io_full),
    .io_empty(macs_3_4_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_3_4_mac ( 
    .io_a(_zz_142_),
    .io_b(_zz_143_),
    .io_res(macs_3_4_mac_io_res),
    .io_clr(_zz_144_),
    .io_en(_zz_145_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_4_0_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_146_),
    .io_pop_data(macs_4_0_fifoA_io_pop_data),
    .io_pop_en(_zz_151_),
    .io_pop_valid(macs_4_0_fifoA_io_pop_valid),
    .io_full(macs_4_0_fifoA_io_full),
    .io_empty(macs_4_0_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_4_0_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_147_),
    .io_pop_data(macs_4_0_fifoB_io_pop_data),
    .io_pop_en(_zz_151_),
    .io_pop_valid(macs_4_0_fifoB_io_pop_valid),
    .io_full(macs_4_0_fifoB_io_full),
    .io_empty(macs_4_0_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_4_0_mac ( 
    .io_a(_zz_148_),
    .io_b(_zz_149_),
    .io_res(macs_4_0_mac_io_res),
    .io_clr(_zz_150_),
    .io_en(_zz_151_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_4_1_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_152_),
    .io_pop_data(macs_4_1_fifoA_io_pop_data),
    .io_pop_en(_zz_157_),
    .io_pop_valid(macs_4_1_fifoA_io_pop_valid),
    .io_full(macs_4_1_fifoA_io_full),
    .io_empty(macs_4_1_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_4_1_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_153_),
    .io_pop_data(macs_4_1_fifoB_io_pop_data),
    .io_pop_en(_zz_157_),
    .io_pop_valid(macs_4_1_fifoB_io_pop_valid),
    .io_full(macs_4_1_fifoB_io_full),
    .io_empty(macs_4_1_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_4_1_mac ( 
    .io_a(_zz_154_),
    .io_b(_zz_155_),
    .io_res(macs_4_1_mac_io_res),
    .io_clr(_zz_156_),
    .io_en(_zz_157_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_4_2_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_158_),
    .io_pop_data(macs_4_2_fifoA_io_pop_data),
    .io_pop_en(_zz_163_),
    .io_pop_valid(macs_4_2_fifoA_io_pop_valid),
    .io_full(macs_4_2_fifoA_io_full),
    .io_empty(macs_4_2_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_4_2_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_159_),
    .io_pop_data(macs_4_2_fifoB_io_pop_data),
    .io_pop_en(_zz_163_),
    .io_pop_valid(macs_4_2_fifoB_io_pop_valid),
    .io_full(macs_4_2_fifoB_io_full),
    .io_empty(macs_4_2_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_4_2_mac ( 
    .io_a(_zz_160_),
    .io_b(_zz_161_),
    .io_res(macs_4_2_mac_io_res),
    .io_clr(_zz_162_),
    .io_en(_zz_163_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_4_3_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_164_),
    .io_pop_data(macs_4_3_fifoA_io_pop_data),
    .io_pop_en(_zz_169_),
    .io_pop_valid(macs_4_3_fifoA_io_pop_valid),
    .io_full(macs_4_3_fifoA_io_full),
    .io_empty(macs_4_3_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_4_3_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_165_),
    .io_pop_data(macs_4_3_fifoB_io_pop_data),
    .io_pop_en(_zz_169_),
    .io_pop_valid(macs_4_3_fifoB_io_pop_valid),
    .io_full(macs_4_3_fifoB_io_full),
    .io_empty(macs_4_3_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_4_3_mac ( 
    .io_a(_zz_166_),
    .io_b(_zz_167_),
    .io_res(macs_4_3_mac_io_res),
    .io_clr(_zz_168_),
    .io_en(_zz_169_),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_4_4_fifoA ( 
    .io_push_data(io_flowA_payload),
    .io_push_en(_zz_170_),
    .io_pop_data(macs_4_4_fifoA_io_pop_data),
    .io_pop_en(_zz_175_),
    .io_pop_valid(macs_4_4_fifoA_io_pop_valid),
    .io_full(macs_4_4_fifoA_io_full),
    .io_empty(macs_4_4_fifoA_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Fifo macs_4_4_fifoB ( 
    .io_push_data(io_flowB_payload),
    .io_push_en(_zz_171_),
    .io_pop_data(macs_4_4_fifoB_io_pop_data),
    .io_pop_en(_zz_175_),
    .io_pop_valid(macs_4_4_fifoB_io_pop_valid),
    .io_full(macs_4_4_fifoB_io_full),
    .io_empty(macs_4_4_fifoB_io_empty),
    .clk(clk),
    .reset(reset) 
  );
  Mac macs_4_4_mac ( 
    .io_a(_zz_172_),
    .io_b(_zz_173_),
    .io_res(macs_4_4_mac_io_res),
    .io_clr(_zz_174_),
    .io_en(_zz_175_),
    .clk(clk),
    .reset(reset) 
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
      counters_ai_valueNext = (counters_ai_value + _zz_177_);
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
      counters_aj_valueNext = (counters_aj_value + _zz_179_);
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
      counters_bi_valueNext = (counters_bi_value + _zz_181_);
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
      counters_bj_valueNext = (counters_bj_value + _zz_183_);
    end
    if(counters_bj_willClear)begin
      counters_bj_valueNext = (3'b000);
    end
  end

  assign last = (counters_lastA && counters_lastB);
  assign edge_1_ = ((! last_regNext) && last);
  assign io_done = edge_1__delay_3;
  assign io_last = last;
  assign _zz_26_ = (io_flowA_valid && (counters_ai_value == (3'b000)));
  assign _zz_27_ = (io_flowB_valid && (counters_bj_value == (3'b000)));
  always @ (*) begin
    _zz_28_ = macs_0_0_fifoA_io_pop_data;
    if(last)begin
      _zz_28_ = (_zz_1_ ? macs_0_0_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_28_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_29_ = macs_0_0_fifoB_io_pop_data;
    if(last)begin
      _zz_29_ = (_zz_1_ ? macs_0_0_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_29_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_31_ = ((! macs_0_0_fifoA_io_empty) && (! macs_0_0_fifoB_io_empty));
    if(last)begin
      _zz_31_ = 1'b1;
    end
    if(io_clear)begin
      _zz_31_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_30_ = 1'b0;
    if(last)begin
      _zz_30_ = 1'b0;
    end
    if(io_clear)begin
      _zz_30_ = 1'b1;
    end
  end

  assign _zz_1_ = (! macs_0_0_fifoA_io_empty);
  assign io_results_0_0 = macs_0_0_mac_io_res;
  assign _zz_32_ = (io_flowA_valid && (counters_ai_value == (3'b000)));
  assign _zz_33_ = (io_flowB_valid && (counters_bj_value == (3'b001)));
  always @ (*) begin
    _zz_34_ = macs_0_1_fifoA_io_pop_data;
    if(last)begin
      _zz_34_ = (_zz_2_ ? macs_0_1_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_34_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_35_ = macs_0_1_fifoB_io_pop_data;
    if(last)begin
      _zz_35_ = (_zz_2_ ? macs_0_1_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_35_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_37_ = ((! macs_0_1_fifoA_io_empty) && (! macs_0_1_fifoB_io_empty));
    if(last)begin
      _zz_37_ = 1'b1;
    end
    if(io_clear)begin
      _zz_37_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_36_ = 1'b0;
    if(last)begin
      _zz_36_ = 1'b0;
    end
    if(io_clear)begin
      _zz_36_ = 1'b1;
    end
  end

  assign _zz_2_ = (! macs_0_1_fifoA_io_empty);
  assign io_results_0_1 = macs_0_1_mac_io_res;
  assign _zz_38_ = (io_flowA_valid && (counters_ai_value == (3'b000)));
  assign _zz_39_ = (io_flowB_valid && (counters_bj_value == (3'b010)));
  always @ (*) begin
    _zz_40_ = macs_0_2_fifoA_io_pop_data;
    if(last)begin
      _zz_40_ = (_zz_3_ ? macs_0_2_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_40_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_41_ = macs_0_2_fifoB_io_pop_data;
    if(last)begin
      _zz_41_ = (_zz_3_ ? macs_0_2_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_41_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_43_ = ((! macs_0_2_fifoA_io_empty) && (! macs_0_2_fifoB_io_empty));
    if(last)begin
      _zz_43_ = 1'b1;
    end
    if(io_clear)begin
      _zz_43_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_42_ = 1'b0;
    if(last)begin
      _zz_42_ = 1'b0;
    end
    if(io_clear)begin
      _zz_42_ = 1'b1;
    end
  end

  assign _zz_3_ = (! macs_0_2_fifoA_io_empty);
  assign io_results_0_2 = macs_0_2_mac_io_res;
  assign _zz_44_ = (io_flowA_valid && (counters_ai_value == (3'b000)));
  assign _zz_45_ = (io_flowB_valid && (counters_bj_value == (3'b011)));
  always @ (*) begin
    _zz_46_ = macs_0_3_fifoA_io_pop_data;
    if(last)begin
      _zz_46_ = (_zz_4_ ? macs_0_3_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_46_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_47_ = macs_0_3_fifoB_io_pop_data;
    if(last)begin
      _zz_47_ = (_zz_4_ ? macs_0_3_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_47_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_49_ = ((! macs_0_3_fifoA_io_empty) && (! macs_0_3_fifoB_io_empty));
    if(last)begin
      _zz_49_ = 1'b1;
    end
    if(io_clear)begin
      _zz_49_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_48_ = 1'b0;
    if(last)begin
      _zz_48_ = 1'b0;
    end
    if(io_clear)begin
      _zz_48_ = 1'b1;
    end
  end

  assign _zz_4_ = (! macs_0_3_fifoA_io_empty);
  assign io_results_0_3 = macs_0_3_mac_io_res;
  assign _zz_50_ = (io_flowA_valid && (counters_ai_value == (3'b000)));
  assign _zz_51_ = (io_flowB_valid && (counters_bj_value == (3'b100)));
  always @ (*) begin
    _zz_52_ = macs_0_4_fifoA_io_pop_data;
    if(last)begin
      _zz_52_ = (_zz_5_ ? macs_0_4_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_52_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_53_ = macs_0_4_fifoB_io_pop_data;
    if(last)begin
      _zz_53_ = (_zz_5_ ? macs_0_4_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_53_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_55_ = ((! macs_0_4_fifoA_io_empty) && (! macs_0_4_fifoB_io_empty));
    if(last)begin
      _zz_55_ = 1'b1;
    end
    if(io_clear)begin
      _zz_55_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_54_ = 1'b0;
    if(last)begin
      _zz_54_ = 1'b0;
    end
    if(io_clear)begin
      _zz_54_ = 1'b1;
    end
  end

  assign _zz_5_ = (! macs_0_4_fifoA_io_empty);
  assign io_results_0_4 = macs_0_4_mac_io_res;
  assign _zz_56_ = (io_flowA_valid && (counters_ai_value == (3'b001)));
  assign _zz_57_ = (io_flowB_valid && (counters_bj_value == (3'b000)));
  always @ (*) begin
    _zz_58_ = macs_1_0_fifoA_io_pop_data;
    if(last)begin
      _zz_58_ = (_zz_6_ ? macs_1_0_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_58_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_59_ = macs_1_0_fifoB_io_pop_data;
    if(last)begin
      _zz_59_ = (_zz_6_ ? macs_1_0_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_59_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_61_ = ((! macs_1_0_fifoA_io_empty) && (! macs_1_0_fifoB_io_empty));
    if(last)begin
      _zz_61_ = 1'b1;
    end
    if(io_clear)begin
      _zz_61_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_60_ = 1'b0;
    if(last)begin
      _zz_60_ = 1'b0;
    end
    if(io_clear)begin
      _zz_60_ = 1'b1;
    end
  end

  assign _zz_6_ = (! macs_1_0_fifoA_io_empty);
  assign io_results_1_0 = macs_1_0_mac_io_res;
  assign _zz_62_ = (io_flowA_valid && (counters_ai_value == (3'b001)));
  assign _zz_63_ = (io_flowB_valid && (counters_bj_value == (3'b001)));
  always @ (*) begin
    _zz_64_ = macs_1_1_fifoA_io_pop_data;
    if(last)begin
      _zz_64_ = (_zz_7_ ? macs_1_1_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_64_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_65_ = macs_1_1_fifoB_io_pop_data;
    if(last)begin
      _zz_65_ = (_zz_7_ ? macs_1_1_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_65_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_67_ = ((! macs_1_1_fifoA_io_empty) && (! macs_1_1_fifoB_io_empty));
    if(last)begin
      _zz_67_ = 1'b1;
    end
    if(io_clear)begin
      _zz_67_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_66_ = 1'b0;
    if(last)begin
      _zz_66_ = 1'b0;
    end
    if(io_clear)begin
      _zz_66_ = 1'b1;
    end
  end

  assign _zz_7_ = (! macs_1_1_fifoA_io_empty);
  assign io_results_1_1 = macs_1_1_mac_io_res;
  assign _zz_68_ = (io_flowA_valid && (counters_ai_value == (3'b001)));
  assign _zz_69_ = (io_flowB_valid && (counters_bj_value == (3'b010)));
  always @ (*) begin
    _zz_70_ = macs_1_2_fifoA_io_pop_data;
    if(last)begin
      _zz_70_ = (_zz_8_ ? macs_1_2_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_70_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_71_ = macs_1_2_fifoB_io_pop_data;
    if(last)begin
      _zz_71_ = (_zz_8_ ? macs_1_2_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_71_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_73_ = ((! macs_1_2_fifoA_io_empty) && (! macs_1_2_fifoB_io_empty));
    if(last)begin
      _zz_73_ = 1'b1;
    end
    if(io_clear)begin
      _zz_73_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_72_ = 1'b0;
    if(last)begin
      _zz_72_ = 1'b0;
    end
    if(io_clear)begin
      _zz_72_ = 1'b1;
    end
  end

  assign _zz_8_ = (! macs_1_2_fifoA_io_empty);
  assign io_results_1_2 = macs_1_2_mac_io_res;
  assign _zz_74_ = (io_flowA_valid && (counters_ai_value == (3'b001)));
  assign _zz_75_ = (io_flowB_valid && (counters_bj_value == (3'b011)));
  always @ (*) begin
    _zz_76_ = macs_1_3_fifoA_io_pop_data;
    if(last)begin
      _zz_76_ = (_zz_9_ ? macs_1_3_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_76_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_77_ = macs_1_3_fifoB_io_pop_data;
    if(last)begin
      _zz_77_ = (_zz_9_ ? macs_1_3_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_77_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_79_ = ((! macs_1_3_fifoA_io_empty) && (! macs_1_3_fifoB_io_empty));
    if(last)begin
      _zz_79_ = 1'b1;
    end
    if(io_clear)begin
      _zz_79_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_78_ = 1'b0;
    if(last)begin
      _zz_78_ = 1'b0;
    end
    if(io_clear)begin
      _zz_78_ = 1'b1;
    end
  end

  assign _zz_9_ = (! macs_1_3_fifoA_io_empty);
  assign io_results_1_3 = macs_1_3_mac_io_res;
  assign _zz_80_ = (io_flowA_valid && (counters_ai_value == (3'b001)));
  assign _zz_81_ = (io_flowB_valid && (counters_bj_value == (3'b100)));
  always @ (*) begin
    _zz_82_ = macs_1_4_fifoA_io_pop_data;
    if(last)begin
      _zz_82_ = (_zz_10_ ? macs_1_4_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_82_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_83_ = macs_1_4_fifoB_io_pop_data;
    if(last)begin
      _zz_83_ = (_zz_10_ ? macs_1_4_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_83_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_85_ = ((! macs_1_4_fifoA_io_empty) && (! macs_1_4_fifoB_io_empty));
    if(last)begin
      _zz_85_ = 1'b1;
    end
    if(io_clear)begin
      _zz_85_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_84_ = 1'b0;
    if(last)begin
      _zz_84_ = 1'b0;
    end
    if(io_clear)begin
      _zz_84_ = 1'b1;
    end
  end

  assign _zz_10_ = (! macs_1_4_fifoA_io_empty);
  assign io_results_1_4 = macs_1_4_mac_io_res;
  assign _zz_86_ = (io_flowA_valid && (counters_ai_value == (3'b010)));
  assign _zz_87_ = (io_flowB_valid && (counters_bj_value == (3'b000)));
  always @ (*) begin
    _zz_88_ = macs_2_0_fifoA_io_pop_data;
    if(last)begin
      _zz_88_ = (_zz_11_ ? macs_2_0_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_88_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_89_ = macs_2_0_fifoB_io_pop_data;
    if(last)begin
      _zz_89_ = (_zz_11_ ? macs_2_0_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_89_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_91_ = ((! macs_2_0_fifoA_io_empty) && (! macs_2_0_fifoB_io_empty));
    if(last)begin
      _zz_91_ = 1'b1;
    end
    if(io_clear)begin
      _zz_91_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_90_ = 1'b0;
    if(last)begin
      _zz_90_ = 1'b0;
    end
    if(io_clear)begin
      _zz_90_ = 1'b1;
    end
  end

  assign _zz_11_ = (! macs_2_0_fifoA_io_empty);
  assign io_results_2_0 = macs_2_0_mac_io_res;
  assign _zz_92_ = (io_flowA_valid && (counters_ai_value == (3'b010)));
  assign _zz_93_ = (io_flowB_valid && (counters_bj_value == (3'b001)));
  always @ (*) begin
    _zz_94_ = macs_2_1_fifoA_io_pop_data;
    if(last)begin
      _zz_94_ = (_zz_12_ ? macs_2_1_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_94_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_95_ = macs_2_1_fifoB_io_pop_data;
    if(last)begin
      _zz_95_ = (_zz_12_ ? macs_2_1_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_95_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_97_ = ((! macs_2_1_fifoA_io_empty) && (! macs_2_1_fifoB_io_empty));
    if(last)begin
      _zz_97_ = 1'b1;
    end
    if(io_clear)begin
      _zz_97_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_96_ = 1'b0;
    if(last)begin
      _zz_96_ = 1'b0;
    end
    if(io_clear)begin
      _zz_96_ = 1'b1;
    end
  end

  assign _zz_12_ = (! macs_2_1_fifoA_io_empty);
  assign io_results_2_1 = macs_2_1_mac_io_res;
  assign _zz_98_ = (io_flowA_valid && (counters_ai_value == (3'b010)));
  assign _zz_99_ = (io_flowB_valid && (counters_bj_value == (3'b010)));
  always @ (*) begin
    _zz_100_ = macs_2_2_fifoA_io_pop_data;
    if(last)begin
      _zz_100_ = (_zz_13_ ? macs_2_2_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_100_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_101_ = macs_2_2_fifoB_io_pop_data;
    if(last)begin
      _zz_101_ = (_zz_13_ ? macs_2_2_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_101_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_103_ = ((! macs_2_2_fifoA_io_empty) && (! macs_2_2_fifoB_io_empty));
    if(last)begin
      _zz_103_ = 1'b1;
    end
    if(io_clear)begin
      _zz_103_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_102_ = 1'b0;
    if(last)begin
      _zz_102_ = 1'b0;
    end
    if(io_clear)begin
      _zz_102_ = 1'b1;
    end
  end

  assign _zz_13_ = (! macs_2_2_fifoA_io_empty);
  assign io_results_2_2 = macs_2_2_mac_io_res;
  assign _zz_104_ = (io_flowA_valid && (counters_ai_value == (3'b010)));
  assign _zz_105_ = (io_flowB_valid && (counters_bj_value == (3'b011)));
  always @ (*) begin
    _zz_106_ = macs_2_3_fifoA_io_pop_data;
    if(last)begin
      _zz_106_ = (_zz_14_ ? macs_2_3_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_106_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_107_ = macs_2_3_fifoB_io_pop_data;
    if(last)begin
      _zz_107_ = (_zz_14_ ? macs_2_3_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_107_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_109_ = ((! macs_2_3_fifoA_io_empty) && (! macs_2_3_fifoB_io_empty));
    if(last)begin
      _zz_109_ = 1'b1;
    end
    if(io_clear)begin
      _zz_109_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_108_ = 1'b0;
    if(last)begin
      _zz_108_ = 1'b0;
    end
    if(io_clear)begin
      _zz_108_ = 1'b1;
    end
  end

  assign _zz_14_ = (! macs_2_3_fifoA_io_empty);
  assign io_results_2_3 = macs_2_3_mac_io_res;
  assign _zz_110_ = (io_flowA_valid && (counters_ai_value == (3'b010)));
  assign _zz_111_ = (io_flowB_valid && (counters_bj_value == (3'b100)));
  always @ (*) begin
    _zz_112_ = macs_2_4_fifoA_io_pop_data;
    if(last)begin
      _zz_112_ = (_zz_15_ ? macs_2_4_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_112_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_113_ = macs_2_4_fifoB_io_pop_data;
    if(last)begin
      _zz_113_ = (_zz_15_ ? macs_2_4_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_113_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_115_ = ((! macs_2_4_fifoA_io_empty) && (! macs_2_4_fifoB_io_empty));
    if(last)begin
      _zz_115_ = 1'b1;
    end
    if(io_clear)begin
      _zz_115_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_114_ = 1'b0;
    if(last)begin
      _zz_114_ = 1'b0;
    end
    if(io_clear)begin
      _zz_114_ = 1'b1;
    end
  end

  assign _zz_15_ = (! macs_2_4_fifoA_io_empty);
  assign io_results_2_4 = macs_2_4_mac_io_res;
  assign _zz_116_ = (io_flowA_valid && (counters_ai_value == (3'b011)));
  assign _zz_117_ = (io_flowB_valid && (counters_bj_value == (3'b000)));
  always @ (*) begin
    _zz_118_ = macs_3_0_fifoA_io_pop_data;
    if(last)begin
      _zz_118_ = (_zz_16_ ? macs_3_0_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_118_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_119_ = macs_3_0_fifoB_io_pop_data;
    if(last)begin
      _zz_119_ = (_zz_16_ ? macs_3_0_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_119_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_121_ = ((! macs_3_0_fifoA_io_empty) && (! macs_3_0_fifoB_io_empty));
    if(last)begin
      _zz_121_ = 1'b1;
    end
    if(io_clear)begin
      _zz_121_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_120_ = 1'b0;
    if(last)begin
      _zz_120_ = 1'b0;
    end
    if(io_clear)begin
      _zz_120_ = 1'b1;
    end
  end

  assign _zz_16_ = (! macs_3_0_fifoA_io_empty);
  assign io_results_3_0 = macs_3_0_mac_io_res;
  assign _zz_122_ = (io_flowA_valid && (counters_ai_value == (3'b011)));
  assign _zz_123_ = (io_flowB_valid && (counters_bj_value == (3'b001)));
  always @ (*) begin
    _zz_124_ = macs_3_1_fifoA_io_pop_data;
    if(last)begin
      _zz_124_ = (_zz_17_ ? macs_3_1_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_124_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_125_ = macs_3_1_fifoB_io_pop_data;
    if(last)begin
      _zz_125_ = (_zz_17_ ? macs_3_1_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_125_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_127_ = ((! macs_3_1_fifoA_io_empty) && (! macs_3_1_fifoB_io_empty));
    if(last)begin
      _zz_127_ = 1'b1;
    end
    if(io_clear)begin
      _zz_127_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_126_ = 1'b0;
    if(last)begin
      _zz_126_ = 1'b0;
    end
    if(io_clear)begin
      _zz_126_ = 1'b1;
    end
  end

  assign _zz_17_ = (! macs_3_1_fifoA_io_empty);
  assign io_results_3_1 = macs_3_1_mac_io_res;
  assign _zz_128_ = (io_flowA_valid && (counters_ai_value == (3'b011)));
  assign _zz_129_ = (io_flowB_valid && (counters_bj_value == (3'b010)));
  always @ (*) begin
    _zz_130_ = macs_3_2_fifoA_io_pop_data;
    if(last)begin
      _zz_130_ = (_zz_18_ ? macs_3_2_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_130_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_131_ = macs_3_2_fifoB_io_pop_data;
    if(last)begin
      _zz_131_ = (_zz_18_ ? macs_3_2_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_131_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_133_ = ((! macs_3_2_fifoA_io_empty) && (! macs_3_2_fifoB_io_empty));
    if(last)begin
      _zz_133_ = 1'b1;
    end
    if(io_clear)begin
      _zz_133_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_132_ = 1'b0;
    if(last)begin
      _zz_132_ = 1'b0;
    end
    if(io_clear)begin
      _zz_132_ = 1'b1;
    end
  end

  assign _zz_18_ = (! macs_3_2_fifoA_io_empty);
  assign io_results_3_2 = macs_3_2_mac_io_res;
  assign _zz_134_ = (io_flowA_valid && (counters_ai_value == (3'b011)));
  assign _zz_135_ = (io_flowB_valid && (counters_bj_value == (3'b011)));
  always @ (*) begin
    _zz_136_ = macs_3_3_fifoA_io_pop_data;
    if(last)begin
      _zz_136_ = (_zz_19_ ? macs_3_3_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_136_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_137_ = macs_3_3_fifoB_io_pop_data;
    if(last)begin
      _zz_137_ = (_zz_19_ ? macs_3_3_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_137_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_139_ = ((! macs_3_3_fifoA_io_empty) && (! macs_3_3_fifoB_io_empty));
    if(last)begin
      _zz_139_ = 1'b1;
    end
    if(io_clear)begin
      _zz_139_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_138_ = 1'b0;
    if(last)begin
      _zz_138_ = 1'b0;
    end
    if(io_clear)begin
      _zz_138_ = 1'b1;
    end
  end

  assign _zz_19_ = (! macs_3_3_fifoA_io_empty);
  assign io_results_3_3 = macs_3_3_mac_io_res;
  assign _zz_140_ = (io_flowA_valid && (counters_ai_value == (3'b011)));
  assign _zz_141_ = (io_flowB_valid && (counters_bj_value == (3'b100)));
  always @ (*) begin
    _zz_142_ = macs_3_4_fifoA_io_pop_data;
    if(last)begin
      _zz_142_ = (_zz_20_ ? macs_3_4_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_142_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_143_ = macs_3_4_fifoB_io_pop_data;
    if(last)begin
      _zz_143_ = (_zz_20_ ? macs_3_4_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_143_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_145_ = ((! macs_3_4_fifoA_io_empty) && (! macs_3_4_fifoB_io_empty));
    if(last)begin
      _zz_145_ = 1'b1;
    end
    if(io_clear)begin
      _zz_145_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_144_ = 1'b0;
    if(last)begin
      _zz_144_ = 1'b0;
    end
    if(io_clear)begin
      _zz_144_ = 1'b1;
    end
  end

  assign _zz_20_ = (! macs_3_4_fifoA_io_empty);
  assign io_results_3_4 = macs_3_4_mac_io_res;
  assign _zz_146_ = (io_flowA_valid && (counters_ai_value == (3'b100)));
  assign _zz_147_ = (io_flowB_valid && (counters_bj_value == (3'b000)));
  always @ (*) begin
    _zz_148_ = macs_4_0_fifoA_io_pop_data;
    if(last)begin
      _zz_148_ = (_zz_21_ ? macs_4_0_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_148_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_149_ = macs_4_0_fifoB_io_pop_data;
    if(last)begin
      _zz_149_ = (_zz_21_ ? macs_4_0_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_149_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_151_ = ((! macs_4_0_fifoA_io_empty) && (! macs_4_0_fifoB_io_empty));
    if(last)begin
      _zz_151_ = 1'b1;
    end
    if(io_clear)begin
      _zz_151_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_150_ = 1'b0;
    if(last)begin
      _zz_150_ = 1'b0;
    end
    if(io_clear)begin
      _zz_150_ = 1'b1;
    end
  end

  assign _zz_21_ = (! macs_4_0_fifoA_io_empty);
  assign io_results_4_0 = macs_4_0_mac_io_res;
  assign _zz_152_ = (io_flowA_valid && (counters_ai_value == (3'b100)));
  assign _zz_153_ = (io_flowB_valid && (counters_bj_value == (3'b001)));
  always @ (*) begin
    _zz_154_ = macs_4_1_fifoA_io_pop_data;
    if(last)begin
      _zz_154_ = (_zz_22_ ? macs_4_1_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_154_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_155_ = macs_4_1_fifoB_io_pop_data;
    if(last)begin
      _zz_155_ = (_zz_22_ ? macs_4_1_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_155_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_157_ = ((! macs_4_1_fifoA_io_empty) && (! macs_4_1_fifoB_io_empty));
    if(last)begin
      _zz_157_ = 1'b1;
    end
    if(io_clear)begin
      _zz_157_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_156_ = 1'b0;
    if(last)begin
      _zz_156_ = 1'b0;
    end
    if(io_clear)begin
      _zz_156_ = 1'b1;
    end
  end

  assign _zz_22_ = (! macs_4_1_fifoA_io_empty);
  assign io_results_4_1 = macs_4_1_mac_io_res;
  assign _zz_158_ = (io_flowA_valid && (counters_ai_value == (3'b100)));
  assign _zz_159_ = (io_flowB_valid && (counters_bj_value == (3'b010)));
  always @ (*) begin
    _zz_160_ = macs_4_2_fifoA_io_pop_data;
    if(last)begin
      _zz_160_ = (_zz_23_ ? macs_4_2_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_160_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_161_ = macs_4_2_fifoB_io_pop_data;
    if(last)begin
      _zz_161_ = (_zz_23_ ? macs_4_2_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_161_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_163_ = ((! macs_4_2_fifoA_io_empty) && (! macs_4_2_fifoB_io_empty));
    if(last)begin
      _zz_163_ = 1'b1;
    end
    if(io_clear)begin
      _zz_163_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_162_ = 1'b0;
    if(last)begin
      _zz_162_ = 1'b0;
    end
    if(io_clear)begin
      _zz_162_ = 1'b1;
    end
  end

  assign _zz_23_ = (! macs_4_2_fifoA_io_empty);
  assign io_results_4_2 = macs_4_2_mac_io_res;
  assign _zz_164_ = (io_flowA_valid && (counters_ai_value == (3'b100)));
  assign _zz_165_ = (io_flowB_valid && (counters_bj_value == (3'b011)));
  always @ (*) begin
    _zz_166_ = macs_4_3_fifoA_io_pop_data;
    if(last)begin
      _zz_166_ = (_zz_24_ ? macs_4_3_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_166_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_167_ = macs_4_3_fifoB_io_pop_data;
    if(last)begin
      _zz_167_ = (_zz_24_ ? macs_4_3_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_167_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_169_ = ((! macs_4_3_fifoA_io_empty) && (! macs_4_3_fifoB_io_empty));
    if(last)begin
      _zz_169_ = 1'b1;
    end
    if(io_clear)begin
      _zz_169_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_168_ = 1'b0;
    if(last)begin
      _zz_168_ = 1'b0;
    end
    if(io_clear)begin
      _zz_168_ = 1'b1;
    end
  end

  assign _zz_24_ = (! macs_4_3_fifoA_io_empty);
  assign io_results_4_3 = macs_4_3_mac_io_res;
  assign _zz_170_ = (io_flowA_valid && (counters_ai_value == (3'b100)));
  assign _zz_171_ = (io_flowB_valid && (counters_bj_value == (3'b100)));
  always @ (*) begin
    _zz_172_ = macs_4_4_fifoA_io_pop_data;
    if(last)begin
      _zz_172_ = (_zz_25_ ? macs_4_4_fifoA_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_172_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_173_ = macs_4_4_fifoB_io_pop_data;
    if(last)begin
      _zz_173_ = (_zz_25_ ? macs_4_4_fifoB_io_pop_data : (16'b0000000000000000));
    end
    if(io_clear)begin
      _zz_173_ = (16'b0000000000000000);
    end
  end

  always @ (*) begin
    _zz_175_ = ((! macs_4_4_fifoA_io_empty) && (! macs_4_4_fifoB_io_empty));
    if(last)begin
      _zz_175_ = 1'b1;
    end
    if(io_clear)begin
      _zz_175_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_174_ = 1'b0;
    if(last)begin
      _zz_174_ = 1'b0;
    end
    if(io_clear)begin
      _zz_174_ = 1'b1;
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
    end
  end

  always @ (posedge clk) begin
    last_regNext <= last;
    edge_1__delay_1 <= edge_1_;
    edge_1__delay_2 <= edge_1__delay_1;
    edge_1__delay_3 <= edge_1__delay_2;
  end

endmodule

module PeStream (
      input   streamA_valid,
      output  streamA_ready,
      input  [15:0] streamA_payload,
      input   streamB_valid,
      output  streamB_ready,
      input  [15:0] streamB_payload,
      output  streamR_valid,
      input   streamR_ready,
      output [31:0] streamR_payload,
      input   clk,
      input   reset);
  reg  _zz_2_;
  reg  _zz_3_;
  reg [31:0] _zz_4_;
  wire [31:0] pe_1__io_results_0_0;
  wire [31:0] pe_1__io_results_0_1;
  wire [31:0] pe_1__io_results_0_2;
  wire [31:0] pe_1__io_results_0_3;
  wire [31:0] pe_1__io_results_0_4;
  wire [31:0] pe_1__io_results_1_0;
  wire [31:0] pe_1__io_results_1_1;
  wire [31:0] pe_1__io_results_1_2;
  wire [31:0] pe_1__io_results_1_3;
  wire [31:0] pe_1__io_results_1_4;
  wire [31:0] pe_1__io_results_2_0;
  wire [31:0] pe_1__io_results_2_1;
  wire [31:0] pe_1__io_results_2_2;
  wire [31:0] pe_1__io_results_2_3;
  wire [31:0] pe_1__io_results_2_4;
  wire [31:0] pe_1__io_results_3_0;
  wire [31:0] pe_1__io_results_3_1;
  wire [31:0] pe_1__io_results_3_2;
  wire [31:0] pe_1__io_results_3_3;
  wire [31:0] pe_1__io_results_3_4;
  wire [31:0] pe_1__io_results_4_0;
  wire [31:0] pe_1__io_results_4_1;
  wire [31:0] pe_1__io_results_4_2;
  wire [31:0] pe_1__io_results_4_3;
  wire [31:0] pe_1__io_results_4_4;
  wire  pe_1__io_done;
  wire  pe_1__io_last;
  wire  _zz_5_;
  wire [0:0] _zz_6_;
  wire [4:0] _zz_7_;
  reg [15:0] payloadA;
  reg [15:0] payloadB;
  wire  outBlocked;
  wire  done;
  reg [31:0] resultStream_results_0;
  reg [31:0] resultStream_results_1;
  reg [31:0] resultStream_results_2;
  reg [31:0] resultStream_results_3;
  reg [31:0] resultStream_results_4;
  reg [31:0] resultStream_results_5;
  reg [31:0] resultStream_results_6;
  reg [31:0] resultStream_results_7;
  reg [31:0] resultStream_results_8;
  reg [31:0] resultStream_results_9;
  reg [31:0] resultStream_results_10;
  reg [31:0] resultStream_results_11;
  reg [31:0] resultStream_results_12;
  reg [31:0] resultStream_results_13;
  reg [31:0] resultStream_results_14;
  reg [31:0] resultStream_results_15;
  reg [31:0] resultStream_results_16;
  reg [31:0] resultStream_results_17;
  reg [31:0] resultStream_results_18;
  reg [31:0] resultStream_results_19;
  reg [31:0] resultStream_results_20;
  reg [31:0] resultStream_results_21;
  reg [31:0] resultStream_results_22;
  reg [31:0] resultStream_results_23;
  reg [31:0] resultStream_results_24;
  reg  resultStream_counter_willIncrement;
  reg  resultStream_counter_willClear;
  reg [4:0] resultStream_counter_valueNext;
  reg [4:0] resultStream_counter_value;
  wire  resultStream_counter_willOverflowIfInc;
  wire  resultStream_counter_willOverflow;
  reg  resultStream_valid;
  wire [31:0] _zz_1_;
  reg [31:0] resultStream_payload;
  reg [31:0] resultStream_payload_regNext;
  reg  resultStream_valid_regNext;
  assign _zz_5_ = (pe_1__io_last || outBlocked);
  assign _zz_6_ = resultStream_counter_willIncrement;
  assign _zz_7_ = {4'd0, _zz_6_};
  Pe pe_1_ ( 
    .io_flowA_valid(_zz_2_),
    .io_flowA_payload(payloadA),
    .io_flowB_valid(_zz_3_),
    .io_flowB_payload(payloadB),
    .io_results_0_0(pe_1__io_results_0_0),
    .io_results_0_1(pe_1__io_results_0_1),
    .io_results_0_2(pe_1__io_results_0_2),
    .io_results_0_3(pe_1__io_results_0_3),
    .io_results_0_4(pe_1__io_results_0_4),
    .io_results_1_0(pe_1__io_results_1_0),
    .io_results_1_1(pe_1__io_results_1_1),
    .io_results_1_2(pe_1__io_results_1_2),
    .io_results_1_3(pe_1__io_results_1_3),
    .io_results_1_4(pe_1__io_results_1_4),
    .io_results_2_0(pe_1__io_results_2_0),
    .io_results_2_1(pe_1__io_results_2_1),
    .io_results_2_2(pe_1__io_results_2_2),
    .io_results_2_3(pe_1__io_results_2_3),
    .io_results_2_4(pe_1__io_results_2_4),
    .io_results_3_0(pe_1__io_results_3_0),
    .io_results_3_1(pe_1__io_results_3_1),
    .io_results_3_2(pe_1__io_results_3_2),
    .io_results_3_3(pe_1__io_results_3_3),
    .io_results_3_4(pe_1__io_results_3_4),
    .io_results_4_0(pe_1__io_results_4_0),
    .io_results_4_1(pe_1__io_results_4_1),
    .io_results_4_2(pe_1__io_results_4_2),
    .io_results_4_3(pe_1__io_results_4_3),
    .io_results_4_4(pe_1__io_results_4_4),
    .io_clear(done),
    .io_done(pe_1__io_done),
    .io_last(pe_1__io_last),
    .clk(clk),
    .reset(reset) 
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

  assign resultStream_counter_willOverflowIfInc = (resultStream_counter_value == (5'b11000));
  assign resultStream_counter_willOverflow = (resultStream_counter_willOverflowIfInc && resultStream_counter_willIncrement);
  always @ (*) begin
    if(resultStream_counter_willOverflow)begin
      resultStream_counter_valueNext = (5'b00000);
    end else begin
      resultStream_counter_valueNext = (resultStream_counter_value + _zz_7_);
    end
    if(resultStream_counter_willClear)begin
      resultStream_counter_valueNext = (5'b00000);
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
      resultStream_counter_value <= (5'b00000);
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

