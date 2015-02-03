# Yes, the code for this class is identical to the code in tennis_scorer3.
# I have put it in this file to keep the name numbers consistent with the test files I am running. 

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