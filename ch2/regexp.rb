#!/usr/bin/ruby

# Some useful regular expressions
/\d\d:\d\d:\d\d/     # a time such as 12:34:56
/Perl.*Python/       # Perl, zero or more other characters, then Python
/Perl Python/        # Perl, a space, and Python
/Perl *Python/       # Perl, zero or more spaces, and Python
/Perl +Python/       # Perl, one or more spaces, and Python
/Perl\s+Python/      # Perl, whitespace characters, then Python
/Ruby (Perl|Python)/ # Ruby, a space, and either Perl or Python

# Write a message if a string contains the text 'Perl' or 'Python'
line = gets
if line =~ /Perl|Python/  # The =~ is called the match operator
  puts "Scripting language mentioned: #{line}"
end

# The part of a string matched by a regular expression can be replaced with
# different text using one of Ruby's substitution methods:
line = gets
newline   = line.sub(/Perl/, 'Ruby')        # Replace first 'Perl' with 'Ruby'
newerline = newline.gsub(/Python/, 'Ruby')  #Replace every 'Python' with 'Ruby'

# Replac every occurrence of 'Perl' and 'Python' with 'Ruby':
line = gets
newline = line.gsub(/Perl|Python/, 'Ruby')
