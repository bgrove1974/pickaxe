# Ruby comes with a debugger, which is conveniently built into the base system. 
# You can run the debugger by invoking the interpreter with the -r debug option, along with any other Ruby options and the name of your script:

# $ ruby -r debug <debug-options><programfile><program-arguments>

# The debugger supports the usual range of features you would expect, including the ability to set breakpoints, to step into and step over method calls, and to display stack frames and variables.
# It can also list the instance methods defined for a particular object or class, and it allows you to list and control separate threads within Ruby.
# All of the commands that are available under the debugger are listed in Table 6, Debugger commands, pp 205.

# If your Ruby installation has readline support enabled, you can use cursor keys to move back and forth in command history and use line-editing commands to amend previous input.

# To give you an idea of what the Ruby debugger is like, here's a sample session:

# $ ruby -r debug t.rb 
# $ list 1-9 
# $ b 2
# $ c 
# $ disp n 
# $ del 1 
# $ watch n==1 
# $ c 
# $ where 
# $ del 2
# $ c 
 