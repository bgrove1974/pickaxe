#!/usr/bin/ruby

# Building on the code in lazy_enumerator.rb, let's find multiples of 3 whose
# string representations are palindromes.

def Integer.all
  Enumerator.new do |yielder, n: 0|
    loop { yielder.yield(n += 1) }
  end.lazy
end

def palindrome?(n)
  n = n.to_s
  n == n.reverse
end

p Integer
        .all
        .select { |i| (i % 3).zero? }
        .select { |i| palindrome?(i) }
        .first(10)
# => [3, 6, 9, 33, 66, 99, 111, 141, 171, 222]

# Remember, lazy filter methods simply return new Enumerator objects.
# Let's split up the previous code.

multiple_of_three = Integer
        .all
        .select { |i| (i % 3).zero? }

p multiple_of_three.first(10)
# => [3, 6, 9, 12, 15, 18, 21, 24, 27, 30]

m3_palindrome = multiple_of_three
        .select { |i| palindrome?(i) }

p m3_palindrome.first(10)
# => [3, 6, 9, 33, 66, 99, 111, 141, 171, 222]

# We can also code up the various predicates as free-standing procs.

multiple_of_three = -> n { (n % 3).zero? }
palindrome        = -> n { n = n.to_s; n == n.reverse }

p Integer
        .all
        .select(&multiple_of_three)
        .select(&palindrome)
        .first(10)
# => [3, 6, 9, 33, 66, 99, 111, 141, 171, 222]
