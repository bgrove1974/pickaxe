# Small, self-contained scripts can be in a single file.
# However, if you do this, you won't easily be able to write automated tests for your program, because the test code won't be able to load the file containing your source without the program itself running.
# So, if you want to write a small program that also has automated tests, split that program into a trivial driver that provides the external interface (the command-line part of the code) and one or more files containing the rest.
# Your tests can then exercise these separate files without actually running the main body of your program.

# Let's try this for real.
# Here is a simple program that finds anagrams in a dictionary.
# Feed it one or more words, and it gives you the anagrams of each.
# If we were typing in this program for casual use, we might just enter it into a single file.
# It would look something like this:

#!/usr/bin/env ruby

require 'optparse'

dictionary = "/usr/share/dict/words"

OptionParser.new do |opts|
  
  opts.banner = "Usage:  anagram [ options ] word..."

  opts.on("-d", "--dict path", String, "Path to dictionary") do |dict|
    dictionary = dict 
  end

  opts.on("-h", "--help", "Show this message") do
    puts opts 
    exit 
  end

  begin
    ARGV << "-h" if ARGV.empty?
    opts.parse!(ARGV)
  rescue OptionParser::ParseError => e  
    STDERR.puts e.message, "\n", opts
    exit(-1)
  end
end

# convert "wombat" into "abmotw". All anagrams share a signature.
def signature_of(word)
  word.unpack("c*").sort.pack("c*")
end

signatures = Hash.new

File.foreach(dictionary) do |line|
  word = line.chomp
  signature = signature_of(word)
  (signatures[signature ] ||= []) << word 
end

ARGV.each do |word|
  signature = signature_of(word)
  if signatures[signature]
    puts "Anagrams of #{word}: #{signatures[signature].join(', ')}"
  else
    puts "No anagrams of #{word} in #{dictionary}"
  end
end

# Great, it works! But, now someone has asked us for a copy, and we feel embarrassed.
# Our program has no tests, and it isn't particularly well packaged.

# Looking at the code, there are clearly three sections.
# The first twenty-five or so lines do option parsing, the next ten or so lines read and convert the dictionary, and the last few lines look up each command-line argument and report the result.

# Let's split our file into four parts:

# # An option parser 
# # A class to hold the lookup table for anagrams
# # A class that looks up words given on the command line 
# # A trivial command line interface 

# The first three of these are effectively library files, used by the fourth.

# Where do we put all of these files?
# The answer is driven by some strong Ruby conventions, first seen in Minero Aoki's setup.rb and later enshrined in the RubyGems
# system.
# We'll create a directory for our project containing (for now) three subdirectories:

# anagram/       <- top-level
#       bin/     <- command-line interface goes here 
#       lib/     <- three library files go here 
#       test/    <- test files go here 

# Now let's look at the library files.
# We know we're going to be defining (at least) three classes.
# Right now, these classes will be used only inside our command-line program, but it's conceivable that other people might want to include one or more of our libraries in their own code.
# This means that we should be polite and not pollute the top-level Ruby namespace with the names of all of our classes and so on.
# We'll create just one top-level module, Anagram, and then place all of our classes inside this module.
# This means that the full name of (say) our options-parsing class will be Anagrams::Options.

# This choice informs our decision on where to put the corresponding source files.
# Because class Options is inside the module Anagram, it makes sense to put the corresponding file, options.rb, inside a directory named anagram/ in the lib/ directory.
# This helps people who read your code in the future; when they see a name like A::B::C, they know to look for c.rb in the b/ directory in the a/ directory of your library.
# So, now we can flesh out our directory structure with some files:

# anagram/
#       bin/
#           anagram   <- command-line interface
#       lib/
#           anagram/
#               finder.rb 
#               options.rb 
#               runner.rb 
#       test/ 
#           ... various test files

# The rest of this section will be in a set of files under the anagram directory.
