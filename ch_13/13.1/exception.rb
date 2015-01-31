# What else can we test?
# Well, the constructor checks that the number we pass in can be represented as a Roman number, throwing an exception if it can't. Let's test the exception:

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

  def test_range
    # no exception for these two...
    Roman.new(1)
    Roman.new(4999)
    # but an exception for these
    assert_raises(RuntimeError) { Roman.new(0)    }
    assert_raises(RuntimeError) { Roman.new(5000) }
  end
end

# We could do a lot more testing on our Roman class, but let's move on to bigger and better things.
# Before we go, though, we should say that we have only scratched the surface of the set of assertions available inside the testing framework.
# For example, for every positive assertion, such as assert_equal, thee's a negative refutation (in this case refute_equal).
# The additional assertions you get if you load the Test::Unit shim (which we do in this chapter) are listed in 'Additional Test::Unit assertions' on pp 194.
# A full list of the MiniTest assertions is given in Section 13.5, 'Test::Unit assertions' on pp 193.

# The final parameter to every assertion is a message that will be output before any failure message.
# This normally isn't needed, because the failure messages are normally pretty reasonable.
# The one exception is the test refute_nil (or assert_not_nil in Test::Unit), where the message "Expected nil to be not nil" doesn't help much. In that case, you may want to add some annotation of your own.
# The following code assumes the existence of some kind of user class:

# require 'test/unit'
# class ATestThatFails < Test::Unit::TestCase
#   def test_user_created
#     user = User.find(1)
#     refute_nil(user, "User with ID=1 should exist")
#   end  
# end

# When the test file is run, the custom error message will appear above the message 'Expected nil to be not nil'.
