# There are many ways of creating a regular expression pattern. By far the most common is to write it between forward slashes.

# /cat/    matches "dog and cat" and "catch" but not "Cat" or "c.a.t"
# /123/    matches "86512312" and "abc123" but not "1.23"
# /t a b/  matches "hit a ball" but not "table"

# If you want to match one of the special characters literally in a pattern, precede it with a backslash.
# /\*/ is a pattern that matches a single asterisk, /\// is a pattern that matches a forward slash.

# Pattern literals are like double-quoted strings. In particular, you can use #{...} expression substitutions in the pattern.

# The Ruby operator =~ matches a string against a pattern. It returns the character offset into the string at which the match occurred:

p /cat/ =~ "dog and cat"
p /cat/ =~ "catch"
p /cat/ =~ "Cat"

# You can put the string first if you prefer:

p "dog and cat" =~ /cat/
p "catch"       =~ /cat/
p "Cat"         =~ /cat/

# Because pattern matching returns nil when it fails, and because nil is equivalent to the boolean false, you can use the result of a pattern match as a condition in statements such as if and while.

str = "cat and dog"

if str =~ /cat/
  puts "There's a cat in here somewhere."
end

# The following code prints lines in 'testfile' that have the string 'on' in them:

File.foreach("testfile").with_index do |line, index|
  puts "#{index}: #{line}" if line =~ /on/
end
puts " "

# You can test to see whether a pattern does not match a string using !~:

File.foreach("testfile").with_index do |line, index|
  puts "#{index}: #{line}" if line !~ /on/
end
