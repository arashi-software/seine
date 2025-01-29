{.push header: "<LTransform.h>".}

type
  Transform* {.importcpp: "Louvre::LTransform", pure.} = enum
    Normal
    Rotated90
    Rotated180
    Rotated270
    Flipped
    Flipped90
    Flipped180
    Flipped270

{.pop.}
