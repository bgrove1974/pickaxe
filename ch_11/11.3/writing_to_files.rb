# So far, we've been merrily calling puts and print, passing in any old object and trusting that Ruby will do the right thing.
# But what exactly is it doing?

# The answer is pretty simple. With a couple of exceptions, every object you pass to puts and print is converted to a string by calling that object's to_s method.
# If for some reason the to_s method doesn't return a valid string, a string is created containing the object's class name and ID, something like #<ClassName:0x123456>:

# Note the "w", which opens the file for writing
File.open("output.txt", "w") do |file|
  file.puts "Hello"
  file.puts "1 + 2 = #{1+2}"
end

# Now read the file in and print its contents to STDOUT
puts File.read("output.txt")
puts " "

# The exceptions are simple, too. The nil object will print as an empty string, and an array passed to puts will be written as if each of its elements in turn were passed separately to puts.

# What if you want to write binary data and don't want Ruby messing with it?
# Normally, you can simply use IO#print and pass in a string containing the bytes to be written. However, you can get at the low-level input and output routines if you really want to -- look at the documentation for IO#sysread and IO#syswrite on pp 554.

# How do you get the binary data into a string in the first place?
# The three common ways are to use a literal, poke it in byte by byte, or use Array#pack.
# The pack methd takes an array of data and packs it into a string. See the description in the reference section pp 432.

p str1 = "\001\002\003"
p str2 = ""
p str2 << 1 << 2 << 3 
p [ 1, 2, 3 ].pack("c*")
