#!/usr/bin/ruby

# Ruby has another way of creating Proc objects.
# Instead of this:
# lambda { |params| ... }
# We can wrie this:
# -> params { ... }
# The arrow (->) operator is a 7-bit ASCII representation of the greek lambda character.

# The parameters can be enclosed in optional parentheses.

proc1 = -> arg { puts "In proc1 with #{arg}" }
proc2 = -> arg1, arg2 { puts "In proc2 with #{arg1} and #{arg2}" }
proc3 = ->(arg1, arg2) { puts "In proc3 with #{arg1} and #{arg2}" }

proc1.call "ant"
proc2.call "bee", "cat"
proc3.call "dog", "elk"

# => In proc1 with ant
# => In proc2 with bee and cat 
# => In proc3 with dog and elk 


# The -> form is more compact than using lambda and seems to be in favor when you want to pass
# one or more Proc objects to a method.

def my_if(condition, then_clause, else_clause)
  if condition
    then_clause.call
  else
    else_clause.call
  end
end

5.times do |val|
  my_if val < 2,
        -> { puts "#{val} is small" },
        -> { puts "#{val} is big" }
end

# => 0 is small 
# => 1 is small
# => 2 is big
# => 3 is big
# => 4 is big


# Here is a trivial example of reimplementing a while loop using a method.
# Because the condition is passed as a block, it can be evaluated each time around the loop.

def my_while(cond, &body)
  while cond.call
    body.call
  end
end 

a = 0

my_while -> { a < 3 } do
  puts a 
  a += 1 
end

# => 0
# => 1
# => 2
