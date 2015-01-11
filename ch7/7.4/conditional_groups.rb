# Conditional Subexpressions -- Say What?
# Say you validating a list of banquet attendees:

# require_relative 'attendees' (Throws error -- Figure it out)

# The rule is that if the first peson in the list has a title, then so should the second. This means that the first and fourth lines in 'attendees' are invalid.

# We can start with a pattern to match a line with an optional title and a name. We know we've reached the end of the name when we find the word 'and' with spaces around it.

re = %r{ (?:(Mrs | Mr | Ms | Dr )\s)? (.*?) \s and \s }x 

p "Mr Bond and Ms Moneypenny" =~ re 
p [ $1, $2 ]
p "Samson and Delilah" =~ re 
p [ $1, $2 ]
puts " "

# We've defined the regexp with the x (extended) option so we can include whitespace. We also used the ?: modifier on the group that defines the optional title followed by a space. This stops that group from getting captured into $1. We do, however, capture the title part.

# Now we need to match the second name. We can start with the same code as for the first.

re = %r{
  (?:(Mrs | Mr | Ms | Dr )\s)? (.*?)
  \s and \s 
  (?:(Mrs | Mr | Ms | Dr )\s)? (.+)
}x 

p "Mr Bond and Ms Moneypenny" =~ re 
p [ $1, $2, $3, $4 ]
p "Samson and Delilah" =~ re 
p [ $1, $2, $3, $4 ]
puts " "

# Before we go any further, let's clean up the duplication using a named group.

re = %r{
  (?:(?<title>Mrs | Mr | Ms | Dr )\s)? (.*?)
  \s and \s 
  (\g<title>\s)? (.+)
}x 

p re.match("Mr Bond and Ms Moneypenny")
p re.match("Samson and Delilah")
puts " "

# BUT -- this code also matches a line where the first name has a title and the second doesn't.

p re.match("Mr Smith and Sally")
puts " "

# We need to make the second test for a title mandatory if the first test matches. That's where the conditional subpatterns come in.
# The syntax (?(n)subpattern) will apply the subpattern match only if a previous group number n also matched. You can also test named groups using the syntaxes (?(<name>)subpattern) or (?('name')subpattern).

# In our case, we want to apply a test for the second title if the first title is present. That first title is matched by the group named title, so the condition group looks like (?<title>...).

re = %r{
  (?:(?<title>Mrs | Mr | Ms | Dr )\s)? (.*?)
  \s and \s
  (?(<title>)\g<title>\s) (.+)
}x 

p re.match("Mr Smith and Sally")
puts " "

# That's not what we want. The match succeeded when we expected it to fail because of backtracking. It matched the optional first name, the and, and then was told to match a second title (because group 1 matched the first). There's no second title, so the match failed. Rather than stopping, however, our little engine-that-could went back to explore alternatives.

# The engine noticed that the first title was optional, and so it tried matching the whole pattern again, this time skipping the title. It successfully matched 'Mr Smith' using the (.?*) group, and matched 'Sally' with the second name group.
# We want to tell the engine never to backtrack over the first name -- once it has found a title there, it has to use it.
# (?>...) to the rescue.

re = %r{
  ^(?>
    (?:(?<title>Mrs | Mr | Ms | Dr )\s)? (.*?)
    \s and \s
  )
  (?(<title>)\g<title>\s) (.+)
}x 

p re.match("Mr Smith and Sally")
p re.match("Mr Smith and Ms Sally")
puts " "

# The first match failed as expected, but the second match succeeds because we give Sally a title.

# Let's try this on our list of attendees:

File.foreach("attendees") do |line|
  re = %r{ ^(?>
             (?:(?<title>Mrs | Mr | Ms | Dr )\s)? (.*?) \s and \s 
          )
             (?(<title>)\g<title>\s) (.+)   
        }x 
  if line =~ re 
    print "VALID:    "
  else
    print "INVALID:  "
  end
  puts line 
end

# There we are! The entries are valid if both names, or neither, have titles, and are invalid otherwise.
