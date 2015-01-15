# Code two swap the values in two variables in another language like C, Java, or ...

# int a = 1;
# int b = 2;
# int temp;

# temp = a;
# a = b;
# b = temp;

# You can swap variables much more cleanly with Ruby:

a, b = 1, 2
puts a,b 
a, b = b, a
puts a,b
puts " "

# Ruby lets you have a comma-separated list of rvalues (the things on the right of the assignment). Once Ruby sees more than one rvalue in an assignment, the rules of parallel assignment come into play. What follows is a description at the logical level: what happens inside the interpreter is somewhat hairier. Users of older versions of Ruby should note that these rules have changed in Ruby 1.9.

# First, all of the rvalues are evaluated, left to right, and collected into an array (unless they are already an array).
# This array will be the eventual value returned by the overall assignment.
# Next, the left side (lhs) is inspected. If it contains a single element, the array is assigned to that element.

a = 1,2,3,4    # a=[1,2,3,4]
b = [1,2,3,4]  # b=[1,2,3,4]

# If the lhs contains a comma, Ruby matches values on the rhs against successive elements on the lhs. Excess elements are discarded.

a, b = 1,2,3,4  # a=1, b=2
c,   = 1,2,3,4  # c=1
p a,b,c
puts a
puts b 
puts c 
