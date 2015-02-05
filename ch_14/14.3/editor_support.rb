# The Ruby interpreter is designed to read a program in one pass; this means you can pipe an entire program to the interpreter's standard input, and it will work just fine.

# We can take advantage of this feature to run Ruby code from inside an editor.
# In Emacs, for instance, you can select a region of Ruby text and use the command Meta-| to execute Ruby.
# The Ruby interpreter will use the selected region as standard input, and output will go to a buffer named *Shell Command Output*.
# This feature has come in quite handy for us while writing this book -- just select a few lines of Ruby in the middle of a paragraph, and try it!

# You can do something similar in the vi editor using :%ruby, which replaces the program text with its output. Othr editors have similar features.

# Some developers look for IDE support. Several decent alternatives are available.
# Arachno RubyAptana, RubyMine, NetBeans, Ruby in Steel, Idea, and so on, all have their devotees.
# It's a rapidly changing field, so we recommend a quick web search rather than rely on the advice here.

# While we are on the subject, this would probably be a good place to mention that a Ruby mode for Emacs is included in the Ruby source distribution as ruby-mode.el in the misc/ subdirectory.
# Many other editors now include support for Ruby; check the documentation for details.
