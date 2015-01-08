# Within a pattern, the sequences \n (where n is a number), \k'n', and \k<n> all refer to the nth captured subpattern.
# Thus, the expression /(...)\1/ matches six characters with the first three characters being the same as the last three.

# Rather than refer to matches by their number, you can give them names and then refer to those names. A subpattern is named using either of the syntaxes (?<name>...) or (?'name'...). You then refer to these named captures using either \k<name> or \k'name'.

# For example, the following shows differnt ways of matching a time range (in the form hh:mm-hh:mm) where the hour part is the same.

same   = "12:15-12:45"
differ = "12:45-13:15"
puts same
puts differ
# use numbered backreference
p same   =~ /(\d\d):\d\d-\1:\d\d/
p differ =~ /(\d\d):\d\d-\1:\d\d/
# use named backreference
p same   =~ /(?<hour>\d\d):\d\d-\k<hour>:\d\d/
p differ   =~ /(?<hour>\d\d):\d\d-\k<hour>:\d\d/
puts " "


# Negative backreference numbers count backward from the place they're used, so they are relative, not absolute, numbers.
# The following pattern matches four-letter palindromes:

p "abab" =~ /(.)(.)\k<-1>\k<-2>/
p "abba" =~ /(.)(.)\k<-1>\k<-2>/
puts " "

# You can invoke a named subpattern using \g<name> or \g<number>.
# This reexecutes the match in the subpattern, in contrast to to \k<name>, which matches whatever is matched by the subpattern.

re = /(?<color>red|green|blue) \w+ \g<color> \w+/
p re =~ "red sun blue moon"
p re =~ "blue sun green moon"
p re =~ "white sun red moon"
puts " "

# You can use \g recursively, invoking a pattern within itself.
# The following code matches a string in which braces are properly nested.

p re = /
  \A 
    (?<brace_expression>
      {
        (
          [^{}]                             # anything other than braces
        |                                   # ...or...
          \g<brace_expression>              # a nested brace expression
        )*
      }
    )
  \Z
/x 

# We use the x option to allow us to write the expression with lots of space, which makes it easier to understand(???)
# You can read the above regexp as follows:
# A brace expression is an open brace, then a sequence of zero or more characters or brace expressions, then a closing brace.

