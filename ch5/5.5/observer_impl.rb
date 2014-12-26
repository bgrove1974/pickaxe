# Instance variables in mixins.
# The first mention of an @-prefixed variable creates the instance variable in the current object, self.
# For a mixin, this means the module you mix into your client class may create instance variables in the client object and may use attr_reader and friends to define accessors for these instance variables.
# For instance, the Observable module in the following example adds an instance variable @observer_list to any class that includes it.

module Observable
  def observers
    @observer_list ||= []
  end
  def add_observer(obj)
    observers << obj
  end
  def notify_observers
    observers.each {|o| o.update }
  end
end

# However, this behavior exposes us to a risk. A mixin's instance variables can clash with those of the host class or with those of other mixins. See observer_impl_eg.rb.
