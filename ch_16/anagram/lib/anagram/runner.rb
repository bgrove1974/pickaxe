# This is the code that the script in /bin/anagram invokes.
# This code also knits our other libraries together.

require_relative 'finder'
require_relative 'options'

module Anagram
  class Runner
    def initialize(argv)
      @options = Options.new(argv)
    end

    def run
      finder = Finder.from_file(@options.dictionary)
      @options.words_to_find.each do |word|
        anagrams = finder.lookup(word)
        if anagrams
          puts "Anagrams of #{word}: #{anagrams.join(', ')}"
        else
          puts "No anagrams of #{word} in #{options.dictionary}"
        end
      end
    end
  end
end

# In this case, the two libraries finder and options are in the same directory as the runner, so require_relative finds them perfectly.

# Now that all of our files are in place, we can run our program from the command line.
# Switch to the bottom-level anagram directory and run the following:

# $ ruby -I lib bin/anagram teaching code

