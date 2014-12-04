#!/usr/bin/ruby

# This example sums the squares of the numbers in an array.

sum = 0
[1, 2, 3, 4].each do |value|
  square = value * value
  sum   += square 
end
puts sum 

# Notice how the variable 'sum' is declared outside the block, updated inside the block, and 
# then passed to 'puts' after the 'each' method returns.
# If a variable appears only inside a block, then that variable is local to the block.

# Parameters to a block are always local to a block, even if they have the same name as locals 
# in the surrounding scope.

value = "some shape"
[ 1, 2 ].each { |value| puts value }
puts value

# We can define block-local variables by putting them after a semicolon in the block's parameter list.

sum = 0
square = "some shape"
[1, 2, 3, 4].each do |value; square|
  square = value * value  # this is a different variable
  sum   += square
end 
puts sum 
puts square 

# By making 'square' block-local, values assigned inside the block will not affect the value of the
# variable with the same name in the outer scope.
 