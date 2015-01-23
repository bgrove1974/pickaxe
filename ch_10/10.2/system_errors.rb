# System errors are raised when a call to the operating system returns an error code. On POSIX systems, these errors have names such as EAGAIN and EPERM. 
# If you are on a Unix system, you can type man errno to get a list of these errors.
# Ruby takes these errors and wraps each of them in a specific exception object. Each is a subclass of SystemCallError, and each is defined in a module called Errno. This means you'll find exceptions with class names such as Errno::EAGAIN, Errno::EIO, and Errno::EPERM. If you want to get to the underlying system error code, Errno exception objects each have a class constant called  (somewhat confusingly) Errno that contains the value.

p Errno::EAGAIN::Errno
p Errno::EPERM::Errno
p Errno::EWOULDBLOCK::Errno

# Note that EWOULDBLOCK and EAGAIN have the same error number. This is a feature of the operating system of the computer used to produce this book -- the two constants map to the same error number. 
# To deal with this, Ruby arranges things so that Errno::EAGAIN and Errno::EWOULDBLOCK are treaded identically in a rescue clause. If you ask to rescue one, you will rescue either. It does this by redefining SystemCallError#=== so that if two subclasses of SystemCallError are compared, the comparison is done on their error number and not on their position in the hierarchy.
