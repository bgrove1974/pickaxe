# If you enclose a string in backquotes (`)(sometimes called backticks) or use the delimited form prefixed by %x, it will (by default) be executed as a command by your underlying operating system. The value of the expression is the standard output of that command. Newlines will not be stripped, so it is likely that the value you get back will have a trailing return or linefeed character.

p `date`
puts `date`
p `ls`.split[34]
puts `ls`.split[34]
p %x{echo "hello there"}
puts %x{echo "hello there"}
puts " "

# You can use expression expansion and all the usual escape sequences in the command string:

# for i in 0..3
  # status = `dbmanager status id=#{i}`
  # # ...
# end
# The above code throws an ENOENT error.

# The exit status of the command is available in the global variable $?.
