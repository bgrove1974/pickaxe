# Behind the scenes, Shoulda is creating Test:unit test methods for each should block in your tests.
# This is why we can use regular Test::Unit assertions in Shoulda code.
# But Shoulda also works hard to maintain the right context for our tests.
# For example, we can nest contexts and their setup blocks, allowing us to have some initialization that's common to all tests and some that's common to just a subset.
# We can apply this to our tennis example.
# We'll write nested contexts and put setup blocks at each level.
# When Shoulda executes our tests, it runs all the appropriate setup blocks for the should blocks.

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
  
    context "where the server wins a point" do
      setup do
        @ts.give_point_to(:server)
      end
  
      should "be 15-0" do
        assert_score("15-0")
      end
  
      context "and the opponent wins a point" do
        setup do
          @ts.give_point_to(:receiver)
        end
  
        should "be 15-15" do
          assert_score("15-15")
        end
      end
    end
  
    should "be 0-15 if the receiver wins a point" do
      @ts.give_point_to(:receiver)
      assert_score("0-15") 
    end
  end
end

# ruby ts_shoulda2.rb 

# Would we use these nested contexts for this tennis scoring example?
# We probably wouldn't, because the linear form is easier to read.
# But we use them all the time when we have tests where we want to run through a complex scenario that builds from test to test.
# This nesting lets us set up an environment, run some tests, then change the environment, run more tests, change it again, run even more tests, and so on.
# It ends up making tests far more compact and removes a lot of duplication.
