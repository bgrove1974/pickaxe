# The RubyGems package management system (which is also just called Gems) has become the standard for distributing and managing Ruby code packages.
# As of Ruby 1.9, it comes bundled with Ruby itself.

# RubyGems is also a great way to package your own code.
# If you want to make your code available to the world, RubyGems is the way to go.
# Even if your just sending code to a few friends or within your comapny, RubyGems gives you dependency and installation management -- one day you will be grateful for that.

# RubyGems needs to know information about your project that isn't contained in the directory structure.
# Instead, you have to write a short RubyGems specification: a GemSpec.
# Create this in a separate file named project-name.gemspec in the top-level directory of your application.
# In our case, the file is anagram.gemspec:

Gem::Specification.new do |s|
  s.name          = "anagram"
  s.summary       = "Find anagrams of words supplied on the command line"
  s.description   = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.requirements  = [ 'An installed dictionary (most Unix systems have one)' ]
  s.version       = "0.0.1"
  s.author        = "Dave Thomas"
  s.email         = "dave@pragprog.com"
  s.homepage      = "http://pragdave.pragprog.com"
  s.platform      = Gem::Platform::RUBY 
  s.required_ruby_version = '>=1.9'
  s.files         = Dir['**/**']
  s.executables   = [ 'anagram' ]
  s.test_files    = Dir["test/test*.rb"]
  s.has_doc       = false
end

##! Prior to RubyGems, folks often distributed a tool called setup.rb with their libraries.
##! This would install the library into the standard Ruby directory structure on a user's machine.
##! Take a look at the setup.rb file in the book's source code and be glad you don't have to deal with that.

# Let's go over the GemSpec, shall we?

# The first line of the spec gives our gem a name.
# This is important -- it will be used as part of the package name, and it will appear as the name of the gem when installed.
# Although it can be mixed case, we find that confusing, so do our poor brains a favor and use lowercase for gem names.

# The version string is significant, because RubyGems will use it both for package naming and for dependency management.
# Stick to the x.y.z format (read http://guides.rubygems.org/patterns/ for info on what the letters/numbers mean).

# The platform field tells RubyGems that (in this case) our gem is pure Ruby code.
# It is also possible to package (for example) Windows .exe files inside a gem, in which case you would use Gem::Platform::Win32.

# The next line (s.required_ruby_version) is also important (and often forgotten by package developers).
# Because we use require_relative, our gem will only run with Ruby 1.9 and newer.

# We then tell RubyGems which files to include when creating the gem package.
# Here, we've been lazy and included everything; you can be more specific.

# The s.executables line tells RubyGems to install the anagram command-line script when the gem gets installed on the user's machine.

# To save space, we haven't added RDoc documentation comments to our source files (RDoc is described in Chapter 19, Documenting Ruby, on pp 263).
# The last line of the spec tells RubyGems not to try to extract documentation when the gem is installed.

# We have skipped a lot of details here.
# A full description of GemSpecs is available online, along with other documents on RubyGems (http://www.rubygems.org).
