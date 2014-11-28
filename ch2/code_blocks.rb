#!/usr/bin/ruby

# Code blocks are chunks of code between braces or between 'do' and 'end' (delimiters)
{ puts "Hello"}

# This is another code block
do
  club.enroll(person)
  person.socialize
end

# Ruby convention uses braces for single line blocks and do/end for multi-line blocks
greet { puts "Hi" }
verbose_greet("Dave", "loyal customer") { puts "Hi" }

# A method can then invoke an associated block one or more times using the 'yield' statement
def call_block
  puts "Start of method"
  yield
  yield
  puts "End of method"
end
call_block { puts "In the block"}

# This shows a method calling its associated block twice,
# passing the block two arguments each time:
def who_says_what
  yield("Dave", "Hello")
  yield("Andy", "Goodbye")
end
who_says_what {|person, phrase| puts "#{person} says #{phrase}"}
