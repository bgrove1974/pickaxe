# Ruby has a simple definition of truth. Any value that is not nil or the constant 'false' is true.
# "Cat", 99, 0, and :a_song are all considered true.

# In this book, when we want to talk about a general true or false value, we use regular Roman type: true and false.
# When we want to refer to the actual constants, we write true and false.

# The fact that nil is considered to be false is convenient. For example, IO#gets, which returns the next line from a file, returns nil at the end of the file, enabling you to write loops such as this:

# while line = gets
  # process line
# end

# In Ruby, the number zero is interpreted as a false value, as is a zero-length string. 
