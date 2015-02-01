# Earlier we asked you to ignore the scaffolding around the tests. Now it's time to look at it.

# You include the testing framework facilities in your unit test either with this:

# require 'test/unit'

# or, for raw MiniTest, with this:

# require 'minitest/unit'

# Unit tests seem to fall quite naturally into high-level groupings, called test cases, and lower-level groupings, which are the test methods themselves.
# The test cases generally contain all the tests relating to a particular facility or feature.
# Our Roman number class is fairly simple, so all of the tests for it will probably be in a single test case.
# Within the test case, you will probably want to organize your assertions into a number of test methods, where each method contains the assertions for one type of test; one method could check regular number conversions, another could test error handling, and so on.

# The classes that represent test cases must be subclasses of Test::Unit::TestCase.
# The methods that hold the assertions must have names that start with test.
# This is important: the testing framework uses reflection to find tests to run, and only methods whose names start with 'test' are eligible.

# Quite often you will find that all of the test methods within a test case start by setting up a particular scenario.
# Each test method then probes some aspect of that scenario.
# Finally, each method may then tidy up after itself.
# For example, we could be testing a class that extracts jukebox playlists from a database.
# We're using the low-level DBI library to access the database.

##! The following code is different from the book.
##! An error was thrown when I tried to use the 'refute_empty method':
##! NoMethodError: undefined method `refute_empty' for #<TestPlaylistBuilder:0x007f9c4d0c70b0>
##! I replaced 'refute_empty' with 'assert_not_empty', and the tests passed, although the number of assertions tested were 46 in the book output and 23 for my code's output.
##! This error was resolved when I installed the test-unit-3.0.9.gem. Now, either 'refute_empty' or 'assert_not_empty' works, but I still only have 23 assertions after my test vs 46 in the book.

require 'test/unit'
require_relative 'playlist_builder'

class TestPlaylistBuilder < Test::Unit::TestCase
  
  def test_empty_playlist
    db = DBI.connect('DBI:mysql:playlists')
    pb = PlaylistBuilder.new(db)
    assert_empty(pb.playlist)
    db.disconnect
  end

  def test_artist_playlist
    db = DBI.connect('DBI:mysql:playlists')
    pb = PlaylistBuilder.new(db)
    pb.include_artist("krauss")
    assert_not_empty(pb.playlist, "Playlist shouldn't be empty")
    pb.playlist.each do |entry|
      assert_match(/krauss/i, entry.artist)
    end
    db.disconnect
  end

  def test_title_playlist
    db = DBI.connect('DBI:mysql:playlists')
    pb = PlaylistBuilder.new(db)
    pb.include_title("midnight")
    refute_empty(pb.playlist, "Playlist shouldn't be empty")
    pb.playlist.each do |entry|
      assert_match(/midnight/i, entry.title)
    end
    db.disconnect
  end

  # ...
end

# This section continues with another test program for 'playlist_builder' in structuring_tests2.rb.
