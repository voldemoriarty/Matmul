package pe
import spinal.core._
import spinal.lib._

import scala.collection.mutable

//noinspection FieldFromDelayedInit
class PeStream(cfg: PeCfg, swapInputEndian: Boolean = false, swapOutputEndian: Boolean = false) extends Component {
  val pe = new Pe(cfg)

  val io = new Bundle {
    val streamA = slave(Stream(pe.dType))
    val streamB = slave(Stream(pe.dType))
    val streamR = master(Stream(pe.resType))

    noIoPrefix()
  }

  val payloadA = if (swapInputEndian) EndiannessSwap(io.streamA.payload) else io.streamA.payload
  val payloadB = if (swapInputEndian) EndiannessSwap(io.streamB.payload) else io.streamB.payload

  pe.io.flowA.payload := payloadA
  pe.io.flowA.valid   := io.streamA.valid
  pe.io.flowB.payload := payloadB
  pe.io.flowB.valid   := io.streamB.valid

  // when the PE is in last mode, it disables the
  // inputs to its MACs to flush out the results for
  // 3 cycles. During this time we must put back pressure
  // on the input streams to ensure that no data is lost
  val inLast      = pe.io.last

  // the output is blocked if the PE is sending data outside
  // and the ready signal is pulled low
  val outBlocked  = !io.streamR.ready && io.streamR.valid

  io.streamA.ready := !inLast && !outBlocked
  io.streamB.ready := !inLast && !outBlocked

  // also invalidate the data going in the flows of the PE
  // else the FIFOs will keep filling
  when(inLast || outBlocked) {
    pe.io.flowA.valid := False
    pe.io.flowB.valid := False
  }

  // the computation is done when last and done both
  // are high
  val done = pe.io.done && pe.io.last

  // when the PE goes into last mode, it doesn't come out unless
  // the clear is asserted. So use the done signal as the clear so
  // PE is ready to accept data once again
  pe.io.clear := done

  val resultStream = new Area {
    // also when the results are ready, the ready signal is pulsed
    // register them all and send them in the output stream
    // the results are arranged in a 2d array fashion in the PE
    // we need to flatten them
    val list = mutable.MutableList[UInt]()
    for (i <- 0 until cfg.dim) {
      for (j <- 0 until cfg.dim) {
        list += pe.io.results(i)(j)
      }
    }

    // convert the list to a vector which we can address
    // and register them when all computations complete
    val results = RegNextWhen(Vec(list), done)

    // the counter is used to track the addresses to send
    val counter = Counter(0, cfg.dim * cfg.dim - 1)
    when (done) {
      counter.clear()
    }

    // use to track if the result registers have valid data in them
    val valid = Reg(Bool) init False setWhen done clearWhen counter.willOverflow

    // when the slave is ready, send data
    val payload = if (swapOutputEndian) EndiannessSwap(results(counter)) else results(counter)
    io.streamR.payload  := RegNext(payload)
    io.streamR.valid    := RegNext(valid) init False

    when (io.streamR.ready && valid) {
      counter.increment()
    }
  }
}
