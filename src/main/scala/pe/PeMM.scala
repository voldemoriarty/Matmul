package pe
import spinal.core._
import spinal.lib._

//noinspection FieldFromDelayedInit
/**
  * Well this doesn't work.
  *
  * @param cfg        Configuration of PE
  * @param busWidth   Bus width of the data bus and CSR bus
  */
class PeMM(cfg: PeCfg, busWidth: Int = 32) extends Component {
  val rAddrWidth = 2 * log2Up(cfg.dim)
  val io = new Bundle {
    val flowA   = slave(Flow(UInt(cfg.bits bits)))
    val flowB   = slave(Flow(UInt(cfg.bits bits)))

    val results = new Bundle {
      val addr  = in  UInt(rAddrWidth bits)
      val rData = out UInt(busWidth bits)
    }

    val csr = new Bundle {
      val addr  = in  UInt(1 bits)
      val rData = out UInt(busWidth bits)
      val wData = in  UInt(busWidth bits)
      val wEn   = in  Bool
      val cSel  = in  Bool
    }
  }

  val pe = new Pe(cfg)
  val clrReg = Reg(UInt(1 bits))

  pe.io.flowA := io.flowA
  pe.io.flowB := io.flowB
  pe.io.clear := clrReg.asBool

  val i = io.results.addr(rAddrWidth - 1 downto rAddrWidth / 2)
  val j = io.results.addr(rAddrWidth / 2 - 1 downto 0)

  io.results.rData := RegNext(pe.io.results(i)(j)).resize(busWidth)


  when (io.csr.cSel & io.csr.wEn) {
    when (io.csr.addr === U"0") {
      clrReg := io.csr.wData.resize(1)
    }
  }

  // for now
  io.csr.rData := RegNext(clrReg).resize(busWidth)
}
