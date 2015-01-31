# 13.1 THE TESTING FRAMEWORK

# The Ruby testing framework is basically three facilities wrapped into a neat little package:
  # It gives you a way of expressing individual tests.
  # It provides a framework for structuring the tests.
  # It gives you flexible ways of invoking the tests.

# ASSERTIONS == EXPECTED RESULTS

# Rather than have you write a series of individual if statements in your tests, the testing framework provides a set of assertions that achieve the same thing.
# Although a number of different styles of assertion exist, they all follow basically the same pattern.
# Each gives you a way of specifying a desired result and a way of passing in the actual outcome.
# If the actual doesn't equal the expected, the assertion outputs a nice message and records the failure.

# For example, we could rewrite our previous test of the Roman class using the testing framework.
# For now, ignore the scaffolding code at the start and end, and just look at the assert_equal methods:

require_relative 'romanbug'
require 'test/unit'

class TestRoman < Test::Unit::TestCase

  def test_simple
    assert_equal("i",  Roman.new(1).to_s)
    assert_equal("ix", Roman.new(9).to_s)
  end

end

# The first assertion says that we're expecting the Roman number string representation of 1 to be "i", and the second test says we expect 9 to be "ix".
# Luckily for us, both expectations are met, and the tracing reports that our tests pass.
# Go to assertions2.rb for more tests.
