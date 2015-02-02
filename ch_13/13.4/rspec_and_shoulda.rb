# RSPEC AND SHOULDA

# The built-in testing framework has a lot going for it. It is simple, and it is compatible in style with frameworks from other languages (such as JUnit for Java and NUnit for C#).

# However, there's a growing movement in the Ruby community to use a different style of testing.
# So-called behavior-driven development encourages people to write tests in terms of your expectations of the program's behavior in a given set of circumstances.
# In many ways, this is like testing according to the content of user stories, a common requirements-gathering technique used in agile methodologies.
# With these testing frameworks, the focus is not on assertions; instead, you write expectations.

# Although both RSpec and Shoulda allow this style of testing, they focus on different things.
# RSpec is very much concerned with driving the design side of things.
# You can write and execute specs with RSpec well before you have written a line of application code.
# These specs, when run, will output the user stories that describe your application.
# Then, as you fill in the code, the specs mutate into tests that validate that your code meets your expectations.

# Shoulda, on the other hand, is really more focused on the testing side. Whereas RSpec is a complete framework, Shoulda works inside a testing framework, Test::Unit or RSpec.
# You can even mix Shoulda tests with regular Test::Unit and RSpec test methods.
