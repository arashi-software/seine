# Package

version       = "0.1.0"
author        = "Licorice"
description   = "(WIP) A preformant bsp-like tiling wayland compositor"
license       = "GPL-3.0-or-later"
srcDir        = "."
backend       = "cpp"
namedBin      = {
                  "seine/main": "bin/seine",
                  "seinec/main": "bin/seinec"
                }.toTable()


# Dependencies

requires "nim >= 2.0.0"
requires "cppstl >= 0.7.0"
requires "colored_logger >= 0.1.0"
requires "pretty >= 0.2.0"

requires "https://github.com/yummy-licorice/xkb-nim >= 0.1.0"

requires "vmath >= 2.0.0"
requires "yaml >= 2.1.1"

requires "argparse >= 4.0.2"
