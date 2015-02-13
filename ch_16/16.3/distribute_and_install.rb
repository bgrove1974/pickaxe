# DISTRIBUTING AND INSTALLING YOUR CODE

# Now that we have our code a little tidier, it would be nice to be able to distribute it to others.
# We could just zip or tar it up and send them our files, but then they would have to run the code the same way we do, remembering to add the correc -I lib options and so on.
# They would also have some problems if they wanted to reuse one of our library files -- it would be sitting in some random directory on their hard drive, not in a standard location used by Ruby.
# Instead, we're looking for a way to take our little application and install it in a standard way.

# Now, Ruby already has a standard installation structure on your computer.
# When Ruby is installed, it puts its commands (ruby, ri, irb, and so on) into a directory of binary files.
# It puts its libraries into another directory tree and documentation somewhere else.
# So, one option would be to write an application script that you distribute with your code that copies components of your application to the appropriate directories on the system that's installing it.
