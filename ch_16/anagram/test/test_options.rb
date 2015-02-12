# Let's write some unit tests.
# This shoud be fairly easy, because options.rb is self-contained -- the only dependency is to the standard Ruby OptionParser.
# We'll use the Test::Unit framework, extended with the Shoulda gem.
# We'll put the source of this test in the file test/test_options.rb.

require 'test/unit'
require 'shoulda'
require_relative '../lib/anagram/options'

class TestOptions < Test::Unit::TestCase
  
  context "specifying no dictionary" do
    should "return default" do
      opts = Anagram::Options.new(["someword"])
      assert_equal Anagram::Options::DEFAULT_DICTIONARY, opts.dictionary
    end
  end

  context "specifying a dictionary" do
    should "return it" do
      opts = Anagram::Options.new(["-d", "mydict", "someword"])
      assert_equal "mydict", opts.dictionary 
    end
  end

  context "specifying words and no dictionary" do
    should "return the words" do
      opts = Anagram::Options.new(["word1", "word2"])
      assert_equal ["word1", "word2"], opts.words_to_find
    end
  end

  context "specifying words and a dictionary" do
    should "return the words" do
      opts = Anagram::Options.new(["-d", "mydict", "word1", "word2"])
      assert_equal ["word1", "word2"], opts.words_to_find
    end
  end
end

# The line to note in this file is as follows:

# require_relative '../lib/anagram/options'

# This is where we load the source of the Options class we just wrote.
# We use require_relative, as it always loads from a path relative to the directory of the file that invokes it.

# To run the tests from the current directory (test), use the following command:

# $ ruby test_options.rb 

# To run the tests from the top-level anagram directory, use the following command:

# $ ruby test/test_options.rb 
