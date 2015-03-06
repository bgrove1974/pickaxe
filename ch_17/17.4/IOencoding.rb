# Playing around with encodings within a program is all very well, but in most code we'll want to read data from and write data to external files.
# And, often, that data will be in a particular encoding.
# Ruby's I/O objects support both encoding and transcoding of data.
# What does this mean?

# Every I/O object has an associated external encoding.
# This is the encoding of the data being read from or written to.
# Through a piece of magic I'll describe later on pp 248, all Ruby programs run with the concept of a default external encoding.
# This is the external encoding that will be used by I/O objects unless you override it when you crete the object (for example, by opening a file).

# Now, your program may want to operate internally in a different encoding.
# For example, some of my files may be encoded with ISO-8859-1, but we want our Ruby program to work internally using UTF-8.
# Ruby I/O objects manage this by having an optional associated internal encoding.
# If set, then input will be transcoded from the external to the internal encodings on read operations, and output will be transcoded from internal to external encoding on write operations.

# Let's start with the simple cases.
# On our OSX box, the default external encoding is UTF-8.
# If we don't override it, all of our file I/O will therefore also be in UTF-8.
# We can query the external encoding of an I/O object using the IO#external_encoding method:

f = File.open("/etc/passwd")
puts "File encoding is #{f.external_encoding}"
line = f.gets
puts "Data encoding is #{line.encoding}"
puts " "

# Notice that the data is tagged with a UTF-8 encoding even though it (presumably) contains just 7-bit ASCII characters.
# Only literals in your Ruby source files have the "change encoding if they contain 8-bit data" rule.

# You can force the external encoding associated with an I/O object when you open it -- simply add the name of the encoding, preceded by a colon, to the mode string.
# Note that this in no way changes the data that's read; it simply tags it with the encoding you specify:

f = File.open("/etc/passwd", "r:ascii")
puts "File encoding is #{f.external_encoding}"
line = f.gets
puts "Data encoding is #{line.encoding}"
puts " "

# You can force Ruby to transcode -- change the encoding -- of data it reads and writes by putting two encoding names in the mode string, again witha colon before each.
# For example, the file iso-8859.txt contains the word olé in ISO-8859-1 encoding, so the e-acute (é) character is encoded by the single byte \xe9.
# I can view this file's contants in hex using the od command-line tool.
# (Windows users can use the d command in debug to do the same.)

# 0000000      6f 6c e9 0a
# 0000004

# If we try to read it with our default external encoding of UTF-8, we'll encounter a problem:

f = File.open("iso-8859-1.txt")
puts f.external_encoding.name
line = f.gets
puts line.encoding
puts line
puts " "

# The problem is that the binary sequence for the e-acute (é) isn't the same in ISO-8859-1 and UTF-8.
# Ruby just assumed the file contained UTF-8 characters, tagging the string it read accordingly.

# We can tell the program that the file contains ISO-8859-1:

f = File.open("iso-8859-1.txt", "r:iso-8859-1")
puts f.external_encoding.name
line = f.gets
puts line.encoding
puts line
puts " "

# This doesn't help us much.
# The string is now tagged with the correct encoding, but our operating system is still expecting UTF-8 output.

# The solution is to map th ISO-8859-1 to UTF-8 on input:

f = File.open("iso-8859-1.txt", "r:iso-8859-1:utf-8")
puts f.external_encoding.name
line = f.gets
puts line.encoding
puts line
puts " "

#!# The actual output of the code above isn't quite the same as the book, but I get the idea.

# If you specify two encoding names when opening an I/O object, the first is the external encoding, and the second is the internal encoding.
# Data is transcoded from the former to the latter on reading and the opposite way on writing.
