#!/usr/bin/ruby

# A block is a chunk of code enclosed between either braces or the keywords 'do' and 'end'.
# The two forms are identical except for precedence.
# Use braces for blocks that fit on one line, and do/end when a block spans mltiple lines.

some_array.each { |value| puts value * 3 }

sum = 0
other_array.each do |value|
  sum += value
  puts value / sum
end 

# Think of a block as being somewhat like the body of an anonymous method.
# Blocks can appear in Ruby source code only immediately after the invocation of some method.
