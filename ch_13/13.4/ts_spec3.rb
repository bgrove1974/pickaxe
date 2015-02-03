##! In Rspec 3.0 and up, "should" is deprecated and "expect" should be used instead.
##! I'm going to work around this issue for now with the following code that explicitly allows both "expect" and "should"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

# Time for the next expectation. It shouldn't work for tennis_scorer2, but it should for tennis_scorer3.

# require_relative "tennis_scorer2"
require_relative "tennis_scorer3"

describe TennisScorer, "basic scoring" do
  it "should start with a score of 0-0" do
    ts = TennisScorer.new
    ts.score.should == "0-0"
  end

  it "should be 15-0 if the server wins a point" do
    ts = TennisScorer.new
    ts.give_point_to(:server)
    ts.score.should == "15-0"
  end

  it "should be 0-15 if the receiver wins a point"
  it "should be 15-15 after they both win a point"
end

# This will not run for tennis_scorer2, because the TennisScorer class doesn't implement a give_point_to method.
# We will fix that in tennis_scorer3.rb.
