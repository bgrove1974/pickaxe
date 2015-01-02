# Regular expressions are instances of the class Regexp. You can assign them to variables, pass them to methods, and so on.

str = "dog and cat"
pattern = /nd/
puts pattern =~ str  # If the string matches the expression, the operator returns the offset
puts str =~ pattern  # What is returned is no the matched digit, but the zero based location of that digit

# You can also create regular expression objects by by calling the Regexp class's new method or by using the %r{...} syntax. The %r syntax is particularly useful when creating patterns that contain forward slashes.

p /mm\/dd/  # using p instead of puts changes the output; check the Ruby docs under Kernel
p Regexp.new("mm/dd")
p %r{mm/dd}
