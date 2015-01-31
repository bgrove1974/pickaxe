# We could test this code by writing another program, like this:

require_relative 'romanbug'

r = Roman.new(1)
fail "'i' expected" unless r.to_s == "i"

r = Roman.new(9)
fail "'ix' expected" unless r.to_s == "ix"

# However, as the number of tests in a project grows, this kind of ad hoc approach can start to get complicated to manage.
# Over the years, various unit testing frameworks have emerged to help structure the testing process.
# Ruby comes with Ryan Davis' MiniTest. In Ruby 1.8, this was Nathaniel Talbott's Test::Unit framework. MiniTest is a rewrite of this.

# MiniTest is largely compatible with Test::Unit but without a lot of the bells and whistles (test-case runners, GUI support, and so on).
# However, because there are areas where it is different and because there are tens of thousands of tests out there that assume the Test::Unit API, Ryan has also added a compatibility layer to MiniTest.
# For a little bit more information on the differences between the two, see MiniTest::Unit vs Test::Unit, pp 177.
# In this chapter, we will be using the Test::Unit wrapper, because it automatically runs tests for us. 
# We will also be using some of the new assertions available in MiniTest.

# There are three basic options with this style of unit testing:

# 1) require "minitest/unit", and use the MiniTest functionality.
# 2) require "test/unit", and use MiniTest with the Test::Unit compatibility layer. This adds in the assertions in 'Additional Test::Unit assertions', on pp 194, and enables the autorun functionality.
# 3) You can install the test-unit gem and get all the original Test::Unit functionality back, along with a bunch of new assertions.
