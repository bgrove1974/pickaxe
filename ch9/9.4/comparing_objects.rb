# In addition to the boolean operators, ruby objects support comparison using the methods ==, ===, <=>, =~, eql? and equal?.
# Reference the above on Table 5 "Common comparison operators" pp 134.
# All but <=> are defined in class Object but are often overridden by descendants to provide appropriate semantics. (?)
# For example, class Array redefines == so that two array objects are equal if they have the same number of elements and the corresponding elements are equal.

# Both == and =~ have negated forms, != and !~. Ruby first looks for methods called != or !~, calling them if found.
# If not, it will then invoke either ++ or =~, negating the result.

# In the following example, Ruby calls the == method to perform both comparisons:

class T
  def ==(other)
    puts "Comparing self == #{other}"
    other == "value"
  end
end

t = T.new
p(t == "value")
p(t != "value")
puts " "

# If instead we explicitly define !=, Ruby calls it:

class T
  def ==(other)
    puts "Comparing self == #{other}"
    other == "value"
  end
  def !=(other)
    puts "Comparing self != #{other}"
    other != "value"
  end
end

t = T.new
p(t == "value")
p(t != "value")
puts " "

# You can use a Ruby range as a boolean expression. A range such as exp1..exp2 will evaluate as false until exp1 becomes true. The range will then evaluate as true until exp2 becomes true. Once this happens, the range resets, ready to fire again.
