# If your Ruby installation has readline support, then you can use irb's completion facility.
# Once loaded (and we'll get to how to load it shortly), completion changes the meaning of the Tab key when typing expressions at the irb prompt.
# When you press the Tab key partway through a word, irb will look for possible completions that make sense at that point.
# If there is only one, irb will fill it in automatically.
# If there is more than one valid option, irb initially does nothing.
# However, if you hit the Tab key again, it will display the list of valid completions at that point.

# For example, the following snippet shows the middle of an irb session, where you have just assigned a string object to the variable a:

⇒  irb
2.1.2 :001 > a = "cat"
 => "cat" 
2.1.2 :002 >

# You now want to try the method String.reverse on this object.
# You start by typing a.re and hitting the Tab key twice:

2.1.2 :002 > a.re #<<TAB>><<TAB>>
a.remove_instance_variable  a.reverse
a.replace                   a.reverse!
a.respond_to?               
2.1.2 :002 > a.re

# irb lists all of the methods supported by the object in a whose names start with re.
# We see the one we want, reverse, and enter the next character of its name, v, followed by the Tab key:

2.1.2 :002 > a.rev #<<TAB>>
2.1.2 :002 > a.reverse
 => "tac" 
2.1.2 :003 >

# irb responds to the Tab key by expanding the name as far as it can go, in this case completing the word reverse.
# If we keyed Tab twice at this point, it would show us the current options, reverse and reverse!.
# However, because reverse is the one we want, we instead hit the Enter key, and the line of code is executed.

# Tab completion isn't linited to built-in names.
# If we define a class in irb, then tab completion works when we try to invoke one of its methods:

⇒  irb
2.1.2 :001 > class Test
2.1.2 :002?>   def my_method
2.1.2 :003?>     end
2.1.2 :004?>   end
 => :my_method 
2.1.2 :005 > t = Test.new
 => #<Test:0x007fbac916c480> 
2.1.2 :006 > t.my # <<TAB>>
2.1.2 :006 > t.my_method
 => nil 
2.1.2 :007 >

# Tab completion is implemented as an extension library.
# On some systems this is loaded by default.
# On others you will need to load it when you invoke irb from the command line:

$ irb -r irb/completion

# You can also load the completion library when irb is running:

2.1.2 :001 > require 'irb/completion'

# If you use tab completion all the time and if it doesn't load by default, it is probably most convenient to put the require command into your .irbrc file.
