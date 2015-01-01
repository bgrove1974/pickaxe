# The sub method takes a pattern and some replacement text. If it finds a match for the pattern in the string, it replaces the matched substring with the replacement text.

str = "Dog and Cat"
new_str = str.sub(/Cat/, "Gerbil")
puts "Let's go to the #{new_str} for a pint."

# The sub method changes only the first match it finds. To replace all matches, use gsub (g stands for global).

str = "Dog and Cat"
new_str1 = str.sub(/a/, "*")
new_str2 = str.gsub(/a/, "*")
puts "Using sub: #{new_str1}."
puts "Using gsub: #{new_str2}."

# Both sub and gsub return a new string. If you want to modify the original string, use sub! and gsub!.

str = "now is the time"
str.sub!(/i/, "*")
str.gsub!(/t/, "T")
puts str

# When using sub and gsub, if no substitutions are made, the new string will be a copy of the original.
# When using sub! and gsub!, the string is returned only if the pattern was matched. If no match for the pattern is found in the string, they return nil instead.
 