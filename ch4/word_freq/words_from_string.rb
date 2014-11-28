#!/usr/bin/ruby

# Method that splits a string into words.
# 'scan' returns an array of substrings that match a given pattern.
# (/[\w']+/) matches sequences containing "word characters" and single quotes.
def words_from_string(string)
  string.downcase.scan(/[\w']+/)
end
# p words_from_string("But I didn't inhale, he said (emphatically")
