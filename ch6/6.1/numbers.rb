num = 10001
4.times do 
  puts "#{num.class}: #{num}"
num *= num
end

# You write integers using an optional leading sign, an optional base indicator (0 for octal, 0d for decimal [the default], 0x for hexadecimal, or 0b for binary), followed by a string of digits in the appropriate base. Underscore characters are ignored in the digital string, and can be used instead of commas in larger numbers.

# 123456                   => 123456  # Fixnum
# 0d123456                 => 123456  # Fixnum
# 123_456                  => 123456  # Fixnum - underscore ignored
# -543                     => -543    # Fixnum - negative number
# 0xaabb                   => 43707   # Fixnum - hexadecimal
# 0377                     => 255     # Fixnum - octal
# -0b10_1010               => -42     # Fixnum - binary (negated)
# 123_456_789_123_456_789  => 123456789123456789  # Bignum

# A numeric literal with a decimal point and/or an exponent is turned into a Float object, corresponding to the native architechture's double data type.
# Ruby doesn't have a literal syntax for representing rational and complex numbers, but does support both.
# Rational numbers are the ratio of two integers -- they are fractions -- and have an exact representation (unlike floats).
# Complex numbers represent points on the complex plane and have two components, the real and imaginary parts.
# We can create rational and complex numbers using explicit calls to the constructor methods Rational and Complex.
# Using the mathn library makes working with rational numbers easier.

p Rational(3, 4) * Rational(2, 3)     # => (1/2)
p Rational("3/4") * Rational("2/3")   # => (1/2)

p Complex(1, 2) * Complex(3, 4)       # => (-5+10i)
p Complex("1+2i") * Complex("3+4i")   # => (-5+10i)

# All numbers are objects and respond to a variety of messages eg. absolute value of a number can be found with num.abs.

# Strings that contain digits are not automatically converted into numbers when used in expressions.
# For example, say we want to find the sum of two numbers on the following lines:

# 3 4
# 5 6
# 7 8

# The following code DOESN'T work:

# some_file.each do |line|
#   v1, v2 = line.split   # split line on spaces
#   print v1 + v2, " "
# end
# => 34 56 78

# The problem is that the input was read as strings, not numbers. The + operator concatenates strings, so that's what we see in the output. To fix this, use the Integer method to convert the strings to integers.

# some_file.each do |line|
#   v1, v2 = line.split
#   print Integer(v1) + Integer(v2), " "
# end
# => 7 11 15