# Ruby shares a neat feature with Perl. Statement modifiers let you tack conditional statements onto the end of a normal statement.

mon, day, year = $1, $2, $3 if date =~ /(\d\d) - (\d\d) - (\d\d)/
puts "a = #{a}" if $DEBUG
print total unless total.zero?

# For an if modifier, the preceding expression will be evaluated only if the condition is true.
# unless works the other way around:

File.foreach("/etc/passwd") do |line|
  next if line =~ /^#/             # Skip comments
  parse(line) unless line =~ /^$/  # Don't parse empty lines
end

# Because if itself is an expression, you can get really obscure with statements such as this:

if artist == "John Coltrane"
  artist = "'Trane"
end unless use_nicknames == "no"

# This path leads to the gates of madness.
