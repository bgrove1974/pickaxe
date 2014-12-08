#!/usr/bin/ruby

# If we call Enumerator#lazy on any Ruby enumerator, we get back an instance of class
# Enumerator::Lazy. This enumerator acts just like the original, but it reimplements
# methods such as 'select' and 'map' so that they can work with infinite sequences.

# Let's start by adding a helper method to the Integer class that generates
# a stream of integers.

def Integer.all
  Enumerator.new do |yielder, n: 0|
    loop { yielder.yield(n += 1) }
  end.lazy
end

p Integer.all.first(10)
# => [1, 2, 3, 4, 5, 6, 7 ,8, 9, 10]
