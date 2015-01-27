# Fibers let you suspend execution of one part of your program and run some other part. Basically they are a means of creating code blocks that can be paused and resumed, much like threads.
# Although the name suggests some kind of lightweight thread, Ruby's fibers are really just a very simple coroutine mechanism.
# Fibers let you write programs that look like you are using threads without incurring any of the complexity inherent in threading.
# Let's look at a simple example. We'd like to analyze a text file, counting the occurrence of each word. We could do this, without using fibers, in a simple loop:

counts = Hash.new(0)
File.foreach("testfile") do |line|
  line.scan(/\w+/) do |word|
    word = word.downcase
    counts[word] += 1
  end
end
counts.keys.sort.each {|k| print "#{k}:#{counts[k]} "}
puts " "

# However, this code is messy -- it mixes word finding with word counting. We could fix this by writing a method that reads the file and yields each successive word, but fibers give us a simpler solution:

words = Fiber.new do
  File.foreach("testfile") do |line|
    line.scan(/\w+/) do |word|
      Fiber.yield word.downcase
    end
  end
  nil 
end

counts = Hash.new(0)
while word = words.resume
  counts[word] += 1
end
counts.keys.sort.each {|k| print "#{k}:#{counts[k]} "}
puts " "

# Here's the play-by-play:

# The constructor for the Fiber class takes a block and returns a fiber object. For now, the code is not executed.
# Subsequently, we can call resume on the fiber object. This causes the block to start execution. The file is opened, and the scan method starts extracting individual words. 
# However, at this point, Fiber.yield is invoked. This suspends execution of the block -- the resume method that we called to run the block returns any value given to Fiber.yield.

# Our main program enters the body of the loop and increments the count for the first word returned by the fiber.
# It then loops back up to the top of the while loop, which again calls words.resume while evaluating the condition.
# The resume call goes back into the block, continuing just after it left off (at the line after the Fiber.yield call).

# When the fiber runs out of words in the file, the foreach block exits, and the code in the fiber terminates.
# Just as with a method, the return value of a fiber will be the value of the last expression evaluated (in this case the nil).
# In fact, the nil is not strictly needed, as foreach will return nil when it terminates. The nil just makes it explicit.
# The next time resume is called, it returns this value nil. You will get a FiberError if you attempt to call resume again after this.

# Fibers are often used to generate values from infinite sequences on demand.
# Here's a fiber that returns successive integers divisible by 2 and not divisible by 3:

twos = Fiber.new do
    num = 2 
    loop do
      Fiber.yield(num) unless num % 3 == 0
      num += 2  
    end 
end
10.times { print twos.resume, " " }
puts " "

# Because fibers are just objects, you can pass them around, store them in variables, and so on.
# Fibers can be resumed only in the thread that created them.

# Ruby 2.0 adds a new twist to this -- you can now use lazy enumerators to gracefully handle infinite lists. These are described in 'Lazy Enumerators in Ruby 2' on pp 61.
