import std/[logging]
import louvre, share, output, types
import vmath

type
  Seine* = object of SeineT

proc initialized(seine: ptr Seine) {.virtual.} =
  info "seine: (compositor) initializing"
  # Cast to compositor object for louvre
  var comp = (ptr Compositor) seine
  var pos = vec2(0, 0)

  # Set scene shared pointer
  share.scene = addr seine.scene
  
  # Loop over each detected output (usually monitors)
  for output in comp[].getOutputs():
    # If the output is a VR headset enable DRM lease
    if output[].isNonDesktop():
      output.leasable = true
    # If the output DPI is atleast 200 use a scale factor of 2
    output.scale = if output[].dpi >= 200: 2'f else: 1'f
    # Set the compositors transform to the default (none applied)
    output.transform = Normal
    output.position = toPoint pos
    pos = vec2(0, pos.x + float32 output[].size.w)
    output.setWallpaper("/home/licorice/Pictures/washed-flowers.png")
    comp.addOutput(output) 
    output.repaint()

  comp.initialized()
      
proc createObjectRequest(compositor: ptr Seine, objectType: FactoryObjectType, params: pointer): ptr FactoryObject {.virtual.} =
  if objectType == LOutput:
    debug "seine: (factory) got newOutput event"
    return newOutput(params)
