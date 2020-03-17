package pe
import spinal.core._
import spinal.lib._
import mac._
import fifo._

//noinspection FieldFromDelayedInit
class Pe(cfg: PeCfg) extends Component {
  def resType = if (cfg.fullOutWidth) UInt(2*cfg.bits + cfg.dim bits) else UInt(cfg.resBits bits)
  def dType = UInt(cfg.bits bits)

  val io = new Bundle {
    val flowA   = slave(Flow(dType))
    val flowB   = slave(Flow(dType))
    val results = out Vec(Vec(resType, cfg.dim), cfg.dim)
    val clear   = in  Bool
    val done    = out Bool
    val last    = out Bool
  }

  val counters = new Area {
    val ai, aj, bi, bj = Counter(0 until cfg.dim)

    val lastA = Reg(Bool) init False setWhen(ai.willOverflow & io.flowA.valid) clearWhen io.clear
    val lastB = Reg(Bool) init False setWhen(bi.willOverflow & io.flowB.valid) clearWhen io.clear

    when (io.clear) {
      List(ai, aj, bi, bj).foreach(_.clear())
    }

    when (io.flowA.valid) {
      aj.increment()

      when(aj.willOverflow) {
        ai.increment()
      }
    }

    when (io.flowB.valid) {
      bj.increment()

      when(bj.willOverflow) {
        bi.increment()
      }
    }
  }

  val last  = counters.lastA & counters.lastB
  val edge  = !RegNext(last) & last
  io.done   := Delay(edge, 3)
  io.last   := last

  val macs = Array.tabulate(cfg.dim, cfg.dim)((i, j) => new Area {
    val fifoA, fifoB = new Fifo(cfg.bits, cfg.dim, cfg.mlabAttr)
    val mac = new Mac(MacCfg(cfg.bits, resType.getBitsWidth))

    fifoA.readWhen(io.flowA, counters.ai === i)
    fifoB.readWhen(io.flowB, counters.bj === j)

    mac.attachFifo(fifoA, fifoB)
    mac.clr := False


    when (last) {
      val fromFifo = fifoA.hasData
      mac.io.a    := fromFifo ? fifoA.topData | 0
      mac.io.b    := fromFifo ? fifoB.topData | 0
      mac.io.clr  := False
      mac.io.en   := True
    }

    when (io.clear) {
      mac.io.a    := 0
      mac.io.b    := 0
      mac.io.clr  := True
      mac.io.en   := True
    }


    io.results(i)(j) := mac.res
  })
}
