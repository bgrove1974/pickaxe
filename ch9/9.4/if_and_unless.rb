# An if expression in Ruby is pretty similar to if statements in other languages:

if artist == "Gillespie" then
  handle = "Dizzy"
elsif artist == "Parker" then
  handle = "Bird"
else
  handle = "unknown"
end

# The then keyword is optional if you lay out your statements on multiple lines:

if artist == "Gillespie" 
  handle = "Dizzy"
elsif artist == "Parker" 
  handle = "Bird"
else
  handle = "unknown"
end

# However, if you want to lay out your code more tightly, you must separate the boolean expression from the following statements with the then keyword:  (Ruby 1.8 allowed you to use a colon instead of then; this is no longer supported)

if artist == "Gillespie" then handle = "Dizzy"
elsif artist == "Parker" then handle = "Bird"
else  handle = "unknown"
end

# You can have zero or more elsif clauses and an optional else clause. There is no e in the middle of elsif.
# An if statement is an expression -- it returns a value. You don't have to use the value of an if statement, but it can come in handy:

handle = if artist == "Gillespie"
           "Dizzy"
         elsif artist == "Parker"
           "Bird"
         else
           "unknown"
         end

# Ruby also has a negated form of the if statement: 

unless duration > 180
  listen_intently
end

# The unless statement does support else, but most people seem to agree that it's clearer to switch to an if statement in these cases.

# Ruby also supports the C-style conditional expression:

cost = duration > 180 ? 0.35 : 0.25

# A conditional expression returns the value of the expression either before or after the colon, depending on whether the boolean expression before the question mark is true or false.
# In the previous example, if the duration is greater than three minutes, the expression returns 0.35. For shorter durations, it returns 0.25. the result is then assigned to cost. 
