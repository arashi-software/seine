import argparse

var parser* = newParser:
  command("exec"):
    help("Safely execute a shell command")
    arg("cmd", nargs= -1, help="The command to execute")
  command("bind"):
    help("Create a keybinding")
    arg("keys", help="The keys to press (seperated by `+`)")
    arg("cmd", nargs= -1, help="The command to execute on key press")
    
