import pe._
import spinal.core.sim._
import spinal.core._
import spinal.lib._
import org.scalatest.funsuite._
import scala.util.Random

//noinspection FieldFromDelayedInit
class PeStreamTest extends AnyFunSuite {
  val dim     = Random.nextInt(12) + 2
  val bits    = 8
  val rBits   = 2*bits + dim
  val maxVal  = 1 << rBits
  val peCfg   = PeCfg(dim, bits, rBits)
  println(s"Testing PE of size $dim")

  var cfg: SimCompiled[PeStream] = _


  def MatMul(a: Array[Array[Int]], b: Array[Array[Int]]) : Array[Array[Int]] = {
    assert(a.length == b.length, "Matrix dimensions must match")
    Array.tabulate(a.length, a.length)((i, j) => {
      val len = a.length
      val aRow = a(i)
      val bCol = (0 until len).map(b(_)(j)).toArray
      aRow.zip(bCol).map(t => (t._1 * t._2) % maxVal).sum % maxVal
    })
  }

  def RandomMat(dim: Int) = Array.tabulate(dim, dim)((_, _) => {
    val r = Random.nextInt(1 << bits)
    print(s"$r\t")
    r
  })

  test("Compile") {
    cfg = SimConfig
      .withWave
      .workspacePath("waves")
      .withConfig(SpinalConfig())
      .compile(new PeStream(peCfg))
  }
  test("Random a,b together") {
    cfg.doSim(dut => {
      // create a clock thread
      dut.clockDomain.forkStimulus(10)

      dut.io.streamA.valid #= false
      dut.io.streamB.valid #= false
      dut.io.streamR.ready #= false


      // create random matrices and their product
      val a = RandomMat(dim); println("")
      val b = RandomMat(dim); println("")

      def tick(): Unit = {
        dut.clockDomain.waitSampling()
        sleep(1)
      }

      def sendRecvTest(a: Array[Array[Int]], b: Array[Array[Int]], c: Array[Array[Int]]): Unit = {
        val flatA = a.flatten
        val flatB = b.flatten

        dut.io.streamR.ready #= true
        sleep(1)

        def streamA = dut.io.streamA
        def streamB = dut.io.streamB

        flatA.zip(flatB).foreach(z => {

          streamA.valid #= true
          streamB.valid #= true

          streamA.payload #= z._1
          streamB.payload #= z._2


          // assuming no wait states
          var sentA = streamA.ready.toBoolean
          var sentB = streamB.ready.toBoolean

          tick()

          while (!sentA || !sentB) {
            if (streamA.ready.toBoolean) {
              sentA = true
              streamA.valid #= false
            }

            if (streamB.ready.toBoolean){
              sentB = true
              streamB.valid #= false
            }
            tick()
          }
        })

        streamA.valid #= false
        streamB.valid #= false
        sleep(1)

        c.flatten.foreach(v => {
          var valid = dut.io.streamR.valid.toBoolean
          while (!valid) {
            tick()
            valid = dut.io.streamR.valid.toBoolean
          }
          val data = dut.io.streamR.payload.toInt
          assert(v == data)
          tick()
        })
      }

      sendRecvTest(a, b, MatMul(a, b))
      sendRecvTest(b, a, MatMul(b, a))
    })
  }
}
