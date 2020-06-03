package mac

import spinal.core._

class MacImpl(cfg: MacCfg = MacCfg()) extends Area {
  def Data  = UInt(cfg.bits bits)
  def Res   = UInt(cfg.resWidth bits)

  val or      = Res
  val a,b     = Data
  val c       = Res
  val clr,en  = Bool

  val ar    = RegNextWhen(a, en) init 0
  val br    = RegNextWhen(b, en) init 0
  val sr    = RegNextWhen(clr, en)
  val mr    = RegNextWhen((ar * br).resize(cfg.resWidth), en) init 0
  val adder = RegNextWhen(or + mr, en) init 0

  when (RegNextWhen(sr, en)) {
    or := 0
  } otherwise {
    or := adder.resize(cfg.resWidth)
  }

  c := adder.resize(cfg.resWidth)

  def input(ina: UInt, inb: UInt): Unit = {
    assert(ina.getBitsWidth == cfg.bits, "input a bit width mismatch")
    assert(inb.getBitsWidth == cfg.bits, "input b bit width mismatch")

    a := ina
    b := inb
  }

  def output(): UInt          = c
  def enable(): Unit          = en := True
  def stall(): Unit           = en := False
  def enable(en: Bool): Unit  = this.en := en
  def reset(): Unit           = clr := True
  def reset(r: Bool): Unit    = clr := r
  def unreset(): Unit         = clr := False
}
