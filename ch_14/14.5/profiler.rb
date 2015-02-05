# Ruby comes with a code profiler (documented in the library section on pp 791).
# The profiler shows you the number of times each method in the program is called and the average and cumulative time that Ruby spends in those methods.

# You can add profiling to your code using the command line option -r profile of from within the code using require "profile".
# Here's an example:

require 'profile'

count = 0
words = File.open("/usr/share/dict/words")

while word = words.gets
  word = word.chomp!
  if word.length == 12
    count += 1
  end
end

puts "#{count} twelve-character words. Ah, Ah, Ah! (Like the Count from Sesame Street -- get it?)"
puts " "

# The first time we ran this (without profiling) against a dictionary of almost 235,000 words, it took a noticeable amount of time to complete.
# Wondering if we could improve on this, we added the command-line option r-profile and tried again. (I used require 'profile').
# Eventually we saw output that looked like the following:

# Check your console ;)

# The first thing to notice is that the timings shown are a lot slower than when the program runs without the profiler.
# Profiling has a serious overhead, but the assumption is that it applies across the board, and therefore the relative numbers are still meaningful.
# This particular program clearly spends a lot of time in the loop, which executes over 235,000 times and invokes both gets and chomp! each time.
# We could probably improve performance if we could either make the stuff in the loop less expensive or eliminate the loop altogether.
# One way of doing the latter is to read the word list into one long string and then use a pattern to match and extract all twelve character words, which we will do in profiler2.rb.
