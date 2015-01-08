# Earlier we noted that the sequences \1, \2, and so on, are available in the pattern, standing for the nth group matched so far. The same sequences can be used in the second argument of sub and gsub.

puts "fred:smith".sub(/(\w+):(\w+)/, '\2, \1')
puts "nercpyitno".gsub(/(.)(.)/, '\2\1')
puts " "

# You can also reference named groups:

puts "fred:smith".sub(/(?<first>\w+):(?<last>\w+)/, '\k<last>, \k<first>')
puts "nercpyitno".gsub(/(?<c1>.)(?<c2>.)/, '\k<c2>\k<c1>')
puts " "

# Additional backslash sequences work in substitution strings:
# \&(last match)
# \+(last matched group)
# \`(string prior to match)
# \'(string after match)
# \\(a literal backslash)

# It gets confusing if you want to include a literal backslash in a substitution. The obvious(???) thing to write is:
# str.gsub(/\\/, '\\\\')
# The above code is trying to replace each backslash in str with two backslashes. The following nightmare ensues:

# Note - the following examples have an output that differs slightly from the output in the text. I would like to think that this is because I am using Ruby 2.1.2 and the book is using Ruby 1.9 and 2.0, but I am not sure.

str = 'a\b\c'
puts str 
p str.gsub(/\\/, '\\\\\\\\')
p str.gsub(/\\/, '\\\\')
puts " "

# However, using the fact that \& is replaced by the matcched string, you could also write this:

str = '\a\b\c'
puts str 
p str.gsub(/\\/, '\&\&')
p str.gsub(/\//, '\&\&')
puts " "

# If you use the block form of gsub, the string for substitution is analyzed only once ( during the syntax pass), and the result is what is intended:

str = '\a\b\c'
puts str
p str.gsub(/\\/) { '\\\\' }
p str.gsub(/\//) { '\\\\' }

# By now, you're asking, "WTF?!?!", and rightly so. Here is what I learned about the above code:
# The code is trying to replace each backslash in str with two. I don't know why someone would want to do that, but I didn't write the book. The backslashes in the replacement text are doubled up, because they will be converted to \\ in syntax analysis.
# However, when the substitution occurs, the regular expression engine performs another pass throught the string, converting \\ to \, so the net effect is to replace each single backslash with another single backslash.
# Now, my guess is that someone figured out a better way to deal with this situation between the time this book was published and the release of Ruby 2.1.2 (the version I am using), because the code I am typing in gives differnt results from the output of the text (as stated above).
