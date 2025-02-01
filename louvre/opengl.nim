import files, texture

{.push header: "<LOpenGL.h>".}

proc loadTexture*(path: Path): ptr Texture {.importcpp: "Louvre::LOpenGL::loadTexture(@)".}

{.pop.}
