# encoding: utf-8

# Yes, the default encoding for Ruby 2+ is UTF-8, but I'm specifying it anyway. So there.

# As we've already seen, strings, symbols, and regular expressions are now labeled with their encoding.
# You can convert a string from one encoding to another using the String#encode method.
# For example, we can convert the word olé from UTF-8 to IS0-8859-1:

p ole_in_utf = "olé"
p ole_in_utf.encoding 
p ole_in_utf.bytes.to_a 

p ole_in_8859 = ole_in_utf.encode("iso-8859-1")
p ole_in_8859.encoding 
p ole_in_8859.bytes.to_a 
puts " "

# You have to be careful when using encode -- if the target encoding doesn't contain characters that appear in your source string, Ruby will throw an exception.
# For example, the π character is available in UTF-8 but not in IS0-8859-1:

# p pi = "pi = π"                 ##! Uncomment this if you really want to see the error message,
# p pi.encode("iso-8859-1")       ##! but it will stop the rest of the program from executing.
# puts " "                     

# You can, however, override this behavior, for example supplying a placeholder character to use when no direct translation is available.
# See the description of String#encode in the reference section on pp 675 for more details.

p pi = "pi = π"
p pi.encode("iso-8859-1", :undef => :replace, :replace => "??")
puts " "

# Now move along to 'then_ascii8bit.rb' for the rest of this section.
