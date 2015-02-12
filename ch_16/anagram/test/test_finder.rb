require 'test/unit'
require 'shoulda'
require_relative '../lib/anagram/finder'

class TestFinder < Test::Unit::TestCase
  
  context "signature" do
    { "cat" => "act", "act" => "act", "wombat" => "abmotw" }.each do
      |word, signature|
        should "be #{signature} for #{word}" do
          assert_equal signature, Anagram::Finder.signature_of(word)
      end
    end
  end

  context "lookup" do
    setup do
      @finder = Anagram::Finder.new(["cat", "wombat"])
    end

    should "return word if given" do
      assert_equal ["cat"], @finder.lookup("act")
      assert_equal ["cat"], @finder.lookup("tca")
    end

    should "return nil if no word matches anagram" do
      assert_nil @finder.lookup("wibble")
    end
  end

end

# We now have all of the support code in place. We just need to run it.
# We'll make the command-line interface -- the thing the user actually executes -- really thin.
# It's in the bin/directory in a file called anagram (no .rb extension, because that would be unusual in a command).
# If you are on Windows, you might want to wrap the invocation of this (anagram) in a .cmd file.
