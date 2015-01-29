# You have several ways to spawn a separate process; the easiest is to run some command and wait for it to complete.
# You may find yourself doing this to run some separate command or retreive data from the host system.
# Ruby does this for you with the system and backquote (backtick) methods:

# system("tar xzf test.tgz")  # => true
# `date`                      # => "Thu Jan 29 05:27:45 PST 2015\n"

# The method Object#system executes the given command in a subprocess; it returns true if the comand was found and executed properly.
# It raises an exception if the command cannot be found.
# It returns false if the command ran but returned an error.
# In case of failure, you will find the subprocess's exit code in the global variable $?.

# One problem with system is that the command's output will simply go to the same destination as your program's output, which may not be what you want.
# To capture the standard output of a subprocess, you can use the backquote characters, as with `date` in the previous example.
# Remember that you may need to use String#chomp to remove the line-ending characters from the result.

# OK, this is fine for simple cases -- we can run some other process and get the return status. But many times we need a bit more control than that.
# We would like to carry on a conversation with the subprocess, possibly sending it data and possibly getting some back. 
# The method IO.popen does just this. The popen method runs a command as a subprocess and connects that subprocess's standard input and standard output to a Ruby IO object.
# Write to the IO object, and the subprocess can read it on standard input.
# Whatever the subprocess writes is available in the Ruby program by reading from the IO object.

# For example, on our systems one of the more useful utilities is pig, a program that reads words from standard input and prints them out in pig latin (or igpay atinlay).
# We can use this when our Ruby programs need to send us output that our five-year-olds shouldn't be able to understand:

# pig = IO.popen("local/util/pig", "w+")
# pig.puts "ice cream after they go to bed"
# pig.close_write
# puts pig.gets

# => iceway eamcray afterway eythey ogay otay edbay

# This example illustrates both the apparent simplicity and the more subtle real-world complexities involved in driving subprocesses through pipes.
# The code certainly looks simple enough: open the pipe, write a phrase, and read back the response. But it turns out that the pig program doesn't flush the output it writes.
# Our original attempt at this example, which had a pig.puts followed by a pig.gets, hung forever. The pig program processed our input, bu its response was never written to the pipe.
# We had to insert the pig.close_write line. This sends and end-of-file to pig's standard input, and the output we're looking for gets flushed as pig terminates.

# popen has one more twist.
# If the commmand you pass it is a single minus sign (-), popen will fork a new Ruby interpreter. Both this and the original interpreter will continue running by returning from the popen.
# The original process will receive an IO object back, and the child will receive nil.
# This works only on operating systems that support the fork(2) call (meaning not Windows).

pipe = IO.popen("-", "w+")
if pipe 
  pipe.puts "Get a job!"
  STDERR.puts "Child says '#{pipe.gets.chomp}'"
else
  STDERR.puts "Dad says '#{gets.chomp}'"
  puts "OK"
end

# As well as the popen method, some platforms support Object#fork, Object#exec, and IO.pipe.
# The filenaming convention of many IO methods and Object#open will also spawn subprocesses if you put a | as the first character of a filename (see the introduction to class IO on pp 536 for details).
# Note that you cannot create pipes using File.new; it's just for files.
