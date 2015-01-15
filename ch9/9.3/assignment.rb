# An assignment statement sets the variable or attribute on its left side (the lvalue) to refer to the value on the right (the rvalue). It then returns that rvalue as the result of the assignment expression. This means you can chain assignments, and you can perform assignments in some unexpected places:

p a = b = 1 + 2 + 3
p a
p b 
p a = (b = 1 + 2) + 3
p a 
p b 
puts " "

# File.open(name = gets.chomp)

# Ruby has two basic forms of assignment.
# The first assigns an object reference to a variable or constant. This form of assignment is hardwired into the language:

instrument = "piano"
p instrument
MIDDLE_A   = 440
p MIDDLE_A
puts " "

# The second form of assignment involves having an object attribute or element reference on the left side. These forms are special, because they are implemented by calling methods in the lvalues, which means you can override them.

# We've already seen how to define a writable object attribute. Simply define a method name ending in an equals sign. This method receives as its parameter the assignment's rvalue. We've also seen that you can define [] as a method:

class ProjectList
  def initialize
    @projects = []
  end
  def projects=(list)
    @projects = list.map(&:upcase)  # Store a list of names in UPPERCASE
  end
  def [](offset)
    @projects[offset]
  end
end

list = ProjectList.new
list.projects = %w{ strip sand prime sand paint sand paint rub paint }
p list[3]
p list[4]
puts " "

# As this example shows, these attribute-setting methods don't have to correspond with internal instance variables, and you don't need an attribute reader for every attribute writer (or vice versa).

# In older Rubys, the result of the assignment was the value returned by the attribute-setting method. As of Ruby 1.8, the value of the assignment is always the value of the parameter; the return value of the method is discarded.
# In the code that follows, older versions of Ruby would set result to 99. Now result will be set to 2.

class Test
  def val=(val)
    @val = val 
    return 99
  end
end

t = Test.new
result = (t.val = 2)
puts result
