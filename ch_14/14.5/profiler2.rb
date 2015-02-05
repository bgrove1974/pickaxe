# Here, we attempt to improve the performance of the code in profiler.rb by reading the word list into one long string and then using a regular expression pattern to match and extract all twelve character words:

require 'profile'

words = File.read("/usr/share/dict/words")
count = words.scan(/^............\n/).size

puts "#{count} twelve-character words. Ah, Ah, Ah! (Like the Count from Sesame Street -- get it?)"
puts " "

# Our profiling numbers are now a lot better, and the program runs MUCH faster when we take the profiling back out (by commenting out the require 'profile' line).

# Remember to check the code without the profiler afterward, though -- sometimes the slowdown the profiler introduces can mask other problems.

# Ruby is a wonderfully transparent and expressive language, but it does not releive the programmer of the need to apply common sense.
# Creating unnecessary objects, performing unneeded work, and creating bloated code will slow down your programs regardless of the language.
