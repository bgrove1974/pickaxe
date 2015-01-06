require_relative 'show_regexp'

# A character class is a set of characters between brackets: [characters] matches any single character between the brackets, so  [aeiou] matches a vowel, [,.:;!?] matches some punctuation, and so on.
# The significance of the special regular expression characters [.|(){}+^$*?] is turned off inside the brackets. However, normal string substitution still occurs, so (for example) \b represents a backspace character, and \n represents a new line.
# In addition, you can use the abbreviations shown in Table 2, Character class abbreviations, pp101, so that \s matches any whitespace character, not just a literal space.

p show_regexp('Price $12.', /[aeiou]/)
p show_regexp('Price $12.', /[\s]/)
p show_regexp('Price $12.', /[$]/)
p show_regexp('Price $12.', /[$.]/)
puts " "

# Within the brackets, the sequence c1-c2 represents all the characters from c1 to c2 in the current encoding:

a = 'see [The PickAxe-page 123]'
puts a
p show_regexp(a, /[A-F]/)
p show_regexp(a, /[A-Fa-f]/)
p show_regexp(a, /[0-9]/)
p show_regexp(a, /[0-9][0-9]/)
puts " "

# You can negate a character class by putting a caret ^ immediately after the opening bracket.

p show_regexp('Price $12.', /[^A-Z]/)
p show_regexp('Price $12.', /[^\w]/)
p show_regexp('Price $12.', /[a-z][^a-z]/)
p show_regexp('Price $12.', /[^a-z]/)
p show_regexp('Price $12.', /[A-Z][^a-z]/)
puts " "

# Some character classes are used so frequently that Ruby provides abbreviations for them; they may be used both within brackets and in the body of a pattern.

p show_regexp('It costs $12.', /\s/)
p show_regexp('It costs $12.', /\d/)
puts " "

# Refer to Table 2, Character class abbreviations, pp 101.
# Some of the character classes have different interpretations depending on the character set option defined for the regular expression. Basically, these options tell the regexp engine whether (for example) word characters are just the ASCII alphanumerics, or whether they should be extended to include Unicode letters, marks, numbers, and connection punctuation.
# The options are set using the sequence (?option), where the option is one of d (for Ruby 1.9 behavior), a for ASCII-only support, and u for full Unicode support. If you don't specify an option, it defaults to (?d).

p show_regexp('über.', /(?a)\w+/)
p show_regexp('über.', /(?d)\w+/) 
p show_regexp('über.', /(?u)\w+/)
puts " "
p show_regexp('über.', /(?a)\W+/)
p show_regexp('über.', /(?d)\W+/)
p show_regexp('über.', /(?u)\W+/)
puts " "

# The POSIX character classes correspond to the ctype(3) macros of the same names. They can also be negated by putting a caret after the first colon.

p show_regexp('Price $12.', /[aeiou]/)
p show_regexp('Price $12.', /[[:digit:]]/)
p show_regexp('Price $12.', /[[:space]]/)
p show_regexp('Price $12.', /[[:^alpha:]]/)
p show_regexp('Price $12.', /[[:punct:]aeiou]/)
puts " "

# If you want to include the literal characters ] an - in a character class, escape them with \

a = 'see [The PickAxe-page 123]'
puts a
p show_regexp(a, /[\]]/)
p show_regexp(a, /[0-9\]]/)
p show_regexp(a, /[\d\-]/)
puts " "

# You can create the intersection of character classes using &&.
# To match all lowercase ASCII letters that aren't vowels, you could use this:

str = "now is the time"
puts str 
p str.gsub(/[a-z&&[^aeiou]]/, '*')
puts " "

# The \p construct gives you an encoding-aware way of matching a particular Unicode property.
# encoding: utf-8

string = "∂y/∂x = 2πx"
puts string
p show_regexp(string, /\p{Alnum}/)
p show_regexp(string, /\p{Digit}/) 
p show_regexp(string, /\p{Space}/) 
p show_regexp(string, /\p{Greek}/) 
p show_regexp(string, /\p{Graph}/)
puts " "

# Finally, a period(.) appearing outside brackets represents any character except a newline.
# Although, in multiline mode it matches a newline too.

a = 'It costs $12.'
puts a 
p show_regexp(a, /c.s/)
p show_regexp(a, /./)
p show_regexp(a, /\./)
  