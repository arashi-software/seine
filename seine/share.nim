import posix, os
import louvre

let socketPath* = "/run/user" / $cast[int](geteuid()) / "seine/seinec"
var scene*: ptr Scene

