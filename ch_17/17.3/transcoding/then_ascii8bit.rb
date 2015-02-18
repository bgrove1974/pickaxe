# encoding: ascii-8bit

# Sometimes you'll have a string containing binary data and you want that data to be interpreted as if it had a particular encoding.
# You can't use the encode method for this, because you don't want to change the byte contents of the string -- you're just changing the encoding associated with those bytes.
# Use the String#force_encoding method to do this.

puts str = "\xc3\xa9"
p str.encoding 
puts str.force_encoding("utf-8")
p str.bytes.to_a 
p str.encoding 
puts " "

# Finally, you can use encode (with two parameters) to convert between two encodings if your source string is ASCII-8BIT.
# This might happen if, for example, you're reading data in binary mode from a file and choose not to encode it at the time you read it.
# Here we fake that out by creating an ASCII-8BIT string that contains an ISO-8859-1 sequence (our old friend olé).
# We then convert the string to UTF-8.
# To do this, we have to tell encode the actual encoding of the bytes by passing it a second parameter.

puts original = "ol\xe9" 
p original.bytes.to_a 
p original.encoding 
puts new = original.encode("utf-8", "iso-8859-1")
p new.bytes.to_a 
p new.encoding 

# If you're writing programs that will support multiple encodings, you will probably want to read Section 17.5, Default External Encoding, on pp 248 -- it will greatly simplify your life.
