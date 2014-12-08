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

# Let's get the first 10 multiples of 3.

p Integer
        .all
        .select { |i| (i % 3).zero? }
        .first(10)
# => [3, 6, 9, 12, 15, 18, 21, 24, 27, 30]

# Without the lazy enumerator, the call to select would effectively never return,
# as select would try to read all of the values from the generator.
# In this case, the lazy version of select only consumes values on demand, and
# the subsequent call to the 'first' method only asks for 10 values.
