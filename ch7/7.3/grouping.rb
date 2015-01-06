require_relative 'show_regexp'

# You can use parentheses to group terms within a regular expression. Everything within the group is treated as a single regexp.

# This matches an 'a' followed by one or more 'n's 
p show_regexp('banana', /an+/)
# This matches the sequence 'an' one or more times
p show_regexp('banana', /(an)+/)
puts " "

a = 'red ball blue sky'
puts a 
p show_regexp(a, /blue|red/)
p show_regexp(a, /(blue|red) \w+/)
p show_regexp(a, /(red|blue) \w+/)
p show_regexp(a, /red|blue \w+/)
p show_regexp(a, /red (ball|angry) sky/)
puts " "
a = 'the red angry sky'
puts a 
p show_regexp(a, /red (ball|angry) sky/)
puts " "

# Parentheses also collect the results of pattern matching. Ruby counts opening parentheses and for each stores the result of the partial match between it and the corresponding closing parenthesis. You can use this partial match both within the rest of the pattern and in your Ruby program. Within the pattern, the sequence \1 refers to the match of the first group, \2 the second group, and so on. Outside the pattern, the special variables $1, $2, and so on, serve the same purpose.

/(\d\d):(\d\d)(..)/ =~ "12:50am"
p "Hour is #$1, minute #$2"
/((\d\d):(\d\d))(..)/ =~ "12:50am"
p "Time is #$1"
p "Hour is #$2, minute #$3"
p "AM/PM is #$4"
puts " "

# If you're using the MatchData object returned by the match method, you can index into it to get the corresponding subpatterns:

md = /(\d\d):(\d\d)(..)/.match("12:50am")
puts md
p "Hour is #{md[1]}, minute #{md[2]}"
md = /((\d\d):(\d\d))(..)/.match("12:50am")
puts md
p "Time is #{md[1]}"
p "Hour is #{md[2]}, minute #{md[3]}"
p "AM/PM is #{md[4]}"

# The ability to use part of the current match later in that match allows you to look for various forms of repetition:

# match duplicated letter
p show_regexp('He said "Hello"', /(\w)\1/)
# match duplicated substrings
p show_regexp('Mississippi', /(\w+)\1/)
puts " "

# Rather than use numbers, you can also use names to refer to previously matched content. You give a group a name by placing     ?<name> immediately after the opening parenthesis. You can subsequently refer to this named group using \k<name> (or \k'name').

# match duplicated letter
str = 'He said "Hello"'
puts str
p show_regexp(str, /(?<char>\w)\k<char>/)
puts " "
# match duplicated adjacent substrings
str = 'Mississippi'
puts str
p show_regexp(str, /(?<seq>\w+)\k<seq>/)
puts " "

# The named matches in a regexp are also available as local variables, but only if you use a literal regexp and that literal appears on the left hand side of the =~ operator.
# You can't assign a regular expression object to a variable, match the contents of that variable against a string, and expect the local variables to be set.

/(?<hour>\d\d):(?<min>\d\d)(..)/ =~ "12:50am"
p "Hour is #{hour}, minute #{min}"
# You can mix named and position-based references
p "Hour is #{hour}, minute #{$2}"
p "Hour is #{$1}, minute #{min}"
