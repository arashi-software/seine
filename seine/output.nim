import std/[logging]
import louvre, share, tree, global

type
  SeineOut* {.codegenDecl: FactoryDerivation, exportc.} = object of Output
    workspaces*: seq[Tree]

proc setWallpaper*(output: ptr Output, path: string) =
  var background = newTextureView(loadTexture(newPath(path)[]))
  background.addr().pos = output[].pos
  background.addr().dstSize = output[].size
  # TODO: Implement rest of wallpaper setting

proc newOutput*(params: pointer): ptr SeineOut {.importcpp: "new SeineOut(@)".}

proc initializeGL*(output: ptr SeineOut) {.virtual.} =
  debug "seine: (output) initializing OpenGL (dispatching call to scene)"
  share.scene.handleInitializeGL(output)
  cast[ptr Output](output).initializeGL()

proc moveGL*(output: ptr SeineOut) {.virtual.} =
  debug "seine: (output) moveGL (dispatching call to scene)"
  share.scene.handleMoveGL(output)
  cast[ptr Output](output).moveGL()

proc paintGL*(output: ptr SeineOut) {.virtual.} =
  debug "seine: (output) paintGL (dispatching call to scene)"
  share.scene.handlePaintGL(output)
  cast[ptr Output](output).paintGL()

proc uninitializeGL*(output: ptr SeineOut) {.virtual.} =
  debug "seine: (output) uninitializing OpenGL (dispatching call to scene)"
  share.scene.handleUninitializeGL(output)
  cast[ptr Output](output).uninitializeGL()
