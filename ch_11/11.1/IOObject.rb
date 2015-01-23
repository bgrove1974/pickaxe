# What is an IO Object?

# Ruby defines a single base class, IO, to handle input and output. This base class is subclassed by classes File and BasicSocket to provide more specialized behavior, but the principles are the same.
# An IO object is a bidirectional channel between a Ruby program and some external resource. This means that a single IO object can sometimes be managing more than one operating system file descriptor. For example, if you open a pair of pipes, a single IO object contains both a read pipe and a write pipe.
# An IO object may have more to it than meets the eye, but in the end you still simply write to it and read from it.

# In this chapter, we'll be concentrating on class IO and its most commonly used subclass, class File.
# For more details on using the socket classes for networking, see the library description on page 807.
