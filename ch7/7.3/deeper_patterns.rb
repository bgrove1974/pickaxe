require_relative 'show_regexp'

# Within a pattern, all characters match themselves except:
# . | () [] {} + \ ^ $ * ? 

# The above characters must be escaped with a backslash if you want them to be treated as regular characters to match.

p show_regexp('yes | no', /\|/)
p show_regexp('yes (no)', /\(no\)/)
p show_regexp('are you sure?', /e\?/)
