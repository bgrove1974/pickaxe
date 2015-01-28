# A thread an normally access any variables that are in scope when the thread is created. Variables local to the block containing the thread code are local to the thread and are not shared. 
# But what if you need per-thread variables that can be accessed by other threads -- including the main thread?
# Class Thread has a facility that allows thread-local variables to be created and accessed by name. You simply treat the thread object as if it were a Hash, writing to elements using []= and reading them back using []. 

# In the example that follows, each thread records the current value of the variable count in a thread-local variable with the key mycount.
# To do this, the code uses the symbol :mycount when indexing thread objects.
# A race condition exists in this code, but we haven't covered synchronization yet, so we'll just quietly ignore it for now.
# A race condition occurs when two or more pieces of code (or hardware) both try to access some shared resource, and the outcome changes depending on the order in which they do so. In the example here, it is possible for one thread to set the value of its mycount variable to count, but before it gets a chance to increment count, the thread gets descheduled and another thread reuses the same value of count. These issues are fixed by synchronizing the access to shared resources (such as the count variable).

count = 0
threads = 10.times.map do |i|
  Thread.new do
    sleep(rand(0.1))
    Thread.current[:mycount] = count
    count += 1
  end
end

threads.each {|t| t.join; print t[:mycount], ", " }
puts "count = #{count}"

# The main thread waits for the subthreads to finish and then prints that thread's value of count. Just to make it interesting, each thread waits for a random time before recording the value.
