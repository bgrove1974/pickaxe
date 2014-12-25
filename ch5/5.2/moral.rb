# Modules define a namespace, which is a sandbox in which your methods and constants can play together without having to worry about being confusd with other methods and constants.
# The files trig.rb and moral.rb both define a method called sin. The trig methods can go into one module and the moral methods can go into another module.
# Module constants are named just like class constants, with an initial uppercase letter (by convention, use all uppercase letters). The method definitions are also similar; module methods are defined just like class methods.

module Moral
  VERY_BAD = 0
  BAD      = 1
  def Moral.sin(badness)
    # ..
  end
end