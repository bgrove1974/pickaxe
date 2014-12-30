# Integers support several iterators, including x.times, upto and downto for iterating up and down between two integers, and the step method.

3.times         { print "X" }
1.upto(5)       { |i| print i, " " }
99.downto(95)   { |i| print i, " " }
50.step(80, 5)  { |i| print i, " " }
puts " "  # separate the above sequence from the code in line 11

# As with other iterators, if you leave the block off, the call returns an Enumerator object:

10.downto(7).with_index  { |num, index| puts "#{index}: #{num}" }
