# Ruby supports all of the standard boolean operators. Both the keyword 'and' and the operator && return their first argument if it is false. Otherwise, they evaluate and return their second argument (this is sometimes known as 'shortcircuit' evaluation).
# The only difference in the two forms 'and' and && is precedence; 'and' binds lower than &&.

p nil   && 99
p false && 99
p "cat" && 99
puts " "

# Thus, && and 'and' both return a true value only if both of their arguments are true, as expected.
# Similarly, both 'or' and || return their first argument unless it is false, in which case they evaluate and return their second argument.

p nil   || 99
p false || 99
p "cat" || 99
puts " "

# As with 'and', the only difference between 'or' and || is their precedence. To make life interesting, 'and' and 'or' have the same precedence, but && has a higher precedence than ||.

# A common idiom is to use ||= to assign a value to a variable only if that variable isn't already set.

p var ||= "default value"
puts " "

# This is almost, but not quite, the same as var = var || "default value".
# It differs in that no assignment is made at all if the variable is already set. 
# In pseudocode, this might be written as var = "default value" unless var, or as var || var = "default value".

# 'not' and ! return the opposite of their operand (false if the operand is true, and true if the operand is false).
# 'not' and ! differ only in precedence.

# All of the above precedence rules are summarized in Table 13 "Ruby operators (high to low precedence)" on pp 318.
