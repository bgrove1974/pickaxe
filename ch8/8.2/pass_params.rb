# Any parameters follow the method name. If no ambiguity exists, you can omit the parentheses around the argument list when calling a method. Method calls without parentheses are sometimes called commands.
# However, except in the simplest cases, omitting the parentheses around the argument list when calling a method is not recommended. For example, you must use parentheses on a method call that is itself a parameter to another method call, unless it is the last parameter. So, if there is any doubt, just use the parentheses.
# An example:

# For some suitable value in obj:
# a = obj.hash    # Same as 
# a = obj.hash()  # this

# obj.some_method "Arg1", arg2, arg3   # Same thing as 
# obj.some_method("Arg1", arg2, arg3)  # with parentheses

# Older Ruby versions compounded the problem by allowing you to put spaces between the method name and the opening parenthesis. This made it hard to parse; is the parenthesis the start of the parameters or the start of an expression? As of Ruby 1.8, you get a warning if you put a space between a method name and an open parenthesis.
