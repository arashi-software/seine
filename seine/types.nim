import global, louvre

type
  SeineT* = object of Compositor
    scene*: Scene

proc state*(): ptr SeineT =
  return get(SeineT, comp)
