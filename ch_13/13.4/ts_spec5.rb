##! In Rspec 3.0 and up, "should" is deprecated and "expect" should be used instead.
##! I'm going to work around this issue for now with the following code that explicitly allows both "expect" and "should"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

# RSpec gives us an alternative way of setting up conditions for our tests.
# The let method creates what looks like a variable (it's actually a dynamically defined method) whose value is given by evaluating a block.
# This lets us write the following:

require_relative "tennis_scorer5"

describe TennisScorer, "basic scoring" do

  let(:ts) { TennisScorer.new }

  it "should start witha score of 0-0" do
    ts.score.should == "0-0"
  end

  it "should be 15-0 if the server wins a point" do
    ts.give_point_to(:server)
    ts.score.should == "15-0"
  end

  it "should be 0-15 if the receiver wins a point" do
    ts.give_point_to(:receiver)
    ts.score.should == "0-15"
  end

  it "should be 15-15 after thery both win a point" do
    ts.give_point_to(:receiver)
    ts.give_point_to(:server)
    ts.score.should == "15-15"
  end
end

# Once again, 4 examples, 0 failures.

# We're going to stop here, but I suggest that you might want to take this code and continue to develop it.
# Write expectations such as these:

# it "should be 40-0 after the server wins three points"
# it "should be W-L after the server wins four points"
# it "should be L-W after the receiver wins four points"
# it "should be Deuce after each wins three points"
# it "should be A-server after each wins three points and the server gets one more"

# RSpec has a lot more depth than just the description of expectations.
# In particular, you can use it with Cucumber, an entire language for describing and running complete user stories.
# But, that's beyond the scope of this book.
