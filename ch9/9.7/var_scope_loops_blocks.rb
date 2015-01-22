# The while, until, and for loops are built into the language and do not introduce new scope.
# Previously existing locals can be used in the loop, and any new locals created will be available afterward.

# The scoping rules for blocks (such as those used by loop and each) are different. Normally, the local variables created in these blocks are not accessible outside the block.

# [ 1, 2, 3 ].each do |x|
#   y = x + 1
# end
# p [ x, y ]  # throws undefined local variable or method error

# However, if at the time the block executes a local variable already exists with the same name as that of a variable in the block, the existing local variable will be used in the block. Its value will therefore be available after the block finishes.
# As the following example shows, this applies to normal variables in the block but not to the block's parameters:

x = "initial value"
y = "another value"
[ 1, 2, 3 ].each do |x|
  y = x + 1
end
p [ x, y ]
puts " "

# Note that the assignment to the variable doesn't have to be executed; the Ruby interpreter just needs to have seen that the variable exists on the left side of an assignment:

a = "never used" if false
[99].each do |i|
  a = i     # this sets the variable in the outer scope
end
p a 
puts " "

# You can list block-local variables in the block's parameter list, preceded by a semicolon.
# Contrast this code, which does not use block locals:

square = "yes"
total = 0

[ 1, 2, 3 ].each do |val|
  square = val * val 
  total += square
end

puts "Total = #{total}, square = #{square}"
puts " "

# with the following code, which uses a block-local variable, so square in the outer scope is not affected by a variable of the same name within the block:

square = "yes"
total = 0

[ 1, 2, 3 ].each do |val; square|
  square = val * val 
  total += square
end

puts "Total = #{total}, square = #{square}"
puts " "

# If you are concerned about the scoping of variables with blocks, turn on Ruby warnings, and declare your block-local variables explicitly.
