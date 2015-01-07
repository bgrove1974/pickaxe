# Pattern-Based Substitution
# The substitution methods sub and gsub can be used if the pattern contains repetition, alternation, and grouping.

a = "quick brown fox"
puts a 
p a.sub(/[aeiou]/, '*')
p a.gsub(/[aeiou]/, '*')
p a.sub(/\s\S+/, '')
p a.gsub(/\s\S+/, '')
puts " "

# The substitution methods can take a string or a block. If a block is used, it is passed the matching substring, and the block's value is substituted into the original string.

a = "quick brown fox"
puts a 
p a.sub(/^./) {|match| match.upcase }
p a.gsub(/[aeiuo]/) {|vowel| vowel.upcase }
puts " "

# Normalize names entered by users into a web application. The following method is a simple first iteration. The pattern that matches the first character of a word is \b\w -- look for a word boundary followed by a word character. Combine this with gsub, and we can hack the names.

def mixed_case(name)
  name.downcase.gsub(/\b\w/) {|first| first.upcase }
end

p mixed_case("BENJAMIN GROVE")
p mixed_case("benjamin grove")
p mixed_case("bEnJamiN grOVe")
puts " "

# Here's an idiomatic way to write the substitution in Ruby 1.9:

def mixed_case(name)
  name.downcase.gsub(/\b\w/, &:upcase)
end

p mixed_case("bEnJamiN grOVe")
puts " "

# You can also give sub and gsub a hash as the replacement parameter, in which case they will look up matched groups and use the corresponding values as replacement text:

replacement = { "cat" => "feline", "dog" => "canine" }
replacement.default = "unknown"
p "cat and dog".gsub(/\w+/, replacement)
