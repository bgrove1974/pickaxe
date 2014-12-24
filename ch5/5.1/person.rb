# The to_s method is defined in class Object.
class Person 
  def initialize(name)
    @name = name
  end
end

p = Person.new("Michael")
puts p

# We can override the to_s method.
class Person
  def initialize(name)
    @name = name
  end
  def to_s
    "Person named #{@name}"
  end
end

p = Person.new("Michael")
puts p 
