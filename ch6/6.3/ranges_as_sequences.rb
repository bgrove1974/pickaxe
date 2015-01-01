# The first and most natural use of ranges is to express a sequence. In Ruby, sequences are created using the .. and ... range operators. The two-dot form creates an inclusive range, and the three-dot form creates a range that excludes the specified high value.
# You can convert a range to an array using using the to_a method and convert it to an Enumerator object using to_enum.

puts (1..10).to_a
puts ('bar'..'bat').to_a
enum = ('bar'..'bat').to_enum
puts enum.next
puts enum.next
puts " "
# Ranges have methods that let you iterate over them and test their contents in a variety of ways.
 
digits = 0..9
puts digits.include?(5)
puts digits.max
puts digits.reject { |i| i < 5 }
puts digits.inject(:+)

# Ruby ranges can be based on objects that you define. The only constraints are that the objects must respond to succ by returning the next object in a sequence and the objects must be comparable using the spaceship operator <=>.
# The spaceship operator <=> compares two values, returning -1, 0, 0r +1 depending on whether the first is less than, equal to, or greater than the second.
# In reality, this isn't something that you do very often, so examples tend to be a bit contrived. This example is a class that presents numbers that are powers of 2. Because it defines <=> and succ, we can use objects of this class in ranges.

class PowerOfTwo
  attr_reader :value
  def initialize(value)
    @value = value 
  end
  def <=>(other)
    @value <=> other.value 
  end
  def succ
    PowerOfTwo.new(@value + @value)
  end
  def to_s
    @value.to_s
  end
end

p1 = PowerOfTwo.new(4)
p2 = PowerOfTwo.new(32)

puts (p1..p2).to_a

# A note about memory usage: The range 1..100000 is held as a Range object containing references to two Fixnum objects. However, if you convert that range into an array, then a lot more memory will be used to store the 100,000 numbers.
