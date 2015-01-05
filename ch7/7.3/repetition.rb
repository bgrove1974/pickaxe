# The asterisk (*) is one of a number of modifiers that allow you to match multiple occurrences of a pattern.
# If r stands for the immediately preceding regexp within a pattern, then:

# r*      Matches zero or more occurrences of r 
# r+      Matches one or more occurrrences of r 
# r?      Matches zero or one occurrence of r 
# r{m,n}  Matches at least m and at most n occurrences of r 
# r{m,}   Matches at least m occurrences of r 
# r{,n}   Matches at most n occurrences of r 
# r{m}    Matches exactly m occurrences of r 

# These repetition constructs have a high precedence -- they bind only to the immediately preceding matching construct in the pattern.
# For example, /ab+/ matches an a followed by one or more occurrences of b's, not a sequence of ab's.
# These patterns are called greedy, because by default they will match as much of the string as they can. You can alter this behavior and have them match the minimum by adding a ? suffix. The repetition is then called lazy -- it stops once it has done the minimum amount of work required.

# Remember, a pattern that contains just a * repetition will always match whatever string you pass it.

def show_regexp(string, pattern)
  match = pattern.match(string)
  if match
    "#{match.pre_match}->#{match[0]}<-#{match.post_match}"  
  else
    "no match"
  end
end

a = "The moon is made of cheese"
puts a 
p show_regexp(a, /\w+/)
p show_regexp(a, /\s.*\s/)
p show_regexp(a, /\s.*?\s/)
p show_regexp(a, /[aeiou]{2,99}/)
p show_regexp(a, /mo?o/)
# Here's the lazy version
p show_regexp(a, /mo??o/)
puts " "

# Both of these match an empty substring at the start of the string.
p show_regexp(a, /m*/)
p show_regexp(a, /Z*/)
