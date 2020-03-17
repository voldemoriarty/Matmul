name := "Matmul"

version := "0.1"

scalaVersion := "2.11.12"

libraryDependencies ++= Seq(
  "com.github.spinalhdl" % "spinalhdl-core_2.11" % "1.3.8",
  "com.github.spinalhdl" % "spinalhdl-lib_2.11" % "1.3.8",
  "org.scalatest" % "scalatest_2.11" % "3.1.1" % "test",
  "org.rogach" %% "scallop" % "3.4.0"
)

fork := true