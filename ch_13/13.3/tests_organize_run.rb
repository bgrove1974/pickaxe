# ORGANIZING AND RUNNING TESTS

# The test cases we have shown so far are all runnable Test::Unit programs. 
# If, for example, the test case for the Roman class was in a file called test_roman.rb, we could run the tests from the command line using this: 

# $ ruby test_roman.rb 

# Test::Unit is clever enough to run the tests even though there's no main program.
# It collects all of the test case classes and runs each in turn.
# If we want, we can ask it to run just a particular test method:

# $ ruby test_roman.rb -n test_range

# or tests whose names match a regular expression:

# $ ruby test_roman.rb -n /range/

# This last capability is a great way of grouping your tests.
# Use meaningful names, and you will be able to run (for example) all the shopping-cart-related tests by simply running tests with names matching /cart/.
