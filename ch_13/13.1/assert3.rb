# Looking good. Now we can go a step further and remove some of that duplication.

require_relative 'romanbug2'
require 'test/unit'

class TestRoman < Test::Unit::TestCase

  NUMBERS = { 1 => "i", 2 => "ii", 3 => "iii", 4 => "iv", 5 => "v", 9 => "ix" }

  def test_simple
    NUMBERS.each do |arabic, roman|
      r = Roman.new(arabic)
      assert_equal(roman, r.to_s)
    end
  end
end

# Next testing file on the list will be exception.rb.
