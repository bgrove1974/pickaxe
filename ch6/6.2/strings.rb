# Ruby strings are sequences of characters and are objects of class String. They normally hold printable characters, but they can also hold binary data.

# Escaping from single-quoted strings:
p 'Escape using "\\"'  # The output is supposed to be => escape using "\"; I'm not messing with it any more.
p 'That\'s right'

# Double-quoted strings support many more escape sequences. For example, you can substitute the value of any Ruby code into a string using the sequence #{ expr }. If the code is a global, class, or instance variable, you can omit the braces.
p "Seconds/day: #{24*60*60}"
p "#{'Ho! '*3}Merry Christmas!"
p "Safe level is #$SAFE"

# The interpolated code can be one or more statements, not just an expression:
puts "Now is #{ def the(a)
                  'the ' + a
                end
                the('time')
              } for all bad coders..."

# You have three more ways to construct string literals: %q, %Q, and 'here documents' (no single quotes). %q starts delimited single-quoted strings, and %Q starts delimited double-quoted strings.
p %q/general single-quoted string/
p %Q!general double-quoted string!
p %Q{Seconds/day: #{24*60*60}}

# In fact, the Q is optional:
p %!general double-quoted string!
p %{Seconds/day: #{24*60*60}}

# The character following the q or Q is the delimiter. If it is an opening bracket [, brace {, parenthesis (, or less-than sign <, the string is read until the matching close symbol is found. Otherwise, the string is read until the next occurrence of the same delimiter. The delimiter can be any nonalphanumeric or nonmultibyte character.

# Finally, you can construct a string using a here document:
string = <<END_OF_STRING 
The body of the string is the input lines up to the one starting with the same text that followed the '<<'.
END_OF_STRING
p string 

# A here document consists of lines in the source up to but not including the termination string that you specify after the << characters. Normally, this terminator must start in column one. However, if you put a minus sign after the << characters, you can indent the terminator:
string = <<-END_OF_STRING 
  The body of the string is the input lines up to the one
  starting with the same text that followed the '<<'.
  END_OF_STRING
p string 

# You can also have multiple here documents on a single line. Each acts as a separate string. The bodies of the here documents are fetched sequentially from the source lines that follow:
print <<-STRING1, <<-STRING2
Concat
STRING1
      enate
      STRING2
# Ruby does not strip leading spaces off the contents of the strings in these cases.
