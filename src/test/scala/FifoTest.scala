import org.scalatest.funsuite._

import scala.util.Random
import spinal.core._
import spinal.core.sim._

import scala.collection.mutable

//noinspection FieldFromDelayedInit
class FifoTest extends AnyFunSuite {

  // create a random fifo configuration
  val dataWidth = Random.nextInt(32)
  val maxSize = Random.nextInt(128) + 1
  var cfg: SimCompiled[fifo.Fifo] = _
  println(s"Width: $dataWidth, Size: $maxSize")

  // a counter that counts cycles passed
  var ctr = 0

  // define functions that assist in reading and
  // writing to the fifo
  def popH(dut: fifo.Fifo): Unit = {
    dut.io.pop.en #= true
  }
  def popL(dut: fifo.Fifo): Unit = {
    dut.io.pop.en #= false
  }
  def pushData(dut: fifo.Fifo, data: Int) : Unit = {
    dut.io.push.data #= data & ((1 << dataWidth) - 1)
  }
  def pushL(dut: fifo.Fifo): Unit = {
    dut.io.push.en #= false
  }
  def pushH(dut: fifo.Fifo): Unit = {
    dut.io.push.en #= true
  }
  def popValid(dut: fifo.Fifo) = {
    dut.io.pop.valid.toBoolean
  }
  def popData(dut: fifo.Fifo) = {
    dut.io.pop.data.toInt
  }
  def full(dut: fifo.Fifo) = {
    dut.io.full.toBoolean
  }
  def empty(dut: fifo.Fifo) = {
    dut.io.empty.toBoolean
  }
  def tick(dut: fifo.Fifo): Unit = {
    dut.clockDomain.waitSampling()
    sleep(1)
    ctr += 1
  }

  test("Compile") {
    cfg = SimConfig
      .withWave
      .workspacePath("waves")
      .withConfig(SpinalConfig())
      .compile(new fifo.Fifo(dataWidth, maxSize))
  }

  test("Pop empty") {
    cfg.doSim (dut => {
      dut.clockDomain.forkStimulus(20)
      popH(dut)
      sleep(1)
      assert(!popValid(dut))
      popL(dut)
    })
  }

  test("Push full") {
    ctr = 0
    cfg.doSim(dut => {
      dut.clockDomain.forkStimulus(20)
      do {
        popL(dut)
        pushH(dut)
        pushData(dut, Random.nextInt())
        tick(dut)
      } while (ctr != maxSize)
      assert(dut.count.toInt == maxSize)
    })
  }

  test("Push full then pop") {
    ctr = 0
    cfg.doSim(dut => {
      dut.clockDomain.forkStimulus(20)
      val q = mutable.Queue[Int]()
      do {
        popL(dut)
        pushH(dut)
        val data = Random.nextInt() & ((1 << dataWidth) - 1)
        pushData(dut, data)
        q += data
        tick(dut)
      } while (ctr != maxSize)
      assert(dut.count.toInt == maxSize)

      pushL(dut)
      do {
        tick(dut)
        popH(dut)
        sleep(1)
        val hwPop = popData(dut)
        val swPop = q.dequeue()
        val valid = popValid(dut)
        assert(valid && hwPop == swPop)
      } while (q.nonEmpty)
      tick(dut)
    })
  }
}
