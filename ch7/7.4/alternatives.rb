# Conditional subpatterns can also have an else clause.

# (?(group_id) true-pattern | fail-pattern )

# If the identified group was previously matched, the true pattern is applied. If it failed, the fail pattern is applied.

# Here is a regexp that deals with red or blue balls or buckets. The colors of the ball and bucket must be different.

re = %r{(?:(red)|blue) ball and (?(1)blue|red) bucket}

p re.match("red ball and blue bucket")
p re.match("blue ball and red bucket")
p re.match("blue ball and blue bucket")
p re.match("red ball and red bucket")

# Now pay attention:
# If the first group, the red alternative, matched, then the conditional subpattern is blue, otherwise it is red.
# That is why the first entry returned "red" and the second one returned nil (the last two returned nil as well).
