# In order for the tests in ts_spec3 to pass, our TennisScorer class has to implement a give_point_to method.
# The following code isn't finished, but it lets our tests pass:

class TennisScorer
  
  OPPOSITE_SIDE_OF_NET = { :server => :receiver, :receiver => :server }

  def initialize
    @score = { :server => 0, :receiver => 0 }
  end

  def score
    "#{@score[:server]*15}-#{@score[:receiver]*15}"
  end

  def give_point_to(player)
    other = OPPOSITE_SIDE_OF_NET[player]
    fail "Unknown player #{player}" unless other
    @score[player] += 1
  end
end

# Again, we'll run the specification:

# $ rspec ts_spec3.rb 

# Yay! We're now meeting two of the initial four expectations. In the next spec file, we'll remove some duplication as well as build out the last two expectations.

# Let's go to ts_spec4.
