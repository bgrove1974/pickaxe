# We've already seen how to associate a block with a method call:

# collection.each do |member|
#   #...
# end

# Normally, this is good enough -- you associate a fixed block of code with a method in the same way you would have a chunk of code after an if or while statement.
# Sometimes you would like to be more flexible. Say we're teaching math skills. the student could ask for an n-plus table or an n-times table. If the student asked for a 2-times table, we would output 2, 4, 6, 8, and so on. 
# This code does not check its input for errors.

print "(t)imes or (p)lus: "
operator = gets
print "number: "
number = Integer(gets)

if operator =~ /^t/
  puts((1..10).collect {|n| n*number }.join(", "))
else
  puts((1..10).collect {|n| n+number }.join(", "))
end

# This works, bit it's ugly, with virtually identical code on each branch of the if statement. 
# It would be nice if we could factor out the block that does the calculation:

print "(t)imes or (p)lus: "
operator = gets
print "number: "
number = Integer(gets)

if operator =~ /^t/
  calc = lambda {|n| n*number }  
else
  calc = lambda {|n| n+number }
end
puts((1..10).collect(&calc).join(", "))

# If the last argument to a method is preceded by an ampersand, Ruby assumes that it is a Proc object.
# Ruby removes the argument from the parameter list, converts the Proc object into a block, and associates it with the method.
 