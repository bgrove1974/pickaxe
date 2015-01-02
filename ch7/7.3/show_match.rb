# After a successful match, Ruby sets a whole bunch of magic variables. For example:
# $& receives the part of the string that was matched by the pattern, 
# $` receives the part of the string that preceded the match, and 
# $' receives the string after the match.

# Those variables are ugly, so instead we can use the MatchData object returned from the match method because it encapsulates all the information Ruby knows about the match.

# Given a MatchData object, you can call:
# pre_match to return the part of the string before the match, 
# post_match for the string after the match, and 
# index using [0] to get the matched portion. 

# We can use these to write show_regexp, a method that shows where a pattern matches:

def show_regexp(string, pattern)
  match = pattern.match(string)
  if match
    "#{match.pre_match}->#{match[0]}<-#{match.post_match}"  
  else
    "no match"
  end
end

# We can use the method like this:

p show_regexp('very interesting', /t/)
p show_regexp('Fats Waller', /lle/)
p show_regexp('Fats Waller', /z/)
