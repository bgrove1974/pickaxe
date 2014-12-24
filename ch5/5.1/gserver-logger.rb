# Ruby comes with a library called GServer that implements basic TCP server functionality. You add your own behavior to it by subclassing the GServer class. Let's use that to write some code that waits for a client to connect on a socket and then returns the last few lines of the system log file. This is an example of something that's actually quite useful in long-running applications - by building in such a server, you can access the internal state of the application while it is running (possibly even remotely).
#The GServer class handles all of the mechanics of interfacing to TCP sockets. When you create a GServer object, you tell it the port to listen on. Then, when a client connects, the GServer object calls its serve method to handle that connection. Here's the implementation of that serve method in the GServer class:

# def serve(io)
# end

# As you can see, it does nothing. That's where our own LogServer class comes in:
require 'gserver'

class LogServer < GServer
  def initialize
    super(12345) # We want our log server to run on TCP port 12345
  end
# When you invoke super, Ruby sends a message to the parent of the current object, asking it to invoke a method of the same name as the method invoking super. It passes this method the parameters that were passed to super.
# By the time our initialize method finishes, out LogServer object will be a full-fledged TCP server, all without us having to write any protocol-level code.
  def serve(client)
    client.puts get_end_of_log_file
  end
# Our server receives connections from external clients. These invoke the serve method in the server object.
private

  def get_end_of_log_file
    File.open("/var/log/system.log") do |log|
      log.seek(-500, IO::SEEK_END)      # back up 500 characters from the end
      log.gets                          # ignore partial line
      log.read                          # and return the rest
    end
  end
end

server = LogServer.new
server.start.join

# $ telnet 127.0.0.1 12345
