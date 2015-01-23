# You can define your own exceptions to hold any information that you need to pass out from the site of an error.
# For example, certain types of network errors may be transient depending on the circumstances. If such an error occurs and the circumstances are right, you could set a flag in the exception to tell the handler that it may be worth retrying the operation.

# tut_exceptions/retry_exception.rb 

class RetryException < RuntimeError
  attr :ok_to_retry
  def initialize(ok_to_retry)
    @ok_to_retry = ok_to_retry
  end
end

# Somewhere down in the depths of the code, a transient error occurs:

# tut_exceptions/read_data.rb 

def read_data(socket)
  data = socket.read(512)
  if data.nil?
    raise RetryException.new(true), "transient read error"
  end
  # .. normal processing
end

# Higher up the call stack, we handle the exception:

begin
  stuff = read_data(socket)
  # .. process stuff
rescue RetryException => detail
  retry if detail.ok_to_retry
  raise
end
