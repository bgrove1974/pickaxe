# Once you have a regular expression object, you can match it against a string using the Regexp#match(string) method or the match operators =~ (positive match) and !~ (negative match). The match operators are defined for both String and Regexp objects. One operand of the match operator must be a regular expression.

name = "Fats Waller"
p name =~ /a/
p name =~ /z/
p /a/ =~ name
p /a/.match(name)
p Regexp.new("all").match(name)

# The match operators return the charactere position at which the match occurred, while the match method returns a MatchData object. If the match fails, nil is returned.
