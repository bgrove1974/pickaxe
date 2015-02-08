# ARGF

# It is common for a command line program to take a list of zero or more file names to process.
# It will then read through these files in turn, doing whatever it does.

# Ruby provides a convenience object, referenced by the name ARGF, that handles access to these files.
# When your program starts, ARGF is initialized with a reference ARGV.
# Because this is a reference, changes to make to ARGV (for example when you remove options as you process them) are seen by ARGF.

# If you read from ARGF (for example by calling ARGF.gets) or from standard input (for example by calling plain gets), Ruby will open the file whose name is the first element of ARGV and perform the I/O on it.
# If, as you continue to read, you reach the end of that file, Ruby closes it, shifts it out of the ARGV array, and then opens the next file on the list.
# At some point, when you finished reading from the last file, ARGV will return an end-of-file condition (so gets will return nil, for example).
# If ARGV is initially empty, ARGF will read from standard input.

# You can get to the name of the file currently being read from using ARGF.filename, and you can get the current File object as ARGF.file.
# ARGF keeps track of the total number of lines read in ARGF.lineno -- if you need the line number in the current file, use ARGV.file.lineno.
# Here is a program that uses this information:
##! The following code will loop endlessly if you execute this file from the command line without any arguments.

while line = gets
  printf "%d: %10s[%d] %s", ARGF.lineno, ARGF.filename, ARGF.file.lineno, line 
end

# If we run it, passing a couple of file names, it will copy the contents of those files.

# $ ruby copy.rb testfile otherfile

##! $ ruby ARGF.rb testfile otherfile gives the same result.
