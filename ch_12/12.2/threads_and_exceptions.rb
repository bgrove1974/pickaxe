# What happens if a thread raises an unhandled exception depends on the setting of the abort_on_exception flag (documented in the reference on pp 702) and on the setting of the interpreter's $DEBUG flag (described in the Ruby options section on pp 210).

# If abort_on_exception is false and the debug flag is not enabled (the default condition), an unhandled exception simply kills the current thread -- all of the rest continue to run. 
# In fact, you don't even hear about the exception until you issue a join on the thread that raised it.
# In the following example, thread 1 blows up and fails to produce any output. However, you can still see the trace from the other threads.

threads = 4.times.map do |number|
  Thread.new(number) do |i|
    raise "Boom!" if i == 1
    print "#{i}\n"  
  end
end
puts "Waiting"
sleep 0.1
puts "Done"
puts " "

# You normally don't sleep waiting for threads to terminate -- you would use join. If you join to a thread that has raised an exception, then that exception will be raised in the thread that does the joining:

threads = 4.times.map do |number|
  Thread.new(number) do |i|
    raise "Boom!" if i == 1
    print "#{i}\n"
  end
end

puts "Waiting"
threads.each do |t|
  begin
    t.join 
  rescue RuntimeError => e
    puts "Failed: #{e.message}"
  end
end
puts "Done"
puts " "

# However, set abort_on_exception to true or use -d to turn on the debug flag, and an unhandled exception kills the main thread, so the message Done never appears. This is different from Ruby 1.8, where the exception killed all running threads.

Thread.abort_on_exception = true
threads = 4.times.map do |number|
  Thread.new(number) do |i|
    raise "Boom!" if i == 1
    print "#{i}\n"
  end
end
puts "Waiting"
threads.each {|t| t.join }
puts "Done"
puts " "
