# WHERE TO PUT TESTS

# Once you get into unit testing, you may well find yourself generating almost as much test code as production code.
# All of those tests have to live somewhere.
# The problem is that if you put them alongside your regular production code source files, your directories start to get bloated -- effectively you end up with two files for every production source file.

# A common solution is to have a test/ directory where you place all of your test source files.
# This directory is then placed parallel to the directory containing the code you're developing.
# For example, for our Roman numeral class, we may have This

# roman/
#     lib/
#        roman.rb 
#        other files ...
#
#     test/
#        test_roman.rb 
#        other tests ...
#
#     other stuff ...

# This works well as a way of organizing files but leaves you with a small problem:
# How do you tell Ruby where to find the library files to test?
# For example, if our TestRoman test code was in a test/ subdirectory, how does Ruby know where to find the roman.rb source file, aka the thing we're trying to test?

# An option that does NOT work reliably is to build the path into require statements in the test code and then run the tests from the test/ subdirectory:

# require 'test/unit'
# require '../lib/roman'
#
# class TestRoman < Test::Unit::TestCase
#   # ...
# end

# Why doesn't it work?
# It's because our roman.rb file may itself require other source files in the library we're writing.
# It will load them using require (without the leading ../lib/), and because they aren't in Ruby's $LOAD_PATH, they won't be found. Our test just won't run.
# A second, less immediate problem is that we won't be able to use these same tests to test our classes once installed on a target system, because they will be referenced by using require 'roman'.

# A better solution is to assume that your Ruby program is packaged according to the conventions we'll be discussing in Section 16.2 'Organizing Your Source', pp 226.
# In this arrangement, the top-level lib directory of your application is assumed to be in Ruby's $LOAD_PATH by all other components of the application.
# Your test code would then be as follows:

# require 'test/unit'
# require 'roman'
#
# class TestRoman < Test::Unit::TestCase
#   # ...
# end

# You would run it using this:

# $ ruby -I path/to/app/lib path/to/app/test/test_roman.rb 

# The normal case, where you're already in the application's directory, would be as follows:

# $ ruby -I lib test/test_roman.rb

# This would be a good time to investigate using Rake to automate your testing.
 