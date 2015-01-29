## The following code is giving me some headaches. The lines where I call 'ensure rate_mutex.unlock' throw an error, but I'm not sure where I should put the keyword 'end'. According to the books errata page, an ensure clause should be inside a begin..end block. Oh, well.

# Sometimes you want to claim a lock if a mutex is currently unlocked, but you don't want to suspend the current thread if it isn't.
# The Mutex#try_lock method takes the lock if it can, but returns false if the lock is already taken.

# The following code illustrates a hypothetical currency converter.
# The ExchangeRates class caches rates from an online feed, and a background thread updates that cache once an hour.
# This update takes a minute or so. In the main thread, we interact with our user.
# However, rather than just go dead if we can't claim the mutex that protects the rate object, we use try_lock and print a status message if the update is in process.

rate_mutex = Mutex.new 
exchange_rates = ExchangeRates.new 
exchange_rates.update_from_online_feed 

Thread.new do
  loop do
    sleep 3600
    rate_mutex.synchronize do
      exchange_rates.update_from_online_feed
    end
  end
end

loop do
  print "Enter currency code and amount: "
  line = gets
  if rate_mutex.try_lock
    puts(exchange_rates.convert(line)) ensure rate_mutex.unlock
  else
    puts "Sorry, rates being updated. Try again in a minute"
  end
end

# If you are holding the lock on a mutex and you want to temporarily unlock it, allowing others to use it, you can call Mutex#sleep. We could use this to rewrite the previous example:

rate_mutex = Mutex.new 
exchange_rates = ExchangeRates.new 
exchange_rates.update_from_online_feed

Thread.new do
  rate_mutex.lock 
  loop do
    rate_mutex.sleep 3600
    exchange_rates.update_from_online_feed
  end
end

loop do
  print "Enter currency code and amount: "
  line = gets
  if rate_mutex.try_lock
    puts(exchange_rates.convert(line)) ensure rate_mutex.unlock 
  else
    puts "Sorry, rates being updated. Try again in a minute"
  end
end

## QUEUES AND CONDITION VARIABLES

# Most of the examples in this chapter use the Mutex class for synchronization. However, Ruby comes with another library that is particularly useful when you need to synchronize work between producers and consumers.
# The Queue class, located in the Thread library, implements a thread-safe queueing mechanism.
# Multiple threads can add and remove objects from each queue, and each addition and removal is guaranteed to be atomic.
# For an example, see the description of the thread library on pp 813.

# A condition variable is a controlled way of communicating an event or a condition between two threads.
# One thread can wait on the condition, and the other can signal it.
# The thread library extends threads with condition variables. Again, see the Monitor library for an example.

