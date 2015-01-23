# Here's some simple code that uses the open-uri library to download the contents of a web page and write it to a file, line by line:

# tut_exceptions/fetch_web_page/fetch1.rb 

require 'open-uri'
web_page = open("https://pragprog.com/podcasts")
output = File.open("podcasts.html", "w")
while line = web_page.gets
  output.puts line
end
output.close

# What happens if we get a fatal error halfway through? We don't want to store an incomplete page to the output file.
# Let's add some exception-handling code and see how it helps. To do exception handling, we enclose the code that could raise an exception in a begin/end block and use one or more rescue clauses to tell Ruby the types of exceptions we want to handle.
# Because we specified Exception in the rescue line, we'll handle exceptions of class Exception and all of its subclasses (which covers all Ruby exceptions).
# In the error handling block, we report the error, close and delete the output file, and then reraise the exception.

# tut_exceptions/fetch_web_page/fetch2.rb 

require 'open-uri'
page = "podcasts"
file_name = "#{page}.html"
web_page = open("https://pragprog.com/#{page}")
output = File.open(file_name, "w")
begin
  while line = web_page.gets
    output.puts line
  end
  output.close
rescue Exception 
  STDERR.puts "Failed to download #{page}: #{$!}"
  output.close
  File.delete(file_name)
  raise 
end

# When an exception is raised and independent of any subsequent exception handling, Ruby places a reference to the associated exception object into the global variable $! (the exclamation point presumably mirroring our surprise that any of our code could cause errors). In the previous example, we used the $! variable to format our error message.

# After closing and deleting the file, we call raise with no parameters, which reraises the exception in $!. This is a useful technique, because it allows you to write code that filters exceptions, passing on those you can't handle to higher levels. It's almost like implementing an inheritance hierarchy for error processing.

# You can have multiple rescue clauses in a begin block, and each rescue clause can specify multiple exceptions to catch. At the end of each rescue clause, you can give Ruby the name of a local variable to receive the matched exception. Most people find this more readable than using $! all over the place.

begin
  eval string
rescue SyntaxError, NameError => boom
  print "String doesn't compile: " + boom
rescue StandardError => bang
  print "Error running script: " + bang
end

# How does Ruby decide which rescue clause to execute?
# It turns out that the processing is pretty similar to that used by the case statement. For each rescue clause in the begin block, Ruby compares the raised exception against each of the parameters in turn. If the raised exception matches a parameter, Ruby executes the body of the rescue and stops looking.
# The match is made using parameter===$!. For most exceptions, this means that the match will succeed if the exception named in the rescue clause is the same as the type of the currently thrown exception or is a superclass of that exception.
# This comparison happens because exceptions are classes, and classes in turn are kinds of Module. The === method is defined for modules, returning true if the class of the operand is the same as or is a descendant of the receiver.
# If you write a rescue clause with no parameter list, the parameter defaults to StandardError.

# If no rescue clause matches or if an exception is raised outside a begin/end block, Ruby moves up the stack and looks for an exception handler in the caller, then in the caller's caller, and so on.

# Although the parameters to the rescue clause are typically the names of exception classes, they can be arbitrary expressions   (including method calls) that return an Exception class.
