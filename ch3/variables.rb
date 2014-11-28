#!/us/bin/ruby

person = "Ben" # person is a local variable
puts "The object in 'person' is a #{person.class}"
puts "The object has an id of #{person.object_id}"
puts "and a value of '#{person}'"

# In Ruby, a variable is not an object; a variable is a reference to an object.

person1 = "Tim"
person2 = person1
person1[0] = 'J'

puts "person1 is #{person1}"
puts "person2 is #{person2}"

# Assignment aliases objects, potentially giving you multiple variables that reference the same object.
# We can avoid aliasing by using the 'dup' method of String, which creates a new string object with identical contents.

person1 = "Tim"
person2 = person1.dup
person1[0] = "J"

puts "person1 is #{person1}"
puts "person2 is #{person2}"

# We can prevent anyone from changing a particular object by freezing it.
# Attempt to alter a frozen object, and Ruby will raise a RuntimeError exception.

person1 = "Tim"
person2 = person1
person1.freeze  # prevent modification of the object
person2[0] = "J"
