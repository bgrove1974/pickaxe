# "In the beginning was the command line." Title of an essay by Neal Stephenson htttp://www.cryptonomicon.com/beginning.html.

# Regardless of the system in which Ruby is deployed, you have to start the Ruby interpreter somehow, and that gives us the opportunity to pass in command-line arguments.

# A Ruby command line consists of three parts: options to the Ruby interpreter, optionally the name of a program to run, and optionally a set of arguments for that program:

# ruby<options><-><programfile><arguments>*

# The Ruby options are terminated by the first word on the command line that doesn't start with a hyphen or by the special flag  -- (two hyphens).

# If no filename is present on the command line or if the filename is a single hyphen, Ruby reads the program source from standard input.

# Arguments for the program itself follow the program name.
# For example, the following:

# ruby -w "Hello World"

# will enable warnings, read a program from standard input, and pass it the string "Hello World" as an argument.
