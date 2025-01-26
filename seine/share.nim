import posix, os

let socketPath* = "/run/user" / $cast[int](geteuid()) / "seine/seinec"
