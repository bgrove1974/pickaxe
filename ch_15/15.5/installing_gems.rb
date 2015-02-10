# Your latest project calls for a lot of XML generation.
# You could just hard-code it, but you've heard about Jim Weirich's Builder library, which constructs XML directly from Ruby code.
# Let's start by seeing whether Builder is available as a gem:

# $ gem query --details --remote --name-matches builder 

# The --details option displays the descriptions of any gem it finds.
# The --remote option searches the remote repository.
# The --name-matches option says to search the central gem repository for any gem whose name matches the regular expression /builder/.
# We could have used the short-form options -d, -r, and -n.
# The result shows a number of gems have 'builder' in their name; the one we want is just plain 'builder'.

# Because we want to install the most recent one, we don't have to state an explicit version on the install command; the latest version is downloaded by default:

# $ gem install builder 

# Several things happened here.
# First, we see that the latest version of the Builder gem has been installed.
# Next we see that RubyGems has determined that Jim has created documentation for his gem, so it sets about extracting it using RDoc.

# If you're running gem install on a Unix platform and you aren't using rvm, you'll need to prefix the command with sudo, because by default the the local gems are installed into shared system directories.

# During the installation, you can add the -t option to the install command, causing RubyGems to run the gem's test suite (if one has been created).
# If the test fails, the installer will prompt you to either keep or discard the gem.
# This is a good way to gain a little more confidence that the gem you've just downloaded works on your system the way the author intended.

# Let's see what gems we now have installed on our local box:

# $ gem list

