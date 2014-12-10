#! usr/bin/ruby

# Blocks written using the old syntax take their parameter lists between vertical bars.
# Blocks written using the -> syntax take a separate parameter list before the block body.

# Here is a block using the original block notation:

proc1 = lambda do |a, *b, &block|
  puts "a = #{a.inspect}"
  puts "b = #{b.inspect}"
  block.call
end

proc1.call(1, 2, 3 ,4) { puts "in block1" }

# => a = 1
# => b = [2, 3, 4]
# => in block1 


# Here is a block using the -> notation:

proc2 = -> a, *b, &block do
  puts "a = #{a.inspect}"
  puts "b = #{b.inspect}"
  block.call   
end

proc2.call(1, 2, 3 ,4) { puts "in block2" }

# => a = 1
# => b = [2, 3, 4]
# => in block2
