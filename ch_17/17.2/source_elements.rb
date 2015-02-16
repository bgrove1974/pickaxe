# encoding: utf-8     (this is also known as a magic comment)

# SOURCE ELEMENTS THAT HAVE ENCODINGS

# String literals are always encoded using the encoding of the source file that contains them, regardless of the content of the string:

def show_encoding(str)
  puts "'#{str}' (size #{str.size}) is #{str.encoding.name}"
end
puts show_encoding "cat"    # latin 'c', 'a', 't'
puts show_encoding "∂og"    # greek delta, latin 'o', 'g'
puts " "

# Symbols and regular expression literals that contain only 7-bit characters are encoded using US-ASCII.
# Otherwise, they will have the encoding of the file that contains them.

def show_encoding2(str)
  puts "#{str.inspect} is #{str.encoding.name}"
end
puts show_encoding2 :cat 
puts show_encoding2 :∂og 
puts " "
puts show_encoding2 /cat/ 
puts show_encoding2 /∂og/
puts " "

# You can create arbitrary Unicode characters is strings and regular expressions using the \u escape.
# This has two forms: 
# \uxxxx lets you encode a character using four hex digits, and
# the delimited form \u{x... x... x...} lets you specify a variable number of characters, each with a variable number of hex digits:

puts "Greek pi: \u03c0"
puts "Greek pi: \u{3c0}"
puts "Greek \u{70 69 3a 20 3c0}"
puts " "

# Literals containing a \u sequence will always be encoded UTF-8, regardless of the source file encoding.

# The String#bytes method is a convenient way to inspect the bytes in a string object.
# Notice that in the following code, the 16-bit codepoint is converted to a two-byte UTF-8 encoding:

puts "pi: \u03c0".bytes 
