# The inject method is made available by the Enumerable mixin.
# The inject method applies a function or operation to the first two elements in the collection and then applies the operation to the result of this computation to the third element, and so on, until all elements in the collection have been used.

class VowelFinder
  include Enumerable

  def initialize(string)
    @string = string
  end
  def each
    @string.scan(/[aeiou]/) do |vowel|
      yield vowel 
    end
  end
end

vf = VowelFinder.new("the quick brown fox jumped")
# puts vf.inject(:+)
vf.inject(:+)

# When sum is applied to the inject method, numbers are added and strings are concatenated.
# We can use a module to encapsulate this functionality.
