# By default, Ruby performs no automatic transcoding when reading and writing data.
# However, two command-line options allow you to change this.

# We have already seen the -E option, which sets the default encoding applied to the content of external files.
# When you say -E xxx, the default external encoding is set to xxx.
# However, -E takes a second option.
# In the same way that you can give File#open both external and internal encodings, you can also set a default internal encoding using the option -E external:internal.

# Thus, if all of your files are written with ISO-8859-1 encoding but you want your program to have to deal with their content as if it were UTF-8, you can use this:

$ ruby -E iso-8859-1:utf-8 

# You can specify just an internal encoding by omitting the external option but leaving the colon:

$ ruby -E :utf-8 

# Indeed, because UTF-8 is probably the best of the available transcoding targets, Ruby has the -U command-line option, which sets the internal encoding to UTF-8.

# You can query the defualt internal encoding in your code with the Encoding.default_internal method.
# This returns nil if no default internal encoding has been set.

# One last note before we leave this section: if you compare two strings with different encodings, Ruby does not normalize them.
# Thus, "é" tagged with a UTF-8 encoding will not compare equally to "é" tagged with ISO-8859-1, because the underlying bytes are different.