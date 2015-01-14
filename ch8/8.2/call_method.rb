# You can call a method by optionally specifying a receiver, giving the name of the method, and optionally passing some parameters and an optional block. 
# Here's a code fragment that shows us calling a method with a receiver, a parameter, and a block:

# connection.download_mp3("jitterbug") {|p| show_progress(p) }

# In this example, the object 'connection' is the receiver, 'download_mp3' is the name of the method, the string "jitterbug" is the parameter, and the stuff between the braces is the associated block.
# During this method call, Ruby first sets self to the receiver and then invokes the method in the object.
# For class and module methods, the receiver will be the class or module name.

puts File.size("testfile")
puts Math.sin(Math::PI/4)
puts " "

# If you omit the receiver, it defaults to self, the current object.

class InvoiceWriter
  def initialize(order)
    @order = order
  end
  def write_on(output)
    write_header_on(output)  # called on current object
    write_body_on(output)    # self is not changed, as
    write_totals_on(output)  # there is no receiver
  end
  def write_header_on(output)
    # ...
  end
  def write_body_on
    # ...
  end
  def write_totals_on
    # ...
  end
end

# This defaulting mechanism is how Ruby implements private methods. Private methods may NOT be called with a receiver, so they must be methods available in the current object.
# In the previous example, we would probably want to make the helper methods private, because they shouldn't be called from outside the InvoiceWriter class.

class InvoiceWriter
  def initialize(order)
    @order = order
  end
  def write_on(output)
    write_header_on(output)
    write_body_on(output)
    write_totals_on(output)
  end

private

  def write_header_on(output)
    # ...
  end
  def write_body_on
    # ...
  end
  def write_totals_on
    # ...
  end
end