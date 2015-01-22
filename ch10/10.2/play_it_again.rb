# Sometimes you may be able to correct the cause of an exception. In those cases, you can use the retry statement within a rescue clause to repeat the entire begin/end block.
# BE CAREFUL with retry statements. Clearly, tremendous scope exists for infinite loops here, so this is a feature to use with caution (and with a finger resting lightly on the interrupt key).

# As an example of code that retries on exceptions, take a look at the following, adapted from Minero Aoki's net/smtp.rb library:

@esmtp = true

begin
  # First try an extended login. If it fails, fall back to a normal login
  if @esmtp then @command.ehlo(helodom)
            else @command.helo(helodom)
  end 

rescue ProtocolError
  if @esmtp then
    @esmtp = false
    retry
  else
    raise
  end
end  

# This code tries first to connect to an SMTP server using the EHLO command, which is not universally supported. If the connection attempt fails, the code sets the @esmtp variable to false and retries the connection. If this fails a second time, the exception is raised up to the caller.