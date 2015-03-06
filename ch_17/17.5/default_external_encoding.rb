# If you look at the text files on your computer, the chances are that they'll all use the same encoding.
# In the United States, that will probably be UTF-8 or ASCII.
# In Europe, it might be UTF-8 or ISO-8859-x.
# If you use a Windows box, you may be using a different set of encodings (use the console chcp command to find your current code page).
# But whatever encoding you use, the chances are good that you will stick with it for a majority of your work.

# On Unix-like boxes, you will probably find that you have the LANG environment variable set.
# On one of our OSX boxes, it has the value en_UTF-8.

# This says that we are using the English language in a U.S. territory and the default code set is UTF-8.
# On startup, Ruby looks for this environment variable and, if present, sets the defualt external encoding from the code set component.
# Thus, on this box, Ruby 1.9 programs run with a default external encoding of UTF-8.
# If instead we were in Japan and the LANG variable were set to ja_JP.sjis, the encoding would be set to Shift JIS.
# We can look at the default external encoding by querying the Encoding class.
# While we're at it, we'll experiment with different values in the LANG environment variable:

# $ echo $LANG
# $ ruby -e 'p Encoding.default_external.name'
# $ LANG=ja_JP.sjis ruby -e 'p Encoding.default_external.name'
# $ LANG= ruby -e 'p Encoding.default_external.name'

# The encoding set from the environment does not affect the encoding Ruby uses for source files -- it affects only the encoding of data read and written by your programs.

# Finally, you can use the -E command-line option (or the long form --encoding) to set the default external encoding of your I/O objects, as shown in the following commands.

# $ ruby -E utf-8 -e 'p Encoding.default_external.name'
# $ ruby -E sjis -e 'p Encoding.default_external.name'
# $ ruby -E sjis:iso-8859-1 -e 'p Encoding.default_internal.name'
