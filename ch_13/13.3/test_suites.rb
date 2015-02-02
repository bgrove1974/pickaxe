# TEST SUITES 

# After a while, you'll grow a decent collection of test cases for your application.
# You may well find that these tend to cluster: one group of cases tests a particular set of functions, and another group tests a different set of functions.
# If so, you can group those test cases together into test suites, letting you run them all as a group.

# This is easy to do -- just create a Ruby file that requires test/unit and then requires each of the files holding the test cases you want to group.
# This way, you build yourself a hierarchy of test material.

#  * You can run individual tests by name.
#  * You can run all of the tests in a file by running that file.
#  * You can group a number of files into a test suite and run them as a unit.
#  * You can group test suites into other test suites.

# This gives you the ability to run your unit tests at a level of granularity that you control, testing just one method or testing the entire application.

# At this point, it's worthwhile to think about naming conventions.
# Nathaniel Talbott, the author of Test::Unit, uses the convention that test cases are in files named tc_xxx and test suites are in files named ts_xxx.
# Most people seem to use test_ as the test-case filename prefix:

# file ts_dbaccess.rb 
# require_relative 'test/unit'
# require_relative 'test_connect'
# require_relative 'tet_query'
# require_relative 'test_update'
# require_relative 'test_delete'

# Now, if you run Ruby on the file ts_dbaccess.rb, you execute the test cases in the four files you have required.
