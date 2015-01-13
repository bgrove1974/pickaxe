# When a method is called it may be associated with a block. Normally, you call the block from within the method using yield:

def double(p1)
  yield(p1*2)
end

puts double(3) {|val| "I got #{val}" }
puts double("tom") {|val| "Then I got #{val}" }
puts " "

# However, if the last parameter in a method definition is prefixed with an ampersand (&), any associated block is converted to a Proc object, and that object is assigned to the parameter. This allows you to store the block for use later.

class TaxCalculator
  def initialize(name, &block)
    @name, @block = name, block
  end
  def get_tax(amount)
    puts "#@name on #{amount} = #{ @block.call(amount) }"
  end
end

tc = TaxCalculator.new("Sales tax") {|amt| amt * 0.075}

tc.get_tax(100)
tc.get_tax(250)
