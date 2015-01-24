# The same methods that we've been using for "simple" I/O are available for all file objects.
# So, gets reads a line from standard input (or from any fies specified on the command line when the script was invoked), and file.gets reads a line from the file object 'file'.

# For example, we could create a program called copy.rb:

# tut_io/copy.rb 

while line = gets
  puts line
end

# If we run this progran with no arguments, it will read lines from the console and copy them back to the console.
# Note that each line is echoed once the Return key is pressed. The ^D is the end-of-file character on Unix systems.

# $ ruby copy.rb 
# These are lines   # user input
# These are lines   # console output
# that I am typing  # user input
# that I am typing  # console output
# ^D

# We can also pass in one or more filenames on the command line, in which case gets will read from each in turn:

# $ ruby copy.rb testfile
# This is line one    # console output
# This is line two    #    "      "
# This is line three  #    "      "
# And so on...        #    "      "

# Finally, we can explicitly open the file and read from it:

File.open("testfile") do |file|
  while line = file.gets
    puts line  
  end  
end
# Produces:
# This is line one    # console output
# This is line two    #    "      "
# This is line three  #    "      "
# And so on...        #    "      "

# As well as gets, I/O objects enjoy an additional set of access methods, all intended to make our lives easier.
