#!/usr/bin/ruby

# Enumerators take something that is normally executable code and turn it into an object.
# We can do things programmatically with enumerators that aren't easily done with regular loops.

# The Enumerable module defines each_with_index.
# This invokes its host class's each Method, returning successive values along with an index.

result = []
[ 'a', 'b', 'c' ].each_with_index { |item, index| result << [item, index] }
puts result  # => [["a", 0], ["b", 1], ["c", 2]]

# Iterate over the characters in a string.
# The each_char method of strings will return an enumerator if you don't give it a block.
# Then, call each_with_index on that enumerator.

result = []
"cat".each_char.each_with_index { |item, index| result << [item, index] }
puts result  # => [["c", 0], ["a", 1], ["t", 2]]

# We can also use with_index, which makes the code read better.

result = []
"cat".each_char.with_index { |item, index| result << [item, index] }
puts result  # => [["c", 0], ["a", 1], ["t", 2]]

# We can also create the Enumerator object explicitly

enum = "cat".enum_for(:each_char)
puts enum.to_a  # => ["c", "a", "t"]

# If the method we're using as the basis of our enumerator takes parameters, we can pass them to enum_for.

enum_in_threes = (1..10).enum_for(:each_slice, 3)
puts enum_in_threes.to_a  # => [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]
