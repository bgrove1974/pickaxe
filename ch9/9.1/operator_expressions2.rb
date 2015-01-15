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

# Note that there's a subtlety in this code -- the << method explicitly returns self. It does this to allow the method chaining in the line scores << 10 << 20 << 40. Because each call to << returns the scores object, you can then call << again, passing in a new score.

# As well as the obvious operators, such as +,*, and <<, indexing using square brackets is also implemented as a method call. When you write this:

# some_obj[1,2,3]

# you're actually calling a method named [] on some_obj, passing it three parameters. You would define this method using:

class SomeClass
  def [](p1, p2, p3)
    # ...
  end
end

# Similarly, assignment to an element is implemented using the []= method. This method receives each object passed as an index as its first n parameters and the value of the assignment as its last parameter:

class SomeClass
  def []=(*params)
    value = params.pop
    puts "Indexed with #{params.join(', ')}"
    puts "value = #{value.inspect}"
  end
end

s = SomeClass.new
s[1] = 2
s['cat', 'dog'] = 'enemies'
