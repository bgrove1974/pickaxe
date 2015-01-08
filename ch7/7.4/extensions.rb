# Ruby uses the Onigmo regular expression library. 
# The sequence (?#comment) inserts a comment into the pattern.
# (?:re) makes re into a group without generating backreferences.

date = "12/25/2010"
puts date
date =~ %r{(\d+)(/|:)(\d+)(/|:)(\d+)}
p [$1,$2,$3,$4,$5]
date =~ %r{(\d+)(?:/|:)(\d+)(?:/|:)(\d+)}
p [$1,$2,$3]
