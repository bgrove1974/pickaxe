# WHERE RUBY FINDS ITS LIBRARIES

# You use require or load to bring a library into your Ruby program.
# Some of these libraries are supplied with Ruby, some you may have installed from the Ruby Application Archive, some may have been packaged as RubyGems (more on that later), and some you may have written yourself.
# How does Ruby find them?

# Let's start with the basics.
# When Ruby is built for your particular machine, it predefines a set of standard directories to hold library stuff.
# Where these are depends on the machine in question.
# You can determine this from the command line with something like this:

# $ ruby -e 'puts $:'

# The site_ruby directories are intended to hold modules and extensions that you have added.
# The architecture-dependent directories (x86_64-darwin... in this case) hold executables and other things specific to this particular machine.
# All of these directories are automatically included in Ruby's search for libraries.

# Sometimes this isn't enough.
# Perhaps you are working on a large project written in Ruby and you and your colleagues have built a substantial library of Ruby code.
# You want everyone on the team to have access to all of this code.
# You have a couple of options to accomplish this.
# If your program runs at a safe level of zero (see Chapter 26, Locking Ruby in the Safe, pp 409), you can set the environment variable RUBYLIB to a list of one or more directories to be searched. (The separator between entries is a colon in Unix, a semicolon in Windows.)
# If your program is not setuid, you can use the command-line parameter -I to do the same thing.

# The Ruby variable $: is an array of places to search for loaded files.
# As we have seen, this variable is initialized to the list of standard directories, plus any additional ones you specified using RUBYLIB and -I.
# You can always add directories to this array from within your running program.
# Prior to Ruby 1.9, this used to be a common idiom:

# $ $: << File.dirname(__FILE__)
# $ require 'other_file'

# This added the directory of the running file to the search path, so other_file.rb could be found there by the subsequent require statement.
# Now we use require_relative instead:

# $ require_relative 'other_file'
