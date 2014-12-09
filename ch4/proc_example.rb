#!/usr/bin/ruby

# Blocks are like anonymous methods, but there's more to them than that. You can also convert
# a block into an object, store it in variables, pass it around, and then invoke its code later.

# If the last parameter in a method definition is prefixed with an ampersand (such as &action),
# Ruby looks for a code block whenever that method is called.

# Here is an example where we create a Proc object in one instance method and store it in an 
# instance variable. We then invoke the proc from a second instance method.

class ProcExample 
  def pass_in_block(&action)
    @stored_proc = action
  end
  def use_proc(parameter)
    @stored_proc.call(parameter)
  end
end

eg = ProcExample.new
eg.pass_in_block { |param| puts "The parameter is #{param}" }
eg.use_proc(99)

# => The parameter is 99

# Notice how the call method on a proc object invokes the code in the original block.

# If a block can be turned into an object by adding an ampersand parameter to a method, what happens
# if that method then returns the Proc object to the caller?

def create_block_object(&block)
  block 
end

bo = create_block_object { |param| puts "You called me with #{param}" }

bo.call 99
bo.call "cat"

# => You called me with 99
# => You called me with cat 

# Both 'lambda' and 'Proc.new' take a block and return an object of class Proc.

bo = lambda { |param| puts "You called me with #{param}" }

bo.call 98
bo.call "dog"

# => You called me with 98
# => You called me with dog
