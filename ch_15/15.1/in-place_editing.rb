# In-place editing is a hack inherited from Perl.
# It allows you to alter the contents of files passed in on the command line, retaining a backup copy of the original contents.

# To turn on in-place editing, give Ruby the file extension to use for the backup file, either with the -i[ext] command line option, or by calling ARGF.inplace_mode=ext in your code.

# Now, as your code reads through each file given on the command line, Ruby will rename the original file by appending the backup extension.
# It will then create a new file with the original name, and open it for writing on standard input.
# This all means that if you code a program such as this:
##! The following code can be found in reverse.rb, so that the instructions can be expicitly followed.

while line = gets
  puts line.chomp.reverse
end

# and you invoked it using

# $ ruby -i.bak reverse.rb testfile otherfile

# You would find that testfile and otherfile would now have reversed lines, and that the original files would be available in testfile.bak and otherfile.bak.

# For finer control over the I/O to these files, you can use the methods provided by ARGF.
# They're rarely used, so rather than document them here, we'll refer you to ri or the online documentation.
