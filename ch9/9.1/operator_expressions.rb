# Ruby has the basic set of operators (+,-,*,/, and so on) as well as a few surprises. A complete list of the operators and their precedences is on pp 318.

# In Ruby, many operators are implemented as method calls. For example, when you write a*b+c, you're actually asking the object referenced by a to execute the method *, passing in the parameter b. You then ask the object that results from the calculation to execute the + method, passing c as the parameter. This is the same as writing the following in Ruby:

a, b, c = 1, 2, 3
p a * b + c
p (a.*(b)).+(c)
puts " "

# Because everything is an object and because you can redefine instance methods, you can always redefine basic arithmetic if you don't like the answers you're getting.

class Fixnum
  alias old_plus +   # We can reference the original '+' as 'old_plus'

  def +(other)       # Redefine addition of Fixnums. !!This is a BAD idea!!
    old_plus(other).succ
  end
end

p 1 + 2
a = 3
p a += 4
p a + a + a 
puts " "

# More useful is that classes you write can participate in operator expressions just as if they were built-in objects.
# For example, the left shift operator, <<, is often used to mean 'append to receiver'. Arrays support this:

p a = [ 1, 2, 3 ]
p a << 4
puts " "

# You can add similar support to your classes:

class ScoreKeeper
  def initialize
    @total_score = @count = 0
  end
  def <<(score)
    @total_score += score
    @count += 1
    self
  end
  def average
    fail "No scores" if @count.zero?
    Float(@total_score) / @count
  end
end

scores = ScoreKeeper.new
scores << 10 << 20 << 40
puts "Average = #{scores.average}"
puts " "
