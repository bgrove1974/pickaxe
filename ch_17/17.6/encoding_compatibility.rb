# Before Ruby performs operations involving strings or regular expressions, it first has to check that the operation makes sense.
# For example, it is valid to perform an equality test between two strings with different encodings, but it is not valid to append one to the other.
# The basic steps in this checking are as follows:

# 1. If the two objects have the same encoding, the operation is valid.
# 2. If the two encodings each contain only 7-bit characters, the operation is permitted regardless of the encodings.
# 3. If the encodings in the two objects are compatible (which we'll discuss next), the operation is permitted.
# 4. Otherwise, an exception is raised.

# Let's say you have a set of text files containing markup.
# In some of the files, authors used the sequence &hellip; to represent an ellipsis.
# In other files, which have UTF-8 encoding, authors used an actual ellipsis character (\u2026).
# We want to convert both forms to three periods.

# We can start off with a simplistic solution:

# encoding: utf-8 
while line = gets
  result = line.gsub(/&hellip;/, "...")
               .gsub(/\u2026/, "...") # unicode ellipsis
  puts result
end

# In my environment, the content of files is by default assumed to be UTF-8.
# Feed our code ASCII files and UTF-encoded files, and it works just fine.
# But what happens when we feed it a file that contains ISO-8859-1 characters?

# $ dots.rb:4:in `gsub': broken UTF-8 string (ArgumentError)

# Ruby tries to interpret the input text, which is ISO-8859-1 encoded, as UTF-8.
# Because the byte sequences in the file aren't valid UTF, it failed.

# There are three solutions to this problem.

# The first is to say that it makes no sense to feed files with both ISO-8859-1 and UTF-8 encoding to the smae program without somehow differentiating them.
# That's perfectly true.
# This approach means we'll need some command-line options, liberal use of force_encoding, and probably some kind of code to delegate the pattern matching to different sets of patterns depending on the encoding of each file.

# A second hack is to simply treat both the data and the program as ASCII-8BIT and perform all of the comparisons based on the underlying bytes.
# This isn't particularly reliable, but it might work in some circumstances.

# The third solution is to choose a master encoding and to transcode strings into it before doing the matches.
# Ruby provides built-in support for this with the default_internal encoding mechanism.