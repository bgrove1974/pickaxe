# In the description of the command output expression, we said that the string in backquotes would "by default" be executed as a command. In fact, the string is passed to the method called Object#` (a single backquote). If you want, you can override this.
# This example uses $?, which contains the status of the last external process run:

alias old_backquote `
def `(cmd)
  result = old_backquote(cmd)
  if $? != 0
    puts "*** Command #{cmd} failed: status = #{$?.exitstatus}"
  end
  result
end

print `ls -l /etc/passwd`
print `ls -l /etc/wibble`
