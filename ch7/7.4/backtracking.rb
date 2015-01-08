# We are searching for a sequence of Xs not followed by an O:

re = /(X+)(?!O)/
# This one works:
p re =~ "test XXXY"
p $1
# But, unfortunately, so does this one:
p re =~ "test XXXO"
p $1
puts " "

# Backtracking -- when a match fails, the engine goes back and tries to match a different way. In this case, by backtracking past a single character, it looks at the second X in the string instead of the third X (right before the O). The negative lookahead succeeds, and the pattern matches. That is why the result of the second program above has 2 Xs.
# In order to get what we want, we have to tell Ruby not to backtrack once it finds a string of Xs.

# There are a couple of ways of doing this:

# The sequence (?<re) nests an independent regular expression within the first regular expression. This expression is anchored at the current match position. If it consumes characters, these will no longer be available to the higher-level regexp, thereby inhibiting backtracking.

re = /((?>X+))(?!O)/
# This one works
p re =~ "test XXXY"
p $1
# Now this doesn't match 
p re =~ "test XXXO"
p $1
# And this finds the second string of Xs 
p re =~ "test XXXO XXXXY"
p $1
puts " "

# You can also control backtracking by using a third form of repetition called possessive repetition.
# Possessive repetition behaves like greedy repetition, consuming as much of the string as it can. However, once part of the string is consumed, it cannot be reexamined by the pattern because the regular expression engine can't backtrack past a possessive qualifier. A possessive repetition is coded by using a plus sign after the repetition character.

re = /(X++)(?!O)/
# This one works
p re =~ "test XXXY"
p $1
# Now this doesn't match 
p re =~ "test XXXO"
p $1
# And this finds the second string of Xs 
p re =~ "test XXXO XXXXY"
p $1
puts " "
