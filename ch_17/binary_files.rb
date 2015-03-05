# In the old days, we Unix users used to make little snide comments about the way that Windows users had to open binary fies using a special binary mode.
# Well, now the Windows folks can get their own back.
# If you want to open a file containing binary data in Ruby, you must now specify the binary flag, which will automatically select the 8-bit clean ASCII-8BIT encoding.
# To make things explicit, you can use "binary" as an alias for the encoding:

f = File.open("iso-8859-1.txt", "rb")
puts "Implicit encoding is #{f.external_encoding.name}"
f = File.open("iso-8859-1.txt", "rb:binary")
puts "Explicit encoding is #{f.external_encoding.name}"
line = f.gets
puts "String encoding is #{line.encoding.name}"
