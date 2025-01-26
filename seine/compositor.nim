import std/[logging]
import louvre

type
  Seine* = object of Compositor
    scene*: Scene

proc initialized(seine: ptr Seine) {.virtual.} =
  info "seine: (compositor) initializing"
  var comp = (ptr Compositor) seine
  comp.initialized()
  launchCommand("wbg /home/licorice/Pictures/balcony.jpg")
  
