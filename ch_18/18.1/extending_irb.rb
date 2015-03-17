# Because the things you type into irb are interpreted as Ruby code, you can effectively extend irb by defining new top-level methods.
# For example, you may want to time how long certain things take.
# You can use the measure method in the Benchmark library to do this, but it's more convenient to wrap this in a helper method.

# Add the following to your .irbrc file:

def time(&block)
  require 'benchmark'
  result = nil
  timing = Benchmark.measure do
    result = block.()
  end
  puts "It took: #{timing}"
  result
end

# The next time you start irb, you will be able to use this method to get timings.

#!# The following is from the book, because I am not messing with my .irbrc file unless I have a good reason.

# ruby 2.0 > time { 1_000_000.times { "cat".upcase } }
# It took:  0.320000  0.000000  0.320000  (  0.323104)
# => 1000000
