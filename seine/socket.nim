import net, os, logging, strutils, options
import louvre
import pretty
include ../share/parser

proc startIPC*(): Socket =
  # Cleanup (only if they exist)
  removeFile(socketPath)
  removeDir(socketPath)
  # Initialize socket directory
  createDir(socketPath.splitPath().head)

  # Create Socket
  result = newSocket(AF_UNIX, SOCK_STREAM, IPPROTO_IP)
  result.bindUnix(socketPath)
  result.listen()

  # Log info
  info "seine: (ipc) created socket at " & socketPath

proc handleIPC*(msg: string) =
  debug "seine: (ipc) recieved command `$#`" % [msg]
  let opts = parser.parse(msg.split(" "))
  if *opts.exec:
    let ctx = &opts.exec
    launchCommand(ctx.cmd.join(" "))
  elif *opts.bind:
    echo "hi"
  
