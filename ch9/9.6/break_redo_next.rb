# The loop control constructs break, redo, and next let you alter the normal flow through a loop or iterator.
# break terminates the immediately enclosing loop; control resumes at the statement following the block.
# redo repeats the current iteration of the loop from the start but without reevaluating the condition or fetching the next element of the iterator.
# next skips to the end of the loop, effectively staring the next iteration.

# while line = gets
#   next  if line =~ /^\s*#/  # skips comments
#   break if line =~ /^END/   # stop at the end
#
#   # substitute stuff in backticks and try again
#   redo if line.gsub!(/`(.*?)`/) { eval($1) }
#
#  # process line ...    
# end 

# These keywords can also be used within blocks. Although you can use them with any block, they typically make the most sense when the block is being used for iteration:

i = 0
loop do
  i += 1
  next if i < 3
  print i 
  break if i > 4 
end

# A value may be passed to break and next. When used in conventional loops, it probably makes sense only to do this with break, where it sets the value returned by a loop. (Any value given to next is effectively lost.) 
# If a conventional loop doesn't execute a break, its value is nil.

result = while line = gets
           break(line) if line =~ /answer/
         end 

process_answer(result) if result

# If you want the details of how break and next work with blocks and procs, take a look at the reference description on pp 338.
# If you are looking for a way of exiting from blocks or loops, take a look at Object#catch on pp 341.
