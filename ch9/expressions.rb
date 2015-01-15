# So far, we've been fairly cavalier in our use of expressions in Ruby. After all, a = b + c is pretty standard stuff.

# One of the first differences with ruby is that anything that can reasonably return a value does: just about everything is an expression. What does this mean in practice?
# Some obvious things include the ability to chain statements together:

p a = b = c = 0
p [ 3, 1, 7, 0 ].sort.reverse
puts " "

# Perhaps less obvious, things that are normally statements in C or Java are expressions in Ruby.
# For example, the if and case statements both return the value of the last expression executed:

song_type = if song.mp3_type == MP3::Jazz  # Song is not defined, so this code will throw a NameError
                if song.written < Date.new(1935, 1, 1)
                    Song::TradJazz
                else
                    Song::Jazz
                end
            else
                Song::Other
            end

rating = case votes_cast
         when 0..10    
           then Rating::SkipThisOne
         when 10..50   
           then Rating::CouldDoBetter
         else          
           Rating::Rave
         end

# See more about if and case on pp 135.
