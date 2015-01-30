# IO.popen works with a block in pretty much the same way as File.open does.
# If you pass it a command, such as date, the block will be passed an IO object as a parameter:

IO.popen("date") {|f| puts "Date is #{f.gets}" }

# The IO object will be closed automatically when the code block exits, just as it is with File.open.

# If you associate a block with fork, the code in the block will be run in a Ruby subprocess, and the parent will continue after the block:

fork do
  puts "In child, pid = #$$"
  exit 99
end
pid = Process.wait 
puts "Child terminated, pid = #{pid}, status = #{$?.exitstatus}"

# $? is a global variable that contains information on the termination of a subprocess.
# See the section on Process::Status on pp 644 for more information.
