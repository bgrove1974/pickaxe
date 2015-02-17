# SOURCE ENCODING IS PER-FILE

# Clearly, a large application will be built from many source files.
# Some of these files may come from other people (possibly as libraries or gems).
# In these cases, you may not have control over the encoding used in a file.

# Ruby supports this by allowing different encodings in the files that make up a project.
# Each file starts with the default encoding of US-ASCII (Ruby 1.9) or UTF-8 (Ruby 2.0 +).
# The file's encoding may then be set with either a coding: magic comment or a UTF-8 BOM.

# In the other files in this directory (encoding), each file has an independent encoding which is stated in the file name.
# String literals in each file retain their own encoding, even when used in a different file.
# All the encoding directive does is tell Ruby how to interpret the characters in the file and what encoding to use on literal strings and regular expressions.
# Ruby will never change the actual bytes in a source file when reading them.

# Check out the other files in this directory to see how different files with different encodings can play nice together.
