# A method is defined using the keyword def. Method names should begin with a lowercase letter or underscore, followed by letters, digits, and underscores.
# If you start a method name with an uppercase letter, Ruby might guess that the method is a constant when called, and as a result it may parse the call incorrectly.
# A method name may end with one of ?, !, or =. Methods that return a boolean result (so-called predicate methods) are often named with a trailing ?.

p 1.even?
p 2.even?
p 1.instance_of?(Fixnum)
puts " "

# Methods that are "dangerous," or that modify their receiver, may be named with a trailing exclamation point (!). These are sometimes called bang methods.
# For instance, class String provides both chop and chop! methods. The first returns a modified string; the second modifies the receiver in place.

# Now that we've specified a name for our new method, we may need to declare some parameters. Parameters are a list of local variable names in parentheses.
# The parentheses around a method's arguments are optional; convention is to use them when a method has arguments and omit them when it doesn't.

def my_new_method(arg1, arg2, arg3)
  # Code for the method goes here   
end

def my_other_new_method   # No arguments
  # Code for the method goes here  
end 

# Ruby lets you specify default values for a method's argument -- values that will be used if the caller doesn't pass them specifically. You can do this using an equal sign (=) followed by a Ruby expression. That expression can include references to previous arguments in the list.

def cool_dude(arg1="Miles", arg2="Coltrane", arg3="Roach")
  "#{arg1}, #{arg2}, #{arg3}."   
end 

p cool_dude
p cool_dude("Bart")
p cool_dude("Bart", "Elwood")
p cool_dude("Bart", "Elwood", "Linus")
puts " "

# Here's an example where the default argument references a previous argument.

def surround(word, pad_width=word.length/2)
  "[" * pad_width + word + "]" * pad_width
end

p surround("elephant")
p surround("fox")
p surround("fox", 10)

# The body of a method contains normal Ruby expressions. The return value of a method is the value of the last expression executed or the argument of an explicit return expression.
