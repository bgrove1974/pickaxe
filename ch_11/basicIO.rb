# Ruby provides what at first sight looks like two separate sets of I/O routines. The first is the simple interface -- we've been using it pretty much exclusively so far:

print "Enter your name: "
name = gets

# A whole set of I/O related methods is implemented in the Kernel module -- gets, open, print, printf, putc, puts, readline, readlines, and test -- that makes it simple and convenient to write straightforward Ruby programs.
# These methods typically do I/O to standard input and standard output, which makes them useful for writing filters. You will find them documented under class Object on page 599.

# The second way, which gives you a lot more control, is to use IO objects.
