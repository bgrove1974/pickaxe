# The inject method is made available by the Enumerable mixin.
# The inject method applies a function or operation to the first two elements in the collection and then applies the operation to the result of this computation to the third element, and so on, until all elements in the collection have been used.
# When sum is applied to the inject method, numbers are added and strings are concatenated.
# We can use a module to encapsulate this functionality.

module Summable
  def sum
    inject(:+)
  end
end

class Array
  include Summable
end

class Range
  include Summable
end

require_relative "vowel_finder"
class VowelFinder
  include Summable
end

p [ 1, 2, 3, 4, 5 ].sum 
p ('a'..'m').sum 

vf = VowelFinder.new("the quick brown fox jumped")
p vf.sum
