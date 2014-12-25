# The Ruby include method makes a reference to a module.
# Include doesn't simply copy the module's instance methods into the class; instead, it makes a reference from the class to the included module. If multiple classes include that module, they will all point to the same thing.

# Mixins are great way to add functionality to classes, especially when the code in the mixin interacts with the code in the class that uses it.
# The Comparable mixin adds the comparison operators (<,<=,==,>=,>) as well as the between? method to a class.
# For this to work, Comparable assumes that any class that uses it defines the operator <=>. When you write a class, you define the <=> (combined comparison operator) method, include Comparable, and get six comparison functions thrown in.

# Let's try this with a simple Person class. We'll make people comparable based on their names.

class Person
  include Comparable
  attr_reader :name 

  def initialize(name)
    @name = name
  end
  def to_s
    "#{name}"
  end
  def <=>(other)
    self.name <=> other.name
  end
end

p1 = Person.new("Matz")
p2 = Person.new("Guido")
p3 = Person.new("Larry")

# Compare a couple of names
if p1 > p2
  puts "#{p1.name}'s name > #{p2.name}'s name"
end

# Sort an array of Person objects

puts "Sorted list:"
puts [ p1,p2,p3 ].sort 

# Ruby offers a compromise between single and multiple inheritance. A Ruby class has only one direct parent, so Ruby is a single inheritance language. However, Ruby classes can include the functionality of any number of mixins (think of a mixin as a partial class definition). This provides a controlled multiple-inheritance-like capability without an ambiguous inheritance hierarchy.