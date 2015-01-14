# Every method you call returns a value (although there's no rule that says you have to use that value).
# The value of a method is the value of the last statement executed by the method.

def meth_one
  "one"   
end

puts meth_one
puts " "

def meth_two(arg)
  case 
  when arg > 0 then "positive"
  when arg < 0 then "negative"
  else              "zero"
  end   
end

puts meth_two(23)
puts meth_two(0) 
puts " "

# Ruby has a return statement, which exits from the currently executing method. The value of a return is the value of its argument(s). It is idiomatic Ruby to omit the return if it isn't needed, as shown by the previous two examples.

# The next example uses return to exit from a loop inside the method:

def meth_three
  100.times do |num|
    square = num * num
    return num, square if square > 1000
  end   
end

p meth_three
puts " "

# As the last case illustrates, if you give return multiple parameters, the method returns them in an array.
# Note -- The command p meth_three returns the array, while puts meth_three returns the answers as strings on two separate lines.

# You can use parallel assignment to collect this return value:

num, square = meth_three
puts num     # returns same as p num
puts square  # returns same as p square
