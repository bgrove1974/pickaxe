# The Ruby case expression is a powerful beast: a multiway if statement on steroids. And just to make it more powerful, it comes in two flavors.

# The first form is fairly close to a series of statements; it lets you list a series of conditions and execute a statement corresponding to the first one that is true:

case 
  when song.name == "Misty"
    puts "Not again!"
  when song.duration > 120
    puts "Too long!"
  when Time.now.hour > 21
    puts "It's too late"
  else
    song.play
end 

# The second form of the case statement is probably more common
# Specify a target at the top of the case statement, and each when clause lists one or more comparisons to be tested against that target:

case command
when debug
  dump_debug_info
  dump_symbols
when /p\s+(\w+)/
  dump_variable($1)
when "quit", "exit"
  exit
else
  print "Illegal command: #{command}"
end

# As with if, case returns the value of the last expression executed, and you can use a then keyword if the expression is on the same line as the condition:

kind = case year
       when 1850..1889 then "Blues"
       when 1890..1909 then "Ragtime"
       when 1910..1929 then "New Orleans Jazz"
       when 1930..1939 then "Swing"
       else                 "Jazz"
       end

# case operates by comparing the target (the expression after the keyword case) with each of the comparison expressions after the when keywords.
# This test is done using comparison === target.
# As long as a class defines meaningful semantics for === (and all of the built-in classes do), objects of that class can be used in case expressions.
# For example, regular expressions define === as a simple pattern match:

case line
when /title=(.*)/
  puts "Title is #$1"
when /track=(.*)/
  puts "Track is #$1"
end

# Ruby classes are instances of class Class. The === operator is defined in Class to test whether the argument is an instance of the receiver or one of its superclasses.
# So (abandoning the benefits of polymorphism and bringing the gods of refactoring down around your ears), you can test the class of objects:

case shape
when Square, Rectangle
  # ...
when Circle
  # ...
when Triangle
  # ...
else
  # ...
end
