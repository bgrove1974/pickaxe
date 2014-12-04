#!/usr/bin/ruby

# Our next task is to calculate word frequencies.
# Create a hash object indexed by the words in our list.
# Each entry in this hash stores the number of times the word occurred.
# Create a hash object using Hash.new(0).

def count_frequency(word_list)
  counts = Hash.new(0)
  for word in word_list
    counts[word] += 1
  end
  counts
end

##p count_frequency(["sparky", "the", "cat", "sat", "on", "the", "mat"])
