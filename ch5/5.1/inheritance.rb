class Parent
  def say_hello
    puts "Hello from #{self}"
  end
end

p = Parent.new
p.say_hello

# Subclass the parent...
class Child < Parent
end

c = Child.new
c.say_hello

p Child.superclass
p Parent.superclass
p Object.superclass
p BasicObject.superclass.inspect
 
# BasicObject is the root class of our hierarchy of classes in Ruby.
# Object is an ancestor of every Ruby class except BasicObject.
