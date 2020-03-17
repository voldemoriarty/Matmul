import pe._
import spinal.core.sim._
import spinal.core._
import org.scalatest.funsuite._
import scala.util.Random

//noinspection FieldFromDelayedInit
class PeTest extends AnyFunSuite {
  val dim     = Random.nextInt(12) + 2
  val bits    = 8
  val rBits   = 2*bits + dim
  val maxVal  = 1 << rBits
  val peCfg   = PeCfg(dim, bits, rBits)
  println(s"Testing PE of size $dim")

  var cfg: SimCompiled[Pe] = _


  def MatMul(a: Array[Array[Int]], b: Array[Array[Int]]) : Array[Array[Int]] = {
    assert(a.length == b.length, "Matrix dimensions must match")
    Array.tabulate(a.length, a.length)((i, j) => {
      val len = a.length
      val aRow = a(i)
      val bCol = (0 until len).map(b(_)(j)).toArray
      aRow.zip(bCol).map(t => (t._1 * t._2) % maxVal).sum % maxVal
    })
  }

  def RandomMat(dim: Int) = Array.tabulate(dim, dim)((_, _) => Random.nextInt(1 << bits))

  test("Compile") {
    cfg = SimConfig
      .withWave
      .workspacePath("waves")
      .withConfig(SpinalConfig())
      .compile(new Pe(peCfg))
  }
  test("Random a,b together") {
    cfg.doSim(dut => {
      dut.clockDomain.forkStimulus(10)

      // create random matrices and their product
      val a, b  = RandomMat(dim)
      val c     = MatMul(a, b)

      def tick(): Unit = {
        dut.clockDomain.waitSampling()
        sleep(1)
      }

      def pulse(signal: Bool): Unit = {
        signal #= true
        tick()
        signal #= false
      }
      dut.io.flowA.valid #= false
      dut.io.flowB.valid #= false

      // clear the macs
      pulse(dut.io.clear)

      // send a and b together one sample at a time
      val flatA = a.flatten
      val flatB = b.flatten

      flatA.zip(flatB).foreach(t => {
        val a = t._1
        val b = t._2

        dut.io.flowA.valid    #= true
        dut.io.flowB.valid    #= true
        dut.io.flowA.payload  #= a
        dut.io.flowB.payload  #= b

        tick()
      })

      dut.io.flowA.valid #= false
      dut.io.flowB.valid #= false

      // wait 3 cycles for the results
      tick()
      tick()
      tick()
      tick()
      tick()
      tick()
      // verify
      (0 until dim).foreach(i => {
        (0 until dim).foreach(j => {
          val hwResult = dut.io.results(i)(j).toInt
          assert(hwResult == (c(i)(j) % maxVal), s"($i, $j) mismatch")
        })
      })
    })
  }
  test("First a then b") {
    cfg.doSim(dut => {
      dut.clockDomain.forkStimulus(10)

      // create random matrices and their product
      val a, b  = RandomMat(dim)
      val c     = MatMul(a, b)

      def tick(): Unit = {
        dut.clockDomain.waitSampling()
        sleep(1)
      }

      def pulse(signal: Bool): Unit = {
        signal #= true
        tick()
        signal #= false
      }

      dut.io.flowB.valid #= false
      dut.io.flowA.valid #= false


      // clear the macs
      pulse(dut.io.clear)

      // send a then b
      val flatA = a.flatten
      val flatB = b.flatten

      flatA.foreach(t => {
        val a = t
        dut.io.flowA.valid    #= true
        dut.io.flowA.payload  #= a
        tick()
      })
      dut.io.flowA.valid #= false

      flatB.foreach(t => {
        val b = t
        dut.io.flowB.valid    #= true
        dut.io.flowB.payload  #= b
        tick()
      })
      dut.io.flowB.valid #= false

      // wait 3 cycles for the results
      tick()
      tick()
      tick()
      tick()
      tick()
      tick()
      // verify
      (0 until dim).foreach(i => {
        (0 until dim).foreach(j => {
          val hwResult = dut.io.results(i)(j).toInt
          assert(hwResult == (c(i)(j) % maxVal), s"($i, $j) mismatch")
        })
      })
    })
  }
}
