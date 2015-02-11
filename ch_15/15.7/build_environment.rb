# When Ruby is compiled for a particular architecture, all the relevant settings used to build it (including the architecture of the machine on which it was compiled, compiler options, source code directory, and so on) are written to the module RbConfig within the library file rbconfig.rb.
# After installation, any Ruby program can use this module to get details on how Ruby was compiled:

require 'rbconfig'
include RbConfig
p CONFIG["host"]
p CONFIG["libdir"]

# Extension libraries use this configuration file in order to compile and link properly on any given architecture.
# If you visit the online page for the previous edition of this book at http://pragprog.com/titles/ruby3 and select the 'Contents/Extracts' tab, you can download a free chapter on writing extension libraries.
