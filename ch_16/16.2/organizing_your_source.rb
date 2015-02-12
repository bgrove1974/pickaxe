# This section covers two related issues: how do we split our source code into separate files, and where in the file system do we put those files?

# Some languages, such as Java, make this easy.
# They dictate that each outer-level class should be in its own file and that file should be named according to the name of the class.
# Other languages, such as Ruby, have no rules relating source files and their content.
# In Ruby, you are free to to organize your code as you like.

# But, in the real world, you'll find that come kind of consistency really helps.
# It will make it easier for you to navigate your own projects, and it will also help when you read (or incorporate) other people's code.

# So, the Ruby community is gradually adopting a kind of de facto standard.
# In many ways, it follows the spirit of the Java model, but without some of the inconveniences suffered by our Java brethren.
# Let's start with the basics in small_programs_anagram.rb.
