# In common with other languages, Ruby has a syntactic shortcut: a = a + 2 may be written as a += 2.
# The second form is converted internally to the first. This means that operators you have defined as methods in your own classes work as you would expect.

class Bowdlerize
  def initialize(string)
    @value = string.gsub(/[aeiou]/, '*')
  end
  def +(other)
    Bowdlerize.new(self.to_s + other.to_s)
  end
  def to_s
    @value
  end
end

puts a = Bowdlerize.new("damn ")
puts a += "shame"

# Something you won't find in Ruby are the autoincrement(++) and autodecrement(--) operators of C and Java.
# Instead use += and -= forms.
