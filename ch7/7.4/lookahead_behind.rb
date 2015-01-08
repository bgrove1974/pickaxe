require_relative 'show_regexp'

# Lookahead and Lookbehind
# You'll sometimes want to match apattern only if the matched substring is preceded by or followed by some other pattern.
# For example, you want to match every word in a string that is followed by a comma, but you don't want the comma to form part of the match.
# The zero-width positive lookahead extension: (?=re) matches re at this point but does not consume it.
# The following example uses scan to pick out words:

str = "red, white, and blue"
puts str 
p str.scan(/[a-z]+(?=,)/)
puts " "

# You can also match before the pattern using (?<=re), aka zero-width positive lookbehind.
# This lets you look for characters that precede the context of a match without affecting $&.
# The following example matches the letters dog but only if they are preceded by the letters hot:

p show_regexp("seadog hotdog", /(?<=hot)dog/)
puts " "

# For the lookbehind extension, re either must be a fixed length or consist of a set of fixed-length alternatives.
# That is, (?<=aa) and (?<=aa|bbb) are valid, but (?<=a+b) is not.

# Both forms have negated versions, (?!re) and (?<!re), which are true if the context is not present in the target string.

# The \K sequence is related to backtracking. If included in a pattern, it doesn't affect the matching process.
# However, when Ruby comes to store the entire matched string in $& or \&, it only stores the text to the right of the \K.

p show_regexp("thx1138", /[a-z]+\K\d+/)
