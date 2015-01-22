# Sometimes you need to guarantee that some processing is done at the end of a block of code, regardless of whether an exception was raised. For example, you may have a file open on entry to the block, and you need to make sure it gets closed as the block exits.
# The ensure clause does just this. ensure goes after the last rescue clause and contains a chunk of code that will always be executed as the block terminates. It doesn't matter if the block exits normally, if it raises an exception, or if it is terminated by an uncaught exception -- the ensure block will get run.

f = File.open("testfile")
begin 
  # .. process
rescue
  # .. handle error
ensure
  f.close 
end

# Beginners, like me, commonly make the mistake of putting the File.open inside the begin block. In this case, that would be incorrect, because open can itself raise an exception. If that were to happen, you wouldn't want to run the code in the ensure block, because there would be no file to close.

# The else clause is a similar, although less useful, construct. If present, it goes after the resuce clauses and before any ensure. The body of an else clause is executed only if no exceptions are raised by the main body of code.

f = File.open("testfile")
begin 
  # .. process
rescue
  # .. handle error
else
  puts "Congratulations-- no errors!"
ensure
  f.close 
end  
