import louvre

type
  Leaf* = ref object of Toplevel
    x, y: int
    w, h: uint
    l, r: Leaf

  Tree* = ref object
    root: Leaf
    w, h: uint
    factor: float
    outerGap: uint # Gap between windows and screen edges
    innerGap: uint # Gap between windows


