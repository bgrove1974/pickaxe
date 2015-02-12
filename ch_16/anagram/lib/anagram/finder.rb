# The finder code is modified slightly from the original version.
# To make it easier to test, we'll have the default constructor take a list of words, rather than a filename.
# We'll then provide an additional factory method, from_file, that takes a filename and constructs a new Finder from that file's contents:

module Anagram
  class Finder
  
    def self.from_file(file_name)
      new(File.readlines(file_name))           
    end

    def initialize
      @signatures = Hash.new
      dictionary_words.each do |line|
        word = line.chomp
        signature = Finder.signature_of(word)
        (@signatures[signature] ||= []) << word 
      end           
    end

    def lookup(word)
      signature = Finder.signature_of(word)
      @signatures[signature]           
    end

    def self.signature_of(word)
      word.unpack("c*").sort.pack("c*")           
    end         
  end   
end 

# Again, we embed the Finder class inside the top-level Anagram module.
# And, again, this code is self-contained, allowing us to write some simple unit tests in test/test_finder.rb.
