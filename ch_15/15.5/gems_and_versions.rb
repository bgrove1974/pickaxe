##! Older versions of Builder don't run with Ruby 1.9 or above.
##! You can still run this code in Ruby 1.8, but you would have to update your code to use the new-style Builder if you want to use Ruby >= 1.9.


# Maybe you started using Builder a few years ago.
# Back then the interface was a little bit different -- with versions prior to Build 1.0, you could say this:

xml = Builder::XmlMarkup.new(STDOUT, 2)
xml.person do
  name ("Ben Grove")
end

# Note that the constructor takes positional parameters.
# Also, in the do block, we can say just name(...), whereas the current Builder requires xml.name(...).
# We could go through our old code and update it all to work with the new-style Builder -- that's probably the best long-term solution.
# But we can also let RubyGems handle the issue for us.

# When we asked for a listing of the Builder gems in the repository, we saw that multiple versions were available.

# $ gem list --details --remote --all builder 

# When we installed Builder previously, we didn't specify a version, so RubyGems automatically installed the latest version.
# But we can also get RubyGems to install a specific version or a version meeting some given criteria.
# Let's install the most recent release of Builder with a version number of less than 1:

# $ gem install builder --version '< 1'
##! The above command will throw an error; the oldest version of Builder available is 1.1.0

# Have we just overwritten the 2.1.2 release of Builder that we had previously installed?
# Let's find out by listing our locally installed gems:

# $ gem list builder 

#  Now that we have both versions installed locally, how do we tell our legacy code to use the old one while still having our new code use the latest version?
# It turns out that require automatically loads the latest version of a gem, so the earlier code on pp 219 will work fine.
# If you want to specify a version number when we load a gem, we have to do a little bit more work, making it explicit that we're using RubyGems:

gem 'builder', '< 1.0'
require 'builder'

xml = Builder::XmlMarkup.new(STDOUT, 2)
xml.person do
  name ("Ben Grove")
  location("Nevada")
end

# The magic is the gem line, which says "When looking for the Builder gem, consider only those versions less than 1.0."
# The subsequent require honors this, so the code loads the correct version of Builder and runs it.
# The "< 1.0" part of the gem line is a version predicate.
# The numbers that follow are of the form 'major.minor.patch_level'.
# The various predicates that RubyGems supports are as follows:

# =     Exact version match. Major, minor, and patch level must be identical.
# !=    Any version that is not the one specified.
# >     Any version that is greater (even at the patch level) than the one specified.
# <     Any version that is less than the one specified.
# >=    Any version greater than or equal to the specified version.
# <=    Any version less than or equal to the specified version.
# ~>    "Boxed" version operator. Version must be greater than or equal to the specified version and less than the specified
#       version after having its minor version number increased by one. This is to avoid API incompatibilities between minor
#       version releases.

# You can specify multiple version predicates, so the following is valid:

gem 'builder', '> 0.1', '< 0.1.5'

# Unfortunately, after all this work, there's a problem.
# Older versions of Builder don't run under 1.9 anyway.
# You can still run this code in Ruby 1.8, but you would have to update your code to use the new-style Builder if you want to use Ruby >= 1.9.


# GEMS CAN BE MORE THAN LIBRARIES

# As well as installing libraries that can be used inside your application code, RubyGems can also install utility programs that you can invoke from the command line.
# Often these utilities are wrappers around the libraries included in the gem.
# For example, Marcel Molina's AWS:S3 gem is a library that gives you programmatic access to Amazon's S3 storage facility.
# As well as the library itself, Marcel provided a command-line utility, s3sh, which lets you interact with your S3 assets.
# When you install the gem, s3sh is automatically loaded into the same bin/directory that holds the Ruby interpreter.

# There is a small problem with these installed utilities.
# Although gems supports versioning of libraries, it does not version command-line utilities.
# With these, it's "last one in wins".
