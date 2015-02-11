##! This file contains code that will delete backup files from the working directory.

# THE RAKE BUILD TOOL

# As well as the Builder gem, Jim Weirich wrote an incredibly useful utility program called Rake.
# Prior to Ruby 1.9, you had to install Rake as a separate gem, but it is now included in the base Ruby installation.

# Rake was initially implemented as a Ruby version of Make, the common build utility.
# However, calling Rake a buuild utility is to miss its true power.
# Really, Rake is an automation tool -- it's a way of putting all those tasks that you perform in a project into one neat and tidy place.

# Let's start with a trivial example.
# As you edit files, you often accumulate backup files in your working directories.
# On Unix systems, these files often have the same name as the original files, but with a tilde character appended.
# On Windows boxes, the files often have a .bak extension.

# We coud write a trivial Ruby program that deletes these file.
# For a Unix box, it might look something like this:

# require 'fileutils'
# files = Dir['*~']
# FileUtils::rm files, verbose: true

# The FileUtils module defines methods for manipulating files and directories (see the description in the library section on pp 757).
# Our code uses its rm method.
# We use the Dir class to return a list of filenames matching the given pattern and pass that list to rm.

# Let's package this code as a Rake task -- a chunk of code that Rake can execute for us.

# By default, Rake searches the current directory (and it parents) for a file called Rakefile.
# This file contains definitions for the tasks that Rake can run.

# So, put the following code into a file called Rakefile:

# desc "Remove files whose names end with a tilde"
# task :delete_unix_backups do
#   files = Dir['*~']
#   rm(files, verbose: true) unless files.empty?
# end

# Although it doesn't have an .rb extension, this is actually just a file of Ruby code.
# Rake defines an environment containing methods such as desc and task and then executes the Rakefile.

# The desc method provides a single line of documentation for the task that follows it.
# The task method defines a Rake task that can be executed from the command line.

# The parameter is the name of the task (a symbol), and the block that follows is the code to be executed.
# Here we can just use rm -- all of the methods in FileUtils are automatically available inside Rake files.

# We can invoke this task from the command line:

# $ rake delete_unix_backups

# The first line of the output shows us the name of the directory where Rake found the Rakefile (remember that this might be in a directory above our current working directory).
# The next line is the output of the rm method, in this case showing it deleted the single file 'entry~'.

# OK, now let's write a second task in the same Rakefile.
# This one deletes Windows backup files:

# desc "Remove files with a .bak extension"
# task :delete_windows_backups do
#   files = Dir['*.bak']
#   rm(files, verbose: true) unless files.empty?
# end

# We can run this with:

# $ rake delete_windows_backups

# But let's say that our application could be used on both platforms, and we wanted to let our users delete backup files on either.
# We could write a combined task, but Rake gives us a better way -- it lets us compose tasks.
# Here, for example, is a new task:

# desc "Remove Unix and Windows backup files"
# task :delete_backups => [ :delete_unix_backups, :delete_windows_backups ] do
#   puts "All backups deleted"
# end

# The task's name is delete_backups, and it depends on two other tasks.
# This isn't some special Rake syntax: we're simply passing the task method a Ruby hash containing a single entry whose key is the task name and whose value is the list of antecedent tasks.
# This causes Rake to execute the two platform-specific tasks before executing the delete_backups task:

# $ rake delete_backups

# Our current Rakefile contains some duplication between the Unix and Windows deletion tasks.
# As it is just Ruby code, we can simply define a Ruby method to eliminate this:

def delete(pattern)
  files = Dir[pattern]
  rm(files, verbose: true) unless files.empty?
end

desc "Remove files whose names end with a tilde"
task :delete_unix_backups do
  delete "*~"
end

desc "Remove files with a .bak extension"
task :delete_windows_backups do
  delete "*.bak"
end

desc "Remove Unix and Windows backup files"
task :delete_backups => [ :delete_unix_backups, :delete_windows_backups ] do
  puts "All backups deleted"
end

# If a Rake task is named default, it will be executed if you invoke Rake with no parameters.

# You can find the tasks implemented by by a Rakefile (or, more accurately, the tasks for which there is a description) using this:

# $ rake -T 

# This section only touches on the full power of Rake.
# It can handle dependencies between files (for example, rebuilding an executable file if one of the source files has changed), it knows about running tests and generating documentation, and it can even package gems for you.
# Martin Fowler has written a good overview of Rake if you're interested in digging deeper.
# http://martinfowler.com/articles/rake.html
# You also might want to investigate Sake, a tool that makes Rake tasks available no matter what directory you're in.
# http://errtheblog.com/posts/60-sake-bomb
# Then there is Thor, a tool that makes it easy to write Ruby command line tools.
# http://github.com/wycats/thor
