# So far, we've been on the defensive, handling exceptions raised by others. It's time to turn the tables and go on the offensive. 
# You can raise exceptions in your code with the Object#raise method (or its somewhat judgmental synonym, Object#fail).

# Running the following exceptions in the IRB gives me "Maybe IRB bug!"

raise 
raise "bad mp3 encoding"
raise InterfaceException, "Keyboard failure", caller

# The first form simply reraises the current exception (or a Runtime Error if there is no current exception).
# This is used in exception handlers that intercept an exception before passing it on.

# The second form creates a new RuntimeError exception, setting its message to the given string.
# This exception is then raised up the call stack.

# The third form uses the first argument to create an exception and then sets the associated message to the second argument and the stack trace to the third argument.
# Typically the first argument will be either the name of a class in the Exception hierarchy or a reference to an instance of one of these classes. Technically, this argument can be any object that responds to the message exception by returning an object such that object.kind_of?(Exception) is true.
# The stack trace is normally produced using the Object#caller method.

# Here are some typical examples of raise in action:

raise 

raise "Missing name" if name.nil?

if i >= names.size
  raise IndexError, "#{i} >= size (#{names.size})"
end

raise ArgumentError, "Name too big", caller

# In the last example, we remove the current routine from the stack backtrace, which is often useful in library modules. We do this using the caller method, which returns the current stack trace.
# We can take this further; the following code removes two routines from the backtrace by passing only a subset of the call stack to the new exception:

raise ArgumentError, "Name too big", caller[1..-1]