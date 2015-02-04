# RSpec is testing with an attitude. On the other hand, Shoulda takes many of the ideas from RSpec and humbly offers them to you for integration into your regular unit tests.
# For many developers, particulary those with existing Test::Unit tests, this is a good compromise.
# You get much of the descriptive power of RSpec-style expectations without having to commit to the full framework.

# Install Shoulda using gem install shoulda.
# Then, unlike RSpec, write a regular Test::Unit test case.
# Inside it, though, you can use the Shoulda mini-language to describe your tests.

# Let's recast our final RSpec tennis scoring tests using Shoulda:

require 'test/unit'
require 'shoulda'
require_relative 'tennis_scorer5.rb'

class TennisScorerTest < Test::Unit::TestCase
  
  def assert_score(target)
    assert_equal(target, @ts.score)
  end

  context "Tennis scores" do
    setup do
      @ts = TennisScorer.new
    end

    should "start with a score of 0-0" do
      assert_score("0-0")
    end

    should "be 15-0 if the server wins a point" do
      @ts.give_point_to(:server)
      assert_score("15-0") 
    end

    should "be 0-15 if the receiver wins a point" do
      @ts.give_point_to(:receiver)
      assert_score("0-15") 
    end

    should "be 15-15 aftre they both win a point" do
      @ts.give_point_to(:receiver)
      @ts.give_point_to(:server)
      assert_score("15-15") 
    end
  end
end

# $ ruby ts_shoulda1.rb 

# Yay, tests pass. Now move on to ts_shoulda2.rb.
