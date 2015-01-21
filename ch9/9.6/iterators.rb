# Ruby has pretty primitive built-in looping constructs. Ruby doesn't need any sophisticated built-in loops, because all of the fun stuff is implemented using Ruby iterators.
# For example, Ruby doesn't have a for loop -- at least not the kind that iterates over a range of numbers. Instead, Ruby uses methods defined in various built-in classes to provide equivalent, but less error-prone, functionality.

3.times do
  print "Ho! " 
end
puts " "

# It's easy to avoid fence-post and off-by-one errors; this loop will execute three times, period.
# In addition to times, integers can loop over specific ranges by calling downto and upto, and all numbers can loop using step.
# For instance, a traditional "for" loop that runs from 0 to 9 (something like for(i=0; i < 10; i++)) is written as follows:

0.upto(9) do |x|
  print x, " "
end
puts " "

# A loop from 0 to 12 by 3 can be written as follows:

0.step(12, 3) {|x| print x, " " }
puts " "

# Similarly, iterating over arrays and other containers is easy if you use their each method:

[ 1, 1, 2, 3, 5 ].each {|val| print val, " " }
puts " "

# Once a class supports the each method, the additional methods in the Enumerable module become available (see pp 466).
# For example, the File class provide an each method, which returns each line in a file in turn. Using the grep method in Enumerable, we could iterate over only those lines that end with a d:

File.open("ordinal").grep(/d$/) do |line|
  puts line 
end
puts " "

# Last, and probably least, is the most basic loop of all. Ruby provides a built-in iterator called loop.

# loop do
#   block ... 
# end

# The loop iterator calls the associated block forever (or at least until you break out of the loop).
 