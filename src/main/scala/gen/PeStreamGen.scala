package gen
import spinal.core._
import scala.io.StdIn._
import org.rogach.scallop._

class Conf(args: Seq[String]) extends ScallopConf(args) {
  val in    = opt[Int](descr = "Input bit width")
  val int   = opt[Boolean](descr = "Run in interactive mode, all other flags ignored", noshort = true)
  val dim   = opt[Int](descr = "Dimension of PE MAC Array")
  val out   = opt[Int](descr = "Output bit width")
  val sie   = opt[Boolean](descr = "Swap Endian at input port", noshort = true)
  val soe   = opt[Boolean](descr = "Swap Endian at output port", noshort = true)

  banner("Matmul: Generate a Matrix Multiplier PE with streaming inputs and output\n")
  verify()
}

object PeStreamGen extends App {

  def interactive(): Unit = {
    println("Running in interactive mode")
    print("Dimension of PE: ")
    val dim = readInt()

    print("Width of input: ")
    val inWidth = readInt()

    print("Width of output: ")
    val outWidth = readInt()

    print("Endian Swap Input (y/n): ")
    val sIn = readBoolean()

    print("Endian Swap Output (y/n): ")
    val sOut = readBoolean()

    val cfg = pe.PeCfg(dim, inWidth, outWidth)
    SpinalVerilog(new pe.PeStream(cfg, sIn, sOut))
  }

  override def main(args: Array[String]): Unit = {
    val defArgs = Array("--int")

    val conf = new Conf(if (args.isEmpty) defArgs else args)

    try {
      if (conf.int()) {
        interactive()
      } else {
        val in    = conf.in()
        val out   = conf.out()
        val sie   = conf.sie()
        val soe   = conf.soe()
        val dim   = conf.dim()

        println(s"Creating PE of dim: $dim, in: $in bits, out: $out bits")
        SpinalVerilog(new pe.PeStream(pe.PeCfg(dim, in, out), sie, soe))
      }

    } catch {
        case _: Exception => conf.printHelp()
    }
  }
}
