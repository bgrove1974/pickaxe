# PACKAGING YOUR RUBYGEM

# Once the gem specification is complete, you will want to create the packaged .gem file for distribution.
# This is as easy as navigating to the top level of your project and typing this:

# $ gem build anagram.gemspec

# You'll find that now you have a file called 'anagram-0.0.1.gem':

# $ ls *gem

# You can install it by typing this:

# $ sudo gem install pkg/anagram-0.0.1.gem 

# Now check to see that it is there:

# $ gem list anagram -d 

# Now you can send your .gem file to friends and colleagues or share it from a server.
# Or, you can go one better and share it from a RubyGems server.

# If you have RubyGems installed on your local box, you can share them over the network to others.
# Simply run this:

# $ gem server

# This starts a server (by default on port 8088, but the --port option overrides that).
# Other people can connect to your server to list and retrieve RubyGems:

# $ gem list -- remote --source http://benjamingrove.local:8808

# This is particularly useful in a corporate environment.

# You can speed up the serving of gems by creating a static index -- see the help for 'gem generate_index' for details.
