# READING THE GEM DOCUMENTATION

# Being that this is the first time using Builder, you're not exactly sure how to use it.
# Fortunately, RubyGems installed the documentation for Builder on your machine. We just have to find it.

# As with most things in RubyGems, the documentation for each gem is stored in a central, protected, RubyGems-specific place.
# This will vary by system and by where you may explicitly choose to install your gems.
# The most reliable way to find the documents is to ask the gem command where your RubyGems main directory is located:

# $ gem environment gemdir

# RubyGems stores generated documentation beneath the doc/ subdirectory to this directory.

# The easiest way to view gems' RDoc documentation is to use RubyGems' included gem server utility.
# To start gem server, simply type this:

# $ gem server

# gem server starts a web server running on whatever computer you run it on.
# By default, it will start on port 8808 and will serve gems and their documentation from the default RubyGems installation directory.
# Both the port and the gem directory are overridable via command-line options, using the -p and -d options, respectively.

# Once you have started the gem server, if you are running it on your local computer, you can access the documentation for your installed gems by pointing your web browser to http::/localhost:8808.
# There, you will see a list of the gems you have installed with their descriptions and links to their RDoc documentation.
# Click the rdoc link for Builder -- the result will look something like the following.
