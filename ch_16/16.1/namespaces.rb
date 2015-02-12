# We have already encountered a way that Ruby helps you manage the names of things in your programs.
# If you define methods or constants in a class, Ruby ensures that their names can be used only in the context of that class (or its objects, in the case of instance methods):

class Triangle
  SIDES = 3
  def area
    # ..
  end
end

class Square
  SIDES = 4
  def initialize(side_length)
    @side_length = side_length
  end
  def area
    @side_length * @side_length
  end
end

puts "A triangle has #{Triangle::SIDES} sides"

sq = Square.new(3)
puts "Area of square = #{sq.area}"
puts " "

# Both classes define a constant called SIDES and an instance method area, but these things don't get confused.
# You access the instance method via objects created from the class, and you access the constant by prefixing it with the name of the class followed by a double colon.
# The double colon (::) is Ruby's namespace resolution operator.
# The thing to the left must be a class or module, and the thing to the right is a constant defined in that class or module.
# The thing to the right of the :: can also be a class or module method, but this use is falling out of favor -- using a period makes it clearer that it's just a regular old method call.

# So, putting code inside a module or class is a good way of separating it from other code.
# Ruby's Math module is a good example -- it defines constants such as Math::PI and Math::E and methods such as Math.sin and Math.cos.
# You can access these constants and methods via the Math module object:

p Math::E 
p Math.sin(Math::PI/6.0)
puts " "

# Modules have another significant use -- they implement Ruby's mixin functionality, which we discussed in Section 5.3, Mixins, pp 75.

# Ruby has an interesting little secret.
# The names of classes and modules are themselves just constants; remember that we said that most everything in Ruby is an object. Classes and modules are, too. The name that you use for a class, such as String, is really just a Ruby constant containing the object representing that class.
# That means that if you define classes or modules inside other classes and modules, the names of those inner classes are just constants that follow the same namespacing rules as other constants:

module Formatters
  class Html
    # ...
  end
  class Pdf
    # ...
  end
end

html_writer = Formatters::Html.new

# You can nest classes and modules inside other classes and modules to any depth you want (although it's rare to see them more than three deep).

# So, now we know that we can use classes and modules to partition the names used by our programs.
# The second question to answer is, what do we do with the source code?
