# What happens if I define instance methods within a module?
# A module can't have instances, because a module isn't a class.
# However, you can include a module within a class definition. When this happens, all of the module's instance methods become available as methods in the class as well (they get mixed in). 
# A mixed-in module effectively behaves as a superclass.

module Debug
  def who_am_i?
    "#{self.class.name} (id: #{self.object_id}): #{self.name}"     
  end   
end 

class Phonograph
  include Debug
  attr_reader :name
  def initialize(name)
    @name = name
  end
  # ...
end

class EightTrack
  include Debug
  attr_reader :name 
  def initialize(name)
    @name = name
  end
  # ...   
end

ph = Phonograph.new("West End Blues")
et = EightTrack.new("Surrealistic Pillow")

puts ph.who_am_i?
puts et.who_am_i?

# By including the Debug module, both the Phonograph and EightTrack classes gain access to the who_am_i? instance method.
