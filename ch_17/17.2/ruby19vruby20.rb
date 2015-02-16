# encoding: sjis
# RUBY 1.9 VS RUBY 2.0

##! I have had to change the encoding of this file several times in order to get the proper results from the command-line output, as well as comment out code that interferes with the program execution.
##! Check the book starting on pp 242 to see the actual encoding for the successive programs.

# In Ruby 1.9, the default source file encoding is US-ASCII.
# If your source files contain any characters with a byte value greater than 127, you will need to tell Ruby the encoding of the file, or Ruby will report the error, probably saying something like "invalid multibyte char".
# Here's an example where we typed some UTF-8 characters into a Ruby program:

# π = 3.14159
# puts "π = #{π}"
# puts π.to_s.encoding
# puts " "
# With Ruby 1.9, you will get an error unless you add the encoding: utf-8 comment at the top.

# In Ruby 2.0, however, the default source file encoding is UTF-8, and the previous program will run as it stands.

# We can verify that Ruby correctly interprets π as a single character.

# PI = "π"
# puts "The size of a string containing π is #{PI.size}"
# puts PI.encoding
# puts " "

# Now, let's get perverse.
# The two-byte sequence \xcf\x80 represents π in UTF-8 but is not a valid byte sequence in the SJIS encoding.
# Let's see what happens if we tell Ruby that this same source file is SJIS encoded.
# Remember, when we do this, we're not changing the actual bytes in the string -- we're just telling Ruby to interpret them with a different set of encoding rules.
 
PI = "π"
puts "The size of a string containing π is #{PI.size}"
puts PI.encoding
puts " "

# This time, Ruby complains because the file contains byte sequences that are illegal in the given encoding.
# And, to make matters even more confusing, the parser swallowed up the double quote after the π character in line 31, presumably while trying to build a valid SJIS character.
# This led to the second error message, because the word 'The' is now interpreted as program text.
