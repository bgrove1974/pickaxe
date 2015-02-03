##! In Rspec 3.0 and up, "should" is deprecated and "expect" should be used instead.
##! I'm going to work around this issue for now with the following code that explicitly allows both "expect" and "should"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

# We're now meeting two of the four initial expectations.
# But, before we move on, note that there is a bit of duplication in the specification: both of our expectations create a new TennisScorer object.
# We can fix that by using a before stanza in the specification.
# This works a bit like the setup method used in Test::Unit, allowing us to run code before the expectations are executed.
# Let's use this feature and, at the same time, build out our last two expectations:

require_relative "tennis_scorer4"

describe TennisScorer, "basic scoring" do
  before(:each) do
    @ts = TennisScorer.new
  end

  it "should start with a score of 0-0" do
    @ts.score.should == "0-0" 
  end

  it "should be 15-0 if the server wins a point" do
    @ts.give_point_to(:server) 
    @ts.score.should == "15-0"
  end

  it "should be 0-15 if the receiver wins a point" do
    @ts.give_point_to(:receiver) 
    @ts.score.should == "0-15" 
  end

  it "should be 15-15 after they both win a point" do
    @ts.give_point_to(:receiver)
    @ts.give_point_to(:server) 
    @ts.score.should == "15-15"
  end
end

# Now let's runt his code and see what happens.

# $ rspec ts_spec4.rb 

# Woohoo! All four tests pass! 4 examples, 0 failures.

# Move on to ts_spec5.rb, and we'll look at how RSpec gives us an alternative way of setting up conditions for our tests.
 