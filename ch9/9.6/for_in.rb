# Earlier we said that the only built-in Ruby looping primitives were while and until. What's this for thing, then? Well, for is almost a lump of syntactic sugar.
# When you write this: 

# for song in playlist
#   song.play 
# end

# Ruby translates it into something like this:

# playlist.each do |song|
#   song.play 
# end

# The only difference between the for loop and the each form is the scope of the local variables that are defined in the body.

# You can use for to iterate over any object that responds to the method each, such as an Array or a Range:

for i in ['fee', 'fi', 'fo', 'fum']
  print i, " "
end
for i in 1..3
  print i, " "
end
for i in File.open("ordinal").find_all {|line| line =~ /d$/}
  print i.chomp, " "
end

# As long as your class defines a sensible each method, you can use a for loop to traverse its objects:

class Periods
  def each
    yield "Classical"
    yield "Jazz"
    yield "Rock"
  end
end

periods = Periods.new
for genre in periods
  print genre, " "
end
