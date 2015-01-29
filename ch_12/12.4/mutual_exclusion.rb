# Let's start by looking at a simple example of a race condition -- multiple threads updating a shared variable:

sum = 0
threads = 10.times.map do
  Thread.new do
    100_000.times do
      new_value = sum + 1
      print "#{new_value}     " if new_value % 250_000 == 0
      sum = new_value     
    end
  end
end
threads.each(&:join)
puts "\nsum = #{sum}"
puts " "

## I ran this code multiple times, and only once did I have an instance where the sum was 599999. The rest of the times the 
## output totaled 1000000. Compare these results to the code in the book pp 167.

# We create 10 threads, and each increments the shared sum variable 100,000 times. And yet, when the threads all finish, the final value in sum is considerably less than 1,000,000. Clearly we have a race condition.
# The reason is the print call that sits between the code that calculates the new value and the code that stores it back into sum.
# In one thread, the updated value gets calculated -- let's say that the value of sum is 99,999, so new_value will be 100,000.
# Before storing the new value back into sum, we call print, and that causes another thread to be scheduled (because we're waiting for the I/O to complete). 
# So a second thread also fetches the value of 99,999 and increments it. It stores 100,000 into sum, then loops around again and stores 100,001, and 100,002, and so on.
# Eventually the original thread continues running because it has finished writing its message. It immediately stores its value of 100,000 into the sum, overwriting (and losing) all of the values stored by the other thread(s). 
# We lost data.

# Fortunately, that's easy to fix. We use the built-in class Mutex to create synchronized regions -- areas of code that only one thread may enter at a time.

# Some grade schools coordinate students' access to the bathrooms during class time using a system of bathroom passes. Each room has two passes, one for girls and one for boys. To visit the bathroom, you have to take the appropriate pass with you. If someone else already has that pass, you have to cross your legs and wait for them to return.
# The bathroom pass controls access to the critical resource -- you have to own the pass to use the resource, and only one person can own it at a time.

# A mutex is like the bathroom pass. You create a mutex to control access to a resource and then lock it when you want to use that resource.
# If no one else has it locked, your thread continues to run. If someone else has already locked that particular mutex, your thread suspends (crossing its legs) until they unlock it.

# Here is a version of our counting code that uses a mutex to ensure that only one thread updates the count at a time:

sum = 0
mutex = Mutex.new 
threads = 10.times.map do
  Thread.new do
    100_000.times do
      mutex.lock             #### one at a time, please
      new_value = sum + 1       # 
      print "#{new_value}    " if new_value % 250_000 == 0
      sum = new_value           #
      mutex.unlock           ####
    end
  end
end 

threads.each(&:join)
puts "\nsum = #{sum}"
puts " "

## The second program takes considerably longer to execute than the first.

# This pattern is so common that the Mutex class provides Mutex#synchronize, which locks the mutex, runs the code in a block, and then unlocks the mutex.
# This also ensures that the mutex will get unlocked even if an exception is thrown while it is locked.

sum = 0
mutex = Mutex.new 
threads = 10.times.map do
  Thread.new do
    100_000.times do
      mutex.synchronize do
        new_value = sum + 1
        print "#{new_value}    " if new_value % 250_000 == 0
        sum = new_value
      end
    end
  end
end

threads.each(&:join)
puts "\nsum = #{sum}"
puts " "

## The runtime of the third program is about the same as the second, and the results are identical.
