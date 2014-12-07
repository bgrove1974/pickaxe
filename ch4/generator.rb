#!/usr/bin/ruby

# An example of an enumerator that can generate an infinite sequence.

triangular_numbers = Enumerator.new do |yielder|
  number = 0
  count = 1
  loop do
    number += count
    count  += 1
    yielder.yield number
  end
end

5.times { print triangular_numbers.next, " " }
puts  # => 1 3 6 10 15

# Enumerator objects are also enumerable.
# This means that we can use Enumerable's methods (such as first) on them.

triangular_numbers = Enumerator.new do |yielder|
  number = 0
  count = 1
  loop do
    number += count
    count  += 1
    yielder.yield number
  end
end

p triangular_numbers.first(5)  # => [1, 3, 6, 10, 15]

# Be careful with enumerators that can generate infinite sequences!!
# Methods such as count and select will try to read the whole enumeration before returning a result.

# This version gets passed an enumerator and a block and returns a new enumerator containing values from
# the original for which the block returns true.
# Read the previous sentence again carefully.


triangular_numbers = Enumerator.new do |yielder|
  number = 0
  count = 1
  loop do
    number += count
    count  += 1
    yielder.yield number
  end
end

# This code returns triangular numbers that are multiples of 10.

def infinite_select(enum, &block)
  Enumerator.new do |yielder|
    enum.each do |value|
      yielder.yield(value) if block.call(value)
    end
  end
end

p infinite_select(triangular_numbers) { |val| val % 10 == 0}.first(5)  # => [10, 120, 190, 210, 300]

# This example returns the first five triangular numbers that are multiples of 10 and that have the digit 3 in them.

triangular_numbers = Enumerator.new do |yielder|
  number = 0
  count = 1
  loop do
    number += count
    count  += 1
    yielder.yield number
  end
end

class Enumerator
  def infinite_select(&block)
    Enumerator.new do |yielder|
      self.each do |value|
        yielder.yield(value) if block.call(value)
      end
    end
  end
end

p triangular_numbers
    .infinite_select { |val| val % 10 == 0 }
    .infinite_select { |val| val.to_s =~ /3/ }  # =~ returns the position in the string that matches, or nil if no match
    .first(5)
# => [300, 630, 1830, 3160, 3240]
