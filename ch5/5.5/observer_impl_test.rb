# This module uses a module-level hash, indexed by the current object ID, to store instance-specific data without using Ruby instance variables. This prevents problems that could arise from having different mixins that contain instance variables with the same name (see observer_impl.rb and observer_impl_eg.rb).

module Test
  State = {}
  def state=(value)
    State[object_id] = value
  end
  def state
    State[object_id]
  end
end

class Client
  include Test
end

c1 = Client.new
c2 = Client.new
c1.state = 'cat'
c2.state = 'dog'

puts c1.state
puts c2.state 

# A downside of this approach is that the data associated with a particular object will not get automatically deleted if the object is deleted. In general, a mixin that requires its own state is not a mixin -- it should be written as a class.
