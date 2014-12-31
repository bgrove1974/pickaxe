# Every string has an associated encoding. Default encoding of string literals is US-ASCII for Ruby 1.9 and UTF-8 for Ruby 2.

plain_string = "dog"
puts "Ruby version is #{RUBY_VERSION}"
puts "Encoding of #{plain_string.inspect} is #{plain_string.encoding}."

# If you override the encoding, you will do that for all strings in the file.
# encoding: utf-8

plain_string = "dog"
puts "Encoding of #{plain_string.inspect} is #{plain_string.encoding}."
utf_string = "∂og"
puts "Encoding of #{utf_string.inspect} is #{utf_string.encoding}."
