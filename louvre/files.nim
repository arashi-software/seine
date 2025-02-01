# Yeah this isn't really part of the louvre library but I didnt know where else to put it :/
# Really tiny wrapper for std::filesystem::path class

{.push header: "<filesystem>".}

type Path* {.importcpp: "std::filesystem::path".} = object
proc newPath*(path: cstring): ptr Path {.importcpp: "(new std::filesystem::path(@))", constructor.}

{.pop.}
