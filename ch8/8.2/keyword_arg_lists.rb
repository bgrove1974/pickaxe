# Let's look inside our search method. It gets passed a field name and an options hash. Maybe we want to default the duration to 120 seconds, and validate that no invalid options are passed. Before Ruby 2.0, the code would look something like this:

def search(field, options)
  options = { duration: 120 }.merge(options)
  if options.has_key?(:duration)
    duration = options[:duration]
    options.delete(:duration)
  end
  if options.has_key?(:genre)
    genre = options[:genre]
    options.delete(:genre)
  end
  fail "Invalid options: #{options.keys.join(', ')}" unless options.empty?
  # rest of method
end

# Do this enough times, and you end up writing a helper function to validate and extract hash parameters to methods.

# Ruby 2 to the rescue. You can now define keyword arguments to your methods. You still pass in the hash, but Ruby now matches the hash contents to your keyword argument list. It also validates that you don't pass in any unknown arguments.

def search(field, genre: nil, duration: 120)
  p [field, genre, duration ]
end

search(:title)
search(:title, duration: 432)
search(:title, duration: 432, genre: "jazz")
puts " "

# Pass in an invalid option, and Ruby complains:

def search(field, genre: nil, duration: 120)
  p [field, genre, duration ]
end

# search(:title, duraton: 432)  # duration is misspelled, so an ArgumentError is thrown
# puts " "

# You can collect these extra hash arguments as a hash parameter -- just prefix one element of your argument list with two asterisks (a double splat).

def search(field, genre: nil, duration: 120, **rest)
  p [field, genre, duration, rest ]
end

search(:title, duration: 432, stars: 3, genre: "jazz", tempo: "slow")
puts " "

# And, just to prove that all we're passing in is a hash, here's the same calling sequence:

def search(field, genre: nil, duration: 120, **rest)
  p [field, genre, duration, rest ]
end

options = { duration: 432, stars: 3, genre: "jazz", tempo: "slow" }
search(:title, options)

# A well-written Ruby program will typically contain many methods, each quite small, so it's worth getting familiar with the options available when defining and using them. At some point you'll probably want to read Method Arguments pp 324 to see exactly how arguments in a method call get mapped to the method's formal parameters when you have combinations of default parameters and splat parameters.
