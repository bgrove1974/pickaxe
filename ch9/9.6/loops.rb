# Ruby has pretty primitive looping constructs.
# The while loop executes its body zero or more times as long as its condition is true.
# For example, this common idiom reads until the input is exhausted:

# while line = gets
  # ...
# end   ##! This code will run forever 

# The until loop is the opposite; it executes the body until the condition becomes true:

until play_list.duration > 60
  play_list.add(song_list.pop)
end

# As with if and unless, you can use both of the loops as statement modifiers:

a = 1
a *= 2 while a < 100
p a     # => 128
a -= 10 until a < 100
p a     # => 98

# Back in the section on boolean expressions on pp 134, we said that a range can be used as a kind of flip-flop, returning true when some event happens and staying true until a second event occurs. This facility is normally used within loops.
# In the example that follows, we read a text file containing the first ten ordinal numbers ("first", "second", and so on), but print only the lines starting with the one that matches "third" and ending with one that matches "fifth":

file = File.open("ordinal")
while line = file.gets
  puts(line)  if line =~ /third/ .. line =~ /fifth/
end

# Produces:
# third
# fourth
# fifth

# You may find folks who come from Perl writing the previous example slightly differently:

file = File.open("ordinal")
while file.gets
  print  if ~/third/ .. ~/fifth/
end

# This uses some behind-the-scenes magic behavior:
# gets assigns the last line read to the global variable $_, the ~ operator does a regular expression match against $_, and print with no arguments prints $_. This kind of code is falling out of fashion in the Ruby community and may end up being removed from the language.

# The start and end of a range used in a boolean expression can themselves be expressions.
# These are evaluated each time the overall boolean expression is evaluated. For example, the following code uses the fact that the variable $. contains the current input line number to display line numbers 1 through 3 as well as those between a match of /eig/ and /nin/:

File.foreach("ordinal") do |line|
  if (($. == 1) || line =~ /eig/) .. (($. ==3) || line =~ /nin/)
    print line 
  end
end

# Produces:
# first
# second
# third
# eigth
# ninth

# You will come across a wrinkle when you use while and until as statement modifiers.
# If the statement they are modifying is a begin...end block, the code in the block will always execute at least one time, regardless of the value of the boolean expression:

print "Hello\n" while false
begin
  print "Goodbye\n"
end while false

# Produces:
# Goodbye 
