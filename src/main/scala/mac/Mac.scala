package mac

import spinal.core._
import fifo._

class Mac(cfg: MacCfg = MacCfg()) extends Area {
  def Data  = UInt(cfg.bits bits)
  def Res   = UInt(cfg.resWidth bits)

  val io = new Bundle {
    val a,b = Data
    val res = Res
    val clr = Bool
    val en  = Bool
  }

  def attachFifo(a: Fifo, b: Fifo): Unit = {
    io.a  := a.topData
    io.b  := b.topData
    io.en := a.hasData & b.hasData

    a.popWhen(io.en)
    b.popWhen(io.en)
  }

  def res = io.res
  def clr = io.clr

  val impl = new MacImpl(cfg)

  impl.input(io.a, io.b)
  io.res := impl.output()
  impl.reset(io.clr)
  impl.enable(io.en)
}
