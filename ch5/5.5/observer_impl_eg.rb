# Instance variables in mixins.
# The first mention of an @-prefixed variable creates the instance variable in the current object, self.
# For a mixin, this means the module you mix into your client class may create instance variables in the client object and may use attr_reader and friends to define accessors for these instance variables.
# However, this behavior exposes us to a risk. A mixin's instance variables can clash with those of the host class or with those of other mixins.
# The example that follows shoes a class that uses our Observer module but that unluckily also uses an instance variable called @observer_list. At runtime, this program will go wrong in some ways that are difficult to diagnose.

require_relative 'observer_impl'

class TelescopeScheduler
  
  # other classes can register to get notifications when the schedule changes

  include Observable

  def initialize
    @observer_list = []  # people with telescope time
  end
  def add_viewer(viewer)
    @observer_list << viewer
  end

  # ...
end

# For the most part, mixin modules don't use instance variables directly -- they use accessors to retrieve data from the client object. But if you need to create a mixin that has to have its own state, ensure that the instance variables have unique names to distinguish them from any other mixins in the system (eg. include the module's name as part of the variable name).
# For an alternative, see observer_impl_test.rb.
