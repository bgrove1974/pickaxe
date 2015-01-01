# Extract and clean the data in songdata.rb.
# 1. Break each line into fields.
# 2. Remove those extra spaces from the artist's names.
# 3. Convert the running times from mm:ss to seconds.

# Pass split a regex, /\s*\|\s*/, that splits the line into tokens wherever split finds a vertical bar, optionally surrounded by spaces. Then, because the line read from the file has a trailing newline, we'll use String#chomp to strip it off just before we apply the split. We'll store details of each song in a Struct that contains an attribute for each of the three fields.
# Struct is a data structure that contains a given set of attributes, in this case, the title, name, and length.

# Song = Struct.new(:title, :name, :length)

# File.open("songdata") do |song_file|
#   songs = []

#   song_file.each do |line|
#     file, length, name, title = line.chomp.split(/\s*\|\s*/)
#     songs << Song.new(title, name, length)
#   end

#   puts songs[0]
#   puts songs[1]
#   puts songs[2]
# end


# The songdata file has the artist's names entered in columns, so some of them contain extra spaces that we are going to remove.

# Song = Struct.new(:title, :name, :length)  # We could also add :file, if we wanted

# File.open("songdata") do |song_file|
#   songs = []

#   song_file.each do |line|
#     file, length, name, title = line.chomp.split(/\s*\|\s*/)  # Break each line into fields and put each song on its own line
#     name.squeeze!(" ")  # Remove extra spaces in the artist's names
#     songs << Song.new(title, name, length)  # We could also add file, if we wanted
#   end

#   puts songs[0]
#   puts songs[1]
#   puts songs[2]
# end


# Now to change the length format from minutes and seconds to seconds.
# We could use split again, this time splitting the time field around the colon character:
  #  "2:58".split(/:/) => ["2", "58"]
# Instead, we'll use a related method called String#scan that breaks a string into chunks based on a pattern. However, unlike split, with scan you specify the pattern that you want the chunks to match. In this case, we want to match one or more digits for both the minutes and seconds components. The pattern for one or more digits is /\d+/.

Song = Struct.new(:title, :name, :length)  # We could also add :file, if we wanted

File.open("songdata") do |song_file|
  songs = []

  song_file.each do |line|
    file, length, name, title = line.chomp.split(/\s*\|\s*/)  # Break each line into fields and put each song on its own line
    name.squeeze!(" ")  # Remove extra spaces in the artist's names
    mins, secs = length.scan(/\d+/)  # Match one or more digits for the minutes and seconds components
    songs << Song.new(title, name, mins.to_i*60 + secs.to_i)  # Convert mm:ss to seconds  
  end

  puts songs[0]
  puts songs[1]
  puts songs[2]
end
