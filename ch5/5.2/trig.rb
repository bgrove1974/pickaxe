# Modules define a namespace, which is a sandbox in which your methods and constants can play together without having to worry about being confusd with other methods and constants.
# The files trig.rb and moral.rb both define a method called sin. The trig methods can go into one module and the moral methods can go into another module.
# Module constants are named just like class constants, with an initial uppercase letter (by convention, use all uppercase letters). The method definitions are also similar; module methods are defined just like class methods.

module Trig
  PI = 3.141592654
  def Trig.sin(x)
    # ..
  end

  def Trig.cos(x)
    # ..
  end
end