# People commonly use hashes as a way of passing optional named arguments to a method.
# For example, we could consider adding a search facility to an MP3 playlist:

class SongList
  def search(field, params)
    # ...
  end
end

list = SongList.new
p list.search(:titles, { genre: "jazz", duration_less_than: 270 })

# The first parameter tells the search what to return. The second parameter is a hash literal of search parameters.
# Note how we used symbols as the keys for this options hash. This has become idiomatic in Ruby libraries and frameworks.
# The use of a hash means we can simulate keywords: look for songs with a genre of "jazz" and a duration less than 4.5 minutes.

# However, this approach is slightly clunky, and that set of braces could easily be mistaken for a block associated with the method. So, Ruby has a shortcut. You can place key => value pairs in an argument list, as long as they follow any normal arguments and precede any splat and block arguments. All these pairs will be collected into a single hash and passed as one argument to the method. No braces are needed.

p list.search(:titles, genre: "jazz", duration_less_than: 270)
