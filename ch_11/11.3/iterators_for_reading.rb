# As well as using the usual loops to read data from an I/O stream, you can also use various Ruby iterators.
# IO#each_byte invokes a block with the next 8-bit byte from the IO object (in this case, an object of type File). The chr method converts an integer to the corresponding ASCII character:

File.open("testfile") do |file|
  file.each_byte.with_index do |ch, index|
    print "#{ch.chr}:#{ch} "
    break if index > 10    
  end
end
puts " "

# IO#each_line calls the block with each line from the file. In the next example, we'll make the original newlines visible using String#dump so you can see we're not cheating:

File.open("testfile") do |file|
  file.each_line {|line| puts "Got #{line.dump}" }
end
puts " "

# You can pass each_line any sequence of characters as a line separator, and it will break up the input accordingly, returning the line ending at the end of each line of data. That's why you see the \n characters in the output of the previous example.
# In the next example, we'll use the character e as the line separator:

File.open("testfile") do |file|
  file.each_line("e") {|line| puts "Got #{ line.dump }" }
end
puts " "

# If you combine the idea of an iterator with the autoclosing block feature, you get IO.foreach.
# This method takes the name of an I/O source, opens it for reading, calls the iterator once for every line in the file, and then closes the file automatically:

IO.foreach("testfile") {|line| puts line}
puts " "

# Or, if you prefer, you can retreive an entire file into a string or into an array of lines:

# read into string 
str = IO.read("testfile")
p str.length
p str[0, 30]
puts " "

# read into an array 
arr = IO.readlines("testfile")
p arr.length
p arr[0]
puts " "

# Don't forget that I/O is never certain in an uncertain world -- exceptions will be raised on most errors, and you should be ready to rescue them and take appropriate action.
