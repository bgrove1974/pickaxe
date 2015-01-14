# We've sen that if you prefix the name of a parameter with an asterisk, multiple arguments in the call to the method will be passed as an array. The same thing works in reverse.
# When you call a method, you can convert any collection or enumerable object into its constituent elements and pass those elements as individual parameters to the method. Do this by prefixing array arguments with an asterisk.

def five(a, b, c, d, e)
  "I was passed #{a} #{b} #{c} #{d} #{e}"
end

p five(1, 2, 3, 4, 5)
p five(1, 2, 3, *['a', 'b'])
p five(*['a', 'b'], 1, 2, 3)
p five(*(10..14))
p five(*[1,2], 3, *(4..5))

# As of Ruby 1.9, splat arguments can appear anywhere in the parameter list, and you can intermix splat and regular arguments.
