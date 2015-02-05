##! The following chunks of code are placed in the same file so that they are easier to keep track of, but when the file is run with the -w warnings enabled flag, the messages are out of order and can be confusing (I have multiple 'Incorrect' classes, etc).
##! For the puposes of clarity and consistency, run each chunk of code in its own file with warnings enabled (-w).


# So, you've read through enough of the book, you start to write your very own Ruby program, and it doesn't work.
# Here is a list of common gotchas and other tips.

# First and foremost, run your scripts with warnings enabled (the -w command line option).

# If you happen to forget a comma in an argument list -- especially to print -- you can produce some very odd error messages.

# An attribute setter is not being called. Within a class definition, Ruby will parse setter= as an assignment to a local variable, not as a method call. Use the form self.setter= to indicate the method call:

class Incorrect
  attr_accessor :one, :two
  def initialize
    one = 1     # incorrect - sets local variable
    self.two = 2
  end
end

obj = Incorrect.new
p obj.one
p obj.two
puts " "

# Objects that don't appear to be properly set up may have been victims of an incorrectly spelled initialize method:

class Incorrect
  attr_reader :answer
  def initialise     # <-- spelling error
    @answer = 42     
  end
end

ultimate = Incorrect.new
p ultimate.answer
puts " "

# The same kind of thing can happen if you misspell the instance variable name:

class Incorrect
  attr_reader :answer
  def initialize
    @anwser = 42     # <-- spelling error
  end
end

ultimate = Incorrect.new
p ultimate.answer
puts " "

# A parse error at the last line of the source often indicates a missing end keyword, sometimes quite a bit earlier.

# This ugly message -- syntax error, unexpected $end, expecting keyword_end -- means that you have an end missing somewhere in your code.
# The $end in the message means end-of-file, so the message simply means that Ruby hit the end of your code before finding all of the end keywords it was expecting.
# Try running with -w, which will warn when it finds ends that aren't aligned with their opening if/while/class.

# As of Ruby 1.9, block parameters are no longer in the same scope as local variables.
# This may be incompatible with older code; run with the -w flag to spot these issues:

entry = "wibble"
[1, 2, 3].each do |entry|
  # do something with entry
end
puts "Last entry = #{entry}"
puts " "

# Watch out for precedence issues, especially when using {...} instead of do...end:

def one(arg)
  if block_given?
    "block given to 'one' returns #{yield}"
  else
    arg
  end
end

def two
  if block_given?
    "block given to 'two' returns #{yield}"
  end
end

result1 = one two {
  "three"
}
result2 = one two do
  "three"
end

puts "With braces, result = #{result1}"
puts "With do/end, result = #{result2}"
puts " "

# Output written to a terminal may be buffered.
# This means that you may not see a message you write immediately.
# In addition, if you write messages to both STDOUT and STDERR, the output may not appear in the order you were expecting.
# Always use nonbuffered I/O (set sync=true) for debug messages.

# If numbers don't come out right, perhaps they are strings.
# Text read from a file will be a String and will not be automatically converted to a number by Ruby.
# A call to Integer will work wonders (and throw an exception if the input isn't a well-formed integer).
# The following is a common mistake Perl programmers make:

#  while line = gets
#    num1, num2 = line.split(/,/)
#    # ...
#  end

# You can rewrite this as follows:

#  while line = gets
#    num1, num2 = line.split(/,/)
#    num1 = Integer(num1)
#    num2 = Integer(num2)
#    # ...
#  end

# Or, you could convert all of the strings using map:

#  while line = gets
#    num1, num2 = line.split(/,/).map {|val| Integer(val) }
#    # ...
#  end

# Unintended aliasing -- if you are using an object as the key of a hash, make sure it doesn't change its hash value (or arrange to call Hash#rehash if it does):

arr = [1, 2]
hash = { arr => "value"}
p hash[arr]
arr[0] = 99
p hash[arr]
p hash.rehash
p hash[arr]
puts " "

# Make sure the class of the object you are using is what you think it is. If in doubt, use puts my_obj.class.

# Make sure your method names start with a lowercase letter and class and constant names start with an uppercase letter.

# If method calls aren't doing what you would expect, make sure you have put parentheses around the arguments.

# Make sure the opening parenthesis of a method's parameter list butts up against the end of the method name with no intervening spaces.

# Use irb and the debugger

# Use Object#freeze. If you suspect that some unknown portion of code is setting a variable to a bogus value, try freezing the variable. The culprit will then be caught during the attempt to modify the variable.

# One major technique makes writing Ruby code both easier and more fun -- develop your applications incrementally.
# Write a few lines of code, and then write tests (perhaps using Test::Unit).
# Write a few more lines of code, and then exercise them.
# One of the major benefits of a dynamically typed language is that things don't have to be complete before you use them.
