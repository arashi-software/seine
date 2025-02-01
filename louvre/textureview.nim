import texture, view, point

{.push header: "<LTextureView.h>".}

type TextureView* {.importcpp: "Louvre::LTextureView".} = object

proc newTextureView*(texture: ptr Texture): TextureView {.importcpp: "new LTextureView(@)", constructor.}
proc `pos=`*(tv: ptr TextureView, pos: Point) {.importcpp: "Louvre::LTextureView::setPos".}
proc `dstSize=`*(tv: ptr TextureView, size: Size) {.importcpp: "Louvre::LTextureView::setDstSize".}

{.pop.}
