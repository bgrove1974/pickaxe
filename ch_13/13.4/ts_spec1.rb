##! In Rspec 3.0 and up, "should" is deprecated and "expect" should be used instead.
##! I'm going to work around this issue for now with the following code that explicitly allows both "expect" and "should"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

# Let's start with a simple example of RSpec in action.

# Starting to Score Tennis Matches

# The scoring system used in lawn tennis originated in the Middle Ages. As players win successive points, their scores are shown as 15, 30, and 40. The next point is a win unless your opponent also has 40. If you're both tied at 40, then different rules apply -- The first player with a clear two-point advantage is the winner.

# We have to write a class that handles this scoring system.
# Let's use RSpec specifications to drive the process.
# This is the first specification file:

describe "TennisScorer", "basic scoring" do
  it "should start with a score of 0-0"
  it "should be 15-0 if the server wins a point"
  it "should be 0-15 if the receiver wins a point"
  it "should be 15-15 after they both win a point" 
end

# This file contains nothing more than a description of an aspect of the tennis scoring class (that we haven't written yet, by the way).
# It contains a description of the basic scoring system.
# Inside the description are a set of four expectations ('it "should start..."' and so on).
# We can run this specification using the rspec command:

# $ rspec ts_spec1.rb 

# Executing the tests echoes our expectations back at us, telling us that each has yet to be implemented.
# Time to move on to ts_spec2.rb, where we will address the first expectation.
