import std/[os, logging, selectors, net]
import colored_logger
import cppstl/std_smartptrs
import louvre, socket
import compositor

proc main {.inline.} =
  # Set some environment variables
  when not defined(release): putEnv("LOUVRE_DEBUG", "4")
  putEnv("LOUVRE_WAYLAND_DISPLAY", "wayland-2")
  putEnv("XDG_CURRENT_DESKTOP", "gogh")
  putEnv("XDG_SESSION_TYPE", "wayland")
  putEnv("GDK_BACKEND", "wayland")
  putEnv("SDL_VIDEODRIVER", "wayland")

  # Initialize logger
  addHandler(newColoredLogger())

  # Start the command launching daemon
  startLaunchDaemon("seine")

  # Create compositor object
  var seine = makeUnique(Seine)

  # Make sure it starts
  if not seine.start():
    error "Could not start compositor..."
    quit 1

  # Polling events
  let
    selector = newSelector[pointer]()
    compFd = seine.getFd()
    socket = startIPC()
    socketFd = socket.getFd().int

  # Register file event listeners
  selector.registerHandle(compFd, {Read}, nil)
  selector.registerHandle(socketFd, {Read}, nil)

  # Main loop
  while seine.getState() != CompositorState.Uninitialized:
    for event in selector.select(-1):
      if event.fd == socketFd:
        var client: Socket
        try:
          socket.accept(client, flags = {})
          let received = client.recv(MaxLineLength)
          client.close()
          handleIPC(received)
        except:
          error getCurrentExceptionMsg()
      else:
        seine.processLoop(50)

  # Kill launcher daemon on exit
  stopLaunchDaemon()

when isMainModule: main()
