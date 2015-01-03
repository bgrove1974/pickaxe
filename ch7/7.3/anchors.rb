def show_regexp(string, pattern)
  match = pattern.match(string)
  if match
    "#{match.pre_match}->#{match[0]}<-#{match.post_match}"  
  else
    "no match"
  end
end

# Within a pattern, all characters match themselves except:
# . | () [] {} + \ ^ $ * ? 

# The above characters must be escaped with a backslash if you want them to be treated as regular characters to match.
# Now, let's see what some of these characters mean if you use them without escaping them.

# By default, a regexp will try to find the first match for the pattern in a string. Match /iss/ against the string "Mississippi", and it will find the substring "iss" starting at position 1 (the second character in the string). But what if you want to force a pattern to match only at the start or end of a string?

# The patterns ^ and $ match the beginning and end of a line, respectively.
# These are often used to anchor a pattern match; for example, /^option/ matches the word "option" only if it appears at the start of a line. Similarly, the sequence \A matches the beginning of a string, and \z and \Z match the end of a string.
# Actually, \Z matches the end of a string unless the string ends with \n, in which case it matches just before the \n.

str = "this is\nthe time"
puts str

p show_regexp(str, /^the/)
p show_regexp(str, /is$/)
p show_regexp(str, /\Athis/)
p show_regexp(str, /\Athe/)  # no match
puts " "

# Similarly, the patterns \b and \B match word boundaries and nonword boundaries, respectively.
# Word characters are ASCII letters, numbers, and underscores.

p show_regexp(str, /\bis/)
p show_regexp(str, /\Bis/)
