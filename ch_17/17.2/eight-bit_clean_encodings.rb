# encoding: ascii-8bit

# Ruby supports a virtual encoding called ASCII-8BIT. 
# Despite the name ASCII in the name, this is really intended to be used on data streams that contain binary data (which is why it has an alias of BINARY}).
# However, you can use this as an encoding for source files.
# If you do, Ruby interprets all characters with codes below 128 as regular ASCII and all other characters as valid constituents of variable names.
# This is basically a neat hack, because it allows you to compile a file written in an encoding you don't know -- the characters with the high-order bit set will be assumed to be printable.

π = 3.14159
puts "π = #{π}"
puts "Size of π = #{'π'.size}"

# This last line of output illustrates why ASCII-8BIT is a dangerous encoding for source files.
# Because it doesn't know to use UTF-8 encoding, the π character looks to Ruby like two separate characters.
