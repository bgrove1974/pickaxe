# irb supports multiple, concurrent sessions.
# One is always current; the others lie dormant until activated.
# Entering the command irb within irb creates a subsession, entering the jobs command lists all sessions, and entering fg activates a particular dormant session.
# This example also illustrates the -r command-line option, which loads in the given file before irb starts:

⇒  irb -r ~/Desktop/RoR/pickaxe/ch_18/18.1/fibonacci_sequence.rb
2.1.2 :001 > result = fibonacci_sequence.first(5)
 => [1, 1, 2, 3, 5] 
2.1.2 :002 > # Create nested irb session
2.1.2 :003 >   irb
2.1.2 :001 > result = %w{ cat dog elk }
 => ["cat", "dog", "elk"] 
2.1.2 :002 > result.map(&:upcase)
 => ["CAT", "DOG", "ELK"] 
2.1.2 :003 > jobs
 => #0->irb on main (#<Thread:0x007f8f128cb7e0>: stop)
#1->irb#1 on main (#<Thread:0x007f8f13a3f2d8>: running) 
2.1.2 :004 > fg 0
 => #<IRB::Irb: @context=#<IRB::Context:0x007f8f129d3980>, @signal_status=:IN_EVAL, @scanner=#<RubyLex:0x007f8f129d0820>> 
2.1.2 :004 > result
 => [1, 1, 2, 3, 5] 
2.1.2 :005 > fg 1
 => #<IRB::Irb: @context=#<IRB::Context:0x007f8f13a3f0f8>, @signal_status=:IN_EVAL, @scanner=#<RubyLex:0x007f8f13a3ec98>> 
2.1.2 :005 > result
 => ["cat", "dog", "elk"] 
2.1.2 :006 > exit
 => #<IRB::Irb: @context=#<IRB::Context:0x007f8f129d3980>, @signal_status=:IN_EVAL, @scanner=#<RubyLex:0x007f8f129d0820>> 
2.1.2 :006 > exit
