import net, os, strutils, logging
import colored_logger
import ../seine/share
include ../share/parser

addHandler(newColoredLogger())

if commandLineParams().len == 0:
  error "No command specified"
  quit 1

try:
  parser.run()
  var socket = newSocket(AF_UNIX, SOCK_STREAM, IPPROTO_IP)
  socket.connectUnix(socketPath)
  socket.send(commandLineParams().join(" "))
except UsageError:
  error getCurrentExceptionMsg()
  quit(1)


