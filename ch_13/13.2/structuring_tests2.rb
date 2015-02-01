# Continued from structuring_tests.rb ...

# Each test starts by connecting to the database and creating a playlist builder.
# Each test ends by disconnecting from the database.
# Now, the idea of using a real database in unit tests is questionable, because unit tests are supposed to be fast running, context independent, and easy to set up, but this exercise illustrates a point.

# We can extract all this common code into setup and teardown methods.
# Within a TestCase class, a method called setup will be run before each and every test method, and a method called teardown will be run after each test method finishes.
# Let's emphasize that: the setup and teardown methods bracket each test, rather than being run once per test case.
# This shown in the code that follows:

require 'test/unit'
require_relative 'playlist_builder'

class TestPlaylistBuilder < Test::Unit::TestCase

  def setup
    @db = DBI.connect('DBI:mysql:playlists')
    @pb = PlaylistBuilder.new(@db) 
  end

  def teardown
    @db.disconnect    
  end

  def test_empty_playlist
    assert_empty(@pb.playlist) 
  end

  def test_artist_playlist
    @pb.include_artist("krauss")
    refute_empty(@pb.playlist, "Playlist shouldn't be empty")
    @pb.playlist.each do |entry|
      assert_match(/krauss/i, entry.artist)
    end   
  end

  def test_title_playlist
    @pb.include_title("midnight")
    refute_empty(@pb.playlist, "Playlist shouldn't be empty")
    @pb.playlist.each do |entry|
      assert_match(/midnight/i, entry.title)
    end   
  end

  # ... 
end

# Inside the teardown method, you can detect whether the preceding test succeeded with the passed? method.
 