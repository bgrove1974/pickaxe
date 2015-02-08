# Argument Processing: ARGV and ARGF

# Any command-line arguments after the program filename are available to your Ruby program in the global array ARGV.
# For instance, assume test.rb contains the following program:

# ARGV.each {|arg| p arg }

# Invoke it with the following command line:

# $ ruby -w test.rb "Hello World" al 1.6180

# It will generate the following output:

# "Hello World"
# "al"
# "1.6180"

# There's a gotcha here for all you C programmers -- ARGV[0] is the first argument available to the program, not the program name.
# The name of the current program is available in the global variable $0, which is aliased to $PROGRAM_NAME.
# Notice that all of the values in ARGV are strings.

# If your program reads from standard input (or uses the special object ARGF, described in the next section), the arguments in ARGV will be taken to be filenames, and Ruby will read from these files.
# If your program takes a mixture of arguments and filenames, make sure you empty the nonfilename arguments from the ARGV array before reading from the files.
