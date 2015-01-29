# Sometimes we don't need to be quite so hands-on; we'd like to give the subprocess its assignment and then go about our business. Later, we'll check to see whether it has finished or not.
# For instance, we may want to kick off a long-running external sort:

exec("sort testfile > output.txt") if fork.nil?
# the sort is now running in a child process
# carry on processing in the main program

# ... dum di dum ...

# then wait for the sort to finished
Process.wait

# The call to Object#fork returns a process ID in the parent and returns nil in the child, so the child process will perform the Object#exec call and run sort.
# Later, we issue a Process.wait call, which waits for the sort to complete (and returns its process ID).

# If you would rather be notified when a child exits (instead of just waiting around), you can set up a signal handle using Object#trap (described in the reference on pp 630).
# Here we set up a trap on SIGCLD, which is the signal sent on "death of a child process".
# According to Linux docs, SIGCLD is an alias for SIGCHLD, which means "Child status has changed (POSIX)". 

trap("CLD") do
  pid = Process.wait 
  puts "Child pid #{pid}: terminated"
end

fork { exec("sort testfile > output.txt") }
# Go do other stuff
puts " "

# For more information on using and controlling external processes, se the documentation for Object#open and IO.popen, as well as the section on the Process module on pp 637.
