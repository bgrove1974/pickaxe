# CODE EXECUTION COVERAGE

# Ruby 1.9.2 (and above, I'm guessing) comes with low-level code coverage built into the interpreter (see the Coverage module on pp 740). It tracks which lines of code were executed in your code.

# Peolpe are starting to build libraries that wrap this low-level functionality with filters, HTML output, and the like.
# Two examples are Mark Bates' CoverMe and Christoph Olszowka's simplecov.

# Both are installed as gems, and both come with comprehensive instructions on how to integrate them into your test environment.

# For our simple tennis scoring example, the summary, written as an HTML file, is fairly straightforward:

# See picture on pp 204.

# Click the name of a file, and you will get a display of which lines were executed.

# A list of Debugger commands follows on pp 205.
