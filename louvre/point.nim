import pkg/vmath

{.push header: "<LPoint.h>".}

type
  Point* {.importcpp: "Louvre::LPoint", inheritable.} = object
  Size* {.importcpp: "Louvre::LSize".} = Point#object of Point

func `x`*(point: Point): int32 {.importcpp: "@.x()".}
func `y`*(point: Point): int32 {.importcpp: "@.y()".}
func `w`*(size: Size): int32 {.importcpp: "@.w()".}
func `h`*(size: Size): int32 {.importcpp: "@.h()".}
func distanceFrom*(point1: ptr Point, point2: Point): int32 {.importcpp: "LPoint::distanceFrom".}

{.pop.}

func `$`*(point: Point): string {.inline.} =
  '(' & $point.x & ", " & $point.y & ')'

func point*(x, y: int32): Point {.importcpp: "Louvre::LPoint(@);".}
func size*(x, y: int32): Size {.importcpp: "Louvre::LSize(@);".}
  
func toPoint*(vec: Vec2): Point {.inline.} =
  point(vec.x.int32, vec.y.int32)

template toVec*(point: Point): Vec2 =
  vec2(point.x().float32, point.y().float32)

func toSize*(vec: Vec2): Size {.inline.} =
  size(vec.x.int32, vec.y.int32)

template toVec*(point: Size): Vec2 =
  vec2(point.x().float32, point.y().float32)
