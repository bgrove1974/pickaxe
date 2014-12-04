#!/usr/bin/ruby

# A Ruby iterator is a method that can invoke a block of code.
# Within the method, the block may be invoked, almost as if it were a method itself,
# using the 'yield' statement. Whenever a yield is executed, it invokes the code in the
# block. when the block exits, control picks back up immediately after the yield call.

def two_times
  yield
  yield
end
two_times { puts "Hello" }

# We can pass parameters to blocks and receive values from them.
# This is a function that returns members of the Fibonacci sequence up to a certain value:

def fib_up_to(max)
  i1, i2 = 1, 1    # parallel assignment (i1 = 1 and i2 = 1)
  while i1 <= max
    yield i1
    i1, i2 = i2, i1 + i2
  end
end
fib_up_to(1000) { |f| print f, " " }
puts

# In this example, the yield statement has a parameter. This value is passed to the associated
# block. In the definition of the block, the argument list appears between vertical bars. In this
# instance, the variable f receives the value passed to yield, so the block prints successive
# members of the series. Although it is common to pass just one value to a block, this is not a 
# requirement; a block may have any number of arguments.
