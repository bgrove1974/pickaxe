#!/usr/bin/ruby

# This is an example of a block using local variables from the surrounding scope.
# Variables in the surrounding scope that are referenced in a block remain accessible for the life of 
# that block and the life of any Proc object created from that block.

def n_times(thing)
   lambda { |n| thing * n }
end

p1 = n_times(23)
puts p1.call(3)  # => 69
puts p1.call(4)  # => 92
p2 = n_times("Hello ")
puts p2.call(3)  # => "Hello Hello Hello" 

# Here is a method that returns a Proc object that returns successive powers of 2 when called:

def power_proc_generator
  value = 1
  lambda { value += value }
end

power_proc = power_proc_generator
puts power_proc.call  # => 2
puts power_proc.call  # => 4
puts power_proc.call  # => 8
