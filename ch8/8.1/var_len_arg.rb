# Placing an asterisk (*) before the name of the parameter after the "normal" params allows you to pass in a variable number of arguments OR capture multiple arguments into a single parameter. AKA "splatting" an argument.

def varargs(arg1, *rest)
  "arg1=#{arg1}. rest=#{rest.inspect}"
end

puts varargs("one")
puts varargs("one", "two")
puts varargs "one", "two", "three"
puts " "

# In the example above, the first argument is assigned to the first method parameter as usual. However, the next parameter is prefixed with an asterisk, so all remaining arguments are bundled into a new Array, which is then assigned to that parameter.

# The splat is sometimes used to specify arguments that are not used by the method but that are perhaps used by the corresponding method in a superclass.

# In this example we call super with no parameters. This is a special case that means, "Invoke this method in the superclass, passing it all the parameters that were given to the original method."

class Child < Object  #  class named Parent throws an error -- uninitialized constant
  def do_something(*not_used)
    # our processing
    super 
  end
end

# In this case, you can also leave off the name of the parameter and just write an asterisk.

class Child < Object
  def do_something(*)
    # our processing
    super 
  end  
end

# You can put the splat argument anywhere in a method's parameter list, allowing you to write this:

def split_apart(first, *splat, last)
  puts "First: #{first.inspect}, splat: #{splat.inspect}, last: #{last.inspect}"
end

split_apart(1,2)
split_apart(1,2,3)
split_apart(1,2,3,4)

# If you cared only about the first and last parameters, you could define this method using this:

# def split_apart(first, *, last)

# You can have only one splat argument in a method -- if you had two, it would be ambiguous. You also can't put arguments with default values after the splat values.
# In all cases, the splat argument receives the values left over after assigning to the regular arguments.
