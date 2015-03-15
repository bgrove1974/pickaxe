# If you specify an object when you create a subsession, that object becomes the value of self in that binding.
# This is a convenient way to experiment with objects.
# In the following example, we create a subsession with the string "wombat" as the default object.
# Methods with no receiver will be executed by that object.

⇒  irb
2.1.2 :001 > self
 => main 
2.1.2 :002 > irb "wombat"
2.1.2 :001 > self
 => "wombat" 
2.1.2 :002 > upcase
 => "WOMBAT" 
2.1.2 :003 > size
 => 6 
2.1.2 :004 > gsub(/[aeiou]/, '*')
 => "w*mb*t" 
2.1.2 :005 > irb_exit
 => #<IRB::Irb: @context=#<IRB::Context:0x007fc1121b9448>, @signal_status=:IN_EVAL, @scanner=#<RubyLex:0x007fc1121b6770>> 
2.1.2 :003 > self
 => main 
2.1.2 :004 > upcase
NameError: undefined local variable or method 'upcase' for main:Object
  from (irb):4
  from /Users/benjamingrove/.rvm/rubies/ruby-2.1.2/bin/irb:11:in '<main>'
2.1.2 :005 > exit

# irb is remarkably configurable.
# You can set configuration options with command-line options from within an initialization file and while you are inside irb itself.
