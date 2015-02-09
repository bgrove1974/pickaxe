# The method Object#exit terminates your program, returning a status value to the operating system.
# However, unlike some languages, exit doesn't terminate the program immediately -- exit first raises a SystemExit exception, which you may catch, and then performs a number of cleanup actions, including running any registered at_exit methods and object finalizers.
# See the reference for Object#at_exit on pp 612.
