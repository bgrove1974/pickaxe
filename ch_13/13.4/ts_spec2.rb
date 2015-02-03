##! In Rspec 3.0 and up, "should" is deprecated and "expect" should be used instead.
##! I'm going to work around this issue for now with the following code that explicitly allows both "expect" and "should"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

# Let's start by meeting the first expectation -- when a game starts, the score should be 0 to 0.
# We'll start by fleshing out the test:

require_relative "tennis_scorer2"

describe TennisScorer, "basic scoring" do
  it "should start with a score of 0-0" do
    ts = TennisScorer.new
    ts.score.should == "0-0"
  end

  it "should be 15-0 if the server wins a point"
  it "should be 0-15 if the receiver wins a point"
  it "should be 15-15 after they both win a point"
end 

# Note that we have assumed that we have a class TennisScorer in a file called tennis_scorer.rb.
# Our first expectation now has a code block associated with it.
# Inside that block, we create a TennisScorer and then use a funky RSpec syntax to validate that the score starts oout at 0 to 0.
# This particular aspect of RSpec probably generates the most controversy -- some people love it, others find it awkward.
# Either way, ts.score.should == "0-0" is basically the same as an assertion in Test::Unit.

# Now, it's time to build up our TennisScorer class, but only enough to let it satisfy this assertion.

# In order to keep the filenames somewhat consistent, the TennisScorer class file for this round of tests will be in tennis_scorer2.rb.
