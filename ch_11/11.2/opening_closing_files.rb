# As you may expect, you can create a new file object using File.new:

file = File.new("testfile", "r")
# ... process the file 
file.close

# The first parameter is the filename. The second is the mode string, which lets you open the file for reading, writing, or both.
# In the file above, we opened testfile for reading with an "r". We could also have used "w" for write or "r+" for read-write. The full list of allowed modes appears in the reference section on page 494.
# You can also optionally specify file permissions when creating a file; see the description of File.new on page 494 for details.
# After opening the file, we can work with it, writing and/or reading data as needed.
# Finally, as responsible software citizens, we close the file, ensuring that all buffered data is written and that all related resources are freed.

# But here Ruby can make life a little bit easier for you. The method File.open also opens a file. In regular use, it behaves just like File.new. However, if you associate a block with the call, open behaves differently.
# Instead of returning a new file object, it invokes the block, passing the newly opened File as a parameter. When the block exits, the file is automatically closed.

File.open("testfile", "r") do |file|
  # ... process the file
end   # <- file automatically closed here

# This second approach has an added benefit. In the earlier approach, if an exception is raised while processing the file, the call to file.close may not happen. Once the file variable goes out of scope, then garbage collection will eventually close it, but this may not happen for a while. Meanwhile, resources are being held open.

# This doesn't happen with the block form of File.open. If an exception is raised inside the block, the file is closed before the exception is propagated on to the caller. It's as if the open method looks like the following:

class File
  def File.open(*args)
    result = f = File.new(*args)
    if block_given?
      begin
        result = yield f 
      ensure
        f.close 
      end
    end

    result
  end
end
