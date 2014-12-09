#!/usr/bin/ruby

# Open a file, do something with the contents, and then ensure that the file is closed when finished.
# This is a naive implementation that ignores error handling.

class File
  def self.open_and_process(*args)
    f = File.open(*args)
    yield f 
    f.close()
  end
end

# *args means "collect the actual parameters passed to the method into an array named 'args'".

File.open_and_process("testfile", "r") do |file|
  while line = file.gets
    puts line
  end
end
# This produces the following:
# => This is line one 
# => This is line two 
# => This is line three
# And so on ...

# Implement something similar to the standard File.open (again, ignoring error handling) using the following:

class File
  def self.my_open(*args)
    result = file = File.new(*args)
    # If there is a block, pass in the file and close the file when it returns
    if block_given? # Returns true if a block is associated with the current method
      result = yield file 
      file.close 
    end
    result
  end
end

# If we want to implement the above methods properly, we need to ensure that we close a file even if 
# the code processing that file somehow aborted (exception handling).
