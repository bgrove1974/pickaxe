# First and foremost, there's a simple rule: if you only ever use 7-bit ASCII characters in your source code, then the source file encoding is irrelevant.
# So, the simplest way to write Ruby source files that just work everywhere is to stick to boring old ASCII.

# However, once a source file contains a byte whose top bit is set, you've just left the comfortable world of ASCII and entered the wild and wacky nightmare of character encodings.
# Here's how it works.

# If your source files are not written using 7-bit ASCII, you probably want to tell Ruby about it.
# Because the encoding is an attribute of the source file, and not anything to do with the environment where the file is used, Ruby has a way of setting the encoding on a file-by-file basis using a new 'magic comment'.
# If the first line of a file (or a string passed to eval) is a comment (or the second line if the first line is a #! shebang line), Ruby scans it looking for the string 'coding:'.
# If it finds it, Ruby then skips any spaces and looks for the (case-insensitive) name of an encoding.
# Thus, to specify a that a source file is in UTF-8 encoding, you can write this:

# #  coding:   utf-8 

# As Ruby is just scanning for coding:, you could also write the following:

# #  encoding:   ascii 

# Emacs users might like the fact that this also works:

# #  -*- encoding:   shift__jis -*-

# Your favorite editor may also support some kind of flag comment to set a file's encoding.

# If there's a shebang line, the encoding comment must be the second line of the file:

# #!/usr/local/rubybook/bin/ruby 
# #  encoding:   utf-8 

# Additionally, Ruby detects any files that start with a UTF-8 byte order mark (BOM)
# If Ruby sees the byte sequence \xEF\xBB\xBF at the start of a source file, it assumes that the file is UTF-8 encoded.

# The special constant __ENCODING__ returns the encoding of the current source file.
