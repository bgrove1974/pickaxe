# irb is run from the command line

# irb<irb-options><ruby_script><program arguments>

# The command-line options for irb are listed in Table 9, irb Command-line options, on pp 255.
# Typically, you will run irb with no options, but if you want to run a script and watch the blow-by-blow description as it runs, you can provide the name of the Ruby script and any options for that script.

# Once started, irb displays a prompt and waits for you to type Ruby code.
# irb understands Ruby, so it knows when statements are incomplete.
# When this happens, the cursor will be indented on the next line.
# In the examples, we'll use irb's default prompt.

# ruby 2.0 > 1 + 2
# => 3
# ruby 2.0 > 3 +
# ruby 2.0 >   4
# => 7

# You can leave irb by typing exit or quit or by entering an end-of-file character (unless IGNORE_EOF mode is set).

# During an irb session, the work you do is accumulated in irb's workspace.
# Variables you set, methods you define, and classes you create are all remembered and may be used subsequently in that session.

# ruby 2.0 > def fib_up_to(n)
# ruby 2.0 ?> f1, f2 = 1, 1
# ruby 2.0 ?> while f1 <= n
# ruby 2.0 ?>   puts f1
# ruby 2.0 ?>   f1, f2 = f2, f1 +f2
# ruby 2.0 ?>   end
# ruby 2.0 ?> end 
# => nil
# ruby 2.0 > fib_up_to(4)
# 1
# 1
# 2
# 3
# => nil

# Notice the nil return values.
# These are the results of defining the method and then running it -- our method printed the Fibonacci numbers but then returned nil.

# A great use of irb is experimenting with code that you have already written.
# Perhaps you want to track down a bug, or maybe you just want to play.
# If you load your program into irb, you can then create instances of the classes it defines and invoke its methods.
# For example, the file fibonacci_sequence.rb contains a method definition.
# We can load this into irb and play with the method:
