# WRITING TO ENVIRONMENT VARIABLES

# A Ruby program may write to the ENV object.
# On most systems, this changes the values of the corresponding environment variables.
# However, this change is local to the process that makes it and to any subsequently spawned child processes.
# This inheritance of environment variables is illustrated in the code that follows.
# A subprocess changes an environment variable, and this change is inherited by a process that it then starts.
# However, the change is not visible to the original parent.

puts "In parent, term = #{ENV['TERM']}"
fork do
  puts "Start of child 1, term = #{ENV['TERM']}"
  ENV['TERM'] = "ansi"
  fork do
    puts "Start of child 2, term = #{ENV['TERM']}"
  end
  Process.wait
  puts "End of child 1, term = #{ENV['TERM']}"
end
Process.wait
puts "Back in parent, term = #{ENV['TERM']}"

# Setting an environment variable's value to nil removes the variable from the environment.
