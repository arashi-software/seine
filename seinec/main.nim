import net, os, strutils
import ../seine/share
include ../share/parser

# TODO: ERROR CHECKS

try:
  parser.run()
  var socket = newSocket(AF_UNIX, SOCK_STREAM, IPPROTO_IP)
  socket.connectUnix(socketPath)
  socket.send(commandLineParams().join(" "))
except UsageError:
  stderr.writeLine getCurrentExceptionMsg()
  quit(1)


