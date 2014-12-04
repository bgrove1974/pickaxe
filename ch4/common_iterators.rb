#!/usr/bin/ruby

# Some iterators are common to many types of Ruby collections.
# Let's look at three: each, collect, and find.

# 'Each' is probably the simplest iterator -- all it does is yield successive elements of its collection

[ 1, 3, 5, 7, 9 ].each { |i| puts i }

# A block may also return a value to the method. The value of the last expression evaluated in
# the block is passed back to the method as the value of the yield. This is how the find method
# used by the class Array works. The find method is defined in the module Enumerable, which is 
# mixed into the class Array.
# Its implementation would look something like the following:

class Array
  def find
    each do |value|
      return value if yield(value)
    end
    nil
  end
end
puts [1, 3, 5, 7, 9].find { |v| v*v > 30 }

# This uses each to pass successive elements of the array to the associated block. If the block
# returns true, the method returns the corresponding element. If no element matches, the method
# returns nil.

# Another common iterator is collect (also known as map), which takes each element from the collection
# and passes it to the block. The results returned by the block are used to construct a new array.
# The following example uses the succ method, which increments a string value:

puts ["H", "A", "L"].collect { |x| x.succ }

# Iterators are not limited to accessing existing data in arrays and hashes. An iterator can return 
# derived values. This capability is used by Ruby's input and output classes, which implement an iterator
# interface that returns succesive lines (or bytes) in an I\O stream:

# f = File.open("testfile")
# f.each do |line|
#   puts "The line is: #{line}"
# end
# f.close

## The output is:
# The line is: This is line one
# The line is: This is line two
# The line is: This is line three
## and so on.

# The with-index method can be used to keep track of how many times you have been through the block:

# f = File.open("testfile")
# f.each.with_index do |line, index|
#   puts "Line #{index} is: #{line}"
# end
# f.close

## The output is:
# Line 0 is: This is line one
# Line 1 is: This is line two
# Line 3 is: This is line three
## and so on.

# The inject method lets you accumulate a value across the members of a collection.
# For example, you can sum all the elements in an array and find their product using code suc as this:

puts [1, 3, 5, 7].inject(0) { |sum, element| sum + element }
puts [1, 3, 5, 7].inject(1) { |product, element| product * element }

# These also work:

puts [1, 3, 5, 7].inject { |sum, element| sum + element }
puts [1, 3, 5, 7].inject { |product, element| product * element }

# We can also give inject the name of the method we want to apply, using symbols in this case:

puts [1, 3, 5, 7].inject(:+)
puts [1, 3, 5, 7].inject(:*)
