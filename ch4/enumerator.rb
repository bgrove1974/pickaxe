#!/usr/bin/ruby

a = [ 1, 3, "cat"]
h = { dog: "canine", fox: "vulpine" }

# Create Enumerators
enum_a = a.to_enum
enum_h = h.enum_for   # to_enum and enum_for are synonymous methods

puts enum_a.next  # => 1
puts enum_h.next  # => [:dog, "canine"]
puts enum_a.next  # => 3
puts enum_h.next  # => [:fox, "vulpine"]

a = [ 1, 3, "cat"]

enum_a = a.each  # create an Enumerator using an internal iterator

p enum_a.next  # => 1
p enum_a.next  # => 3

# Ruby has a method called 'loop' that does nothing but repeatedly invoke its block.

short_enum = [ 1, 2, 3 ].to_enum
long_enum  = ('a'..'z').to_enum

loop do
  puts "#{short_enum.next} - #{long_enum.next}" 
end
# The loop ends when the three-element enumerator runs out of values.
