# Within a pattern, all characters match themselves except:
# . | () [] {} + \ ^ $ * ? 

# The above characters must be escaped with a backslash if you want them to be treated as regular characters to match.

def show_regexp(string, pattern)
  match = pattern.match(string)
  if match
    "#{match.pre_match}->#{match[0]}<-#{match.post_match}"  
  else
    "no match"
  end
end

p show_regexp('yes | no', /\|/)
p show_regexp('yes (no)', /\(no\)/)
p show_regexp('are you sure?', /e\?/)
