var comp*: uint

# Utils for encoding and decoding the pointers
func `*`*(T: typedesc, p: uint): ptr T =
  cast[ptr T](p)

func `&`*(p: pointer): uint =
  cast[uint](p)
