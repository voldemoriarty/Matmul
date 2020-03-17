package fifo

import spinal.core._
import spinal.core.sim._
import spinal.lib._

class Fifo(val dataWidth: Int = 32, val maxSize: Int = 32, val mlab: Boolean = false) extends Component {
  val io = new Bundle {
    val push = new Bundle {
      val data  = in UInt(dataWidth bits)
      val en    = in Bool
    }

    val pop = new Bundle {
      val data  = out UInt(dataWidth bits)
      val en    = in  Bool
      val valid = out Bool
    }

    val full  = out Bool
    val empty = out Bool
  }

  def readWhen(in: Flow[UInt], cond: Bool): Unit = {
    assert(in.payload.getBitsWidth == dataWidth, "Stream and Fifo width mismatch")

    io.push.data  := in.payload
    io.push.en    := in.valid & cond
  }

  def isEmpty: Bool = io.empty
  def hasData: Bool = !io.empty
  def topData: UInt = io.pop.data

  def popWhen (c: Bool): Unit = io.pop.en := c


  val addrWidth = log2Up(maxSize)

  val wPtr  = Reg(UInt(addrWidth bits)) init 0 simPublic()
  val rPtr  = Reg(UInt(addrWidth bits)) init 0 simPublic()
  val count = Reg(UInt(addrWidth + 1 bits)) init 0 simPublic()

  io.empty  := (count === 0)
  io.full   := (count === maxSize)

  // if the maxSize is a power of 2 then we don't need to mod
  val mod = (maxSize & (maxSize - 1)) != 0

  def nextCond(ptr: UInt) = Mux(ptr === maxSize - 1, U"0", ptr + 1)
  def nextWAddr = if (mod) nextCond(wPtr) else wPtr + 1
  def nextRAddr = if (mod) nextCond(rPtr) else rPtr + 1

  val mem = new Mem(UInt(dataWidth bits), maxSize)
  if (mlab) mem.addAttribute("ramstyle", "mlab,no_rw_check")

  val pushLogic = new Area {
    import io._
    // add to mem if fifo is not full and push is enabled
    when (push.en && !io.full) {
      mem.write(wPtr, push.data)
      wPtr := nextWAddr
    }
  }

  val popLogic = new Area {
    import io._
    // return valid data when fifo is not empty
    pop.data := mem.readAsync(rPtr, writeFirst)
    when (pop.en && !io.empty) {
      pop.valid := True
      rPtr  := nextRAddr
    } otherwise {
      pop.valid := False
    }
  }

  val countLogic = new Area {
    val push  = io.push.en && !io.full
    val pop   = io.pop.en && !io.empty

    switch(push ## pop) {
      is(B"01") {
        count := count - 1
      }
      is(B"10") {
        count := count + 1
      }
      default {
        count := count
      }
    }
  }
}
