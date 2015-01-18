# The defined? operator returns nil if its argument (which can be an arbitary expression) is not defined; otherwise, it returns a description of that argument. 
# If the argument is yield, defined? returns the string "yield" if a code block is associated with the current context.

p defined? 1
p defined? dummy
p defined? printf
p defined? String 
p defined? $_
p defined? Math::PI 
p defined? a = 1 
p defined? 42.abs
p defined? nil 
