# If a third program wants to use the modules in trig.rb and moral.rb, it can load the two files using a require statement.
# To reference the the name 'sin' unambiguously, our code can then qualify the name by using the name of the module containing the implementation we want, followed by :: (the scope resolution operator).

require_relative 'trig'
require_relative 'moral'
y = Trig.sin(Trig::PI/4)
wrongdoing = Moral.sin(Moral::VERY_BAD)

# As with class methods, you call a module method by preceding its name with the module's name and a period, and you reference a constant using the module name and two colons.
