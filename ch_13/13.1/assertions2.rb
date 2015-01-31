# Let's add a few more tests:

# require_relative 'romanbug'
require_relative 'romanbug2'
require 'test/unit'
class TestRoman < Test::Unit::TestCase
  def test_simple
    assert_equal("i",   Roman.new(1).to_s)
    assert_equal("ii",  Roman.new(2).to_s)
    assert_equal("iii", Roman.new(3).to_s)
    assert_equal("iv",  Roman.new(4).to_s)
    assert_equal("ix",  Roman.new(9).to_s)
  end
end

# Uh-Oh! The second assertion failed. See how the error messages uses the fact that the assert knows both the expected and actual values: it expected to get "ii" but instead got "i".
# Looking at our code, you can see a clear bug in the to_s method.
# If the count after dividing by the factor is greater than zero, then we should output that many Roman digits; the existing code outputs just one.
# Here's the fix:

# def to_s
#   value = @value 
#   roman = ""
#   for code, factor in FACTORS
#      count, value = value.divmod(factor)
#      roman << (code * count)     ##! this line has been changed
#   end
#   roman 
# end

# The updated code can be found in 'romanbug2'.

# If keeping track off all of these files isn't confusing enough, go to assert3.rb, where we will remove some of the duplication and test file 'romanbug2'.
