# You can access operating system environment variables using the predefined variable ENV. 
# It responds to the same methods as Hash.
# ENV is not actually a hash, but if you need to, you can convert it into a hash using ENV#to_hash.

# ENV['SHELL']
# ENV['HOME']
# ENV['USER']
# ENV.keys.size
# ENV.keys[0, 4]

# The values of some environment variables are read by Ruby when it first starts.
# These variables modify the behavior of the interpreter.

# The environment variables used by Ruby are listed in the following table:


# DLN_LIBRARY_PATH
# Specifies the search path for dynamically loaded modules.

# HOME
# Points to the user's home directory. This is used when expanding ~ in file and directory names.

# LOGDIR
# Specifies the fallback pointer to the user's home directory if $HOME is not set. This is used only by Dir.chdir.

# OPENSSL_CONF
# Specifies the location of the Open SSL configuration file.

# RUBYLIB 
# Specifies an additional search path for Ruby programs ($SAFE must be 0).

# RUBYLIB_PREFIX
# (Windows only) Mangles the RUBYLIB search path by adding this prefix to each component.

# RUBYOPT 
# Specifies additional command-line options to Ruby; examined after real command-line options are parsed ($SAFE must be 0).

# RUBYPATH
# With -S option, specifies the search path for Ruby programs (defaults to PATH).

# RUBYSHELL 
# Specifies shell to use when spawning a process under Windows; if not set, will also check SHELL or COMSPEC.

# RUBY_TCL_DLL
# Overrides default name for Tcl shared library or DLL.

# RUBY_TK_DLL
# Overrides default name for Tk shared library or DLL. Both this and RUBY_TCL_DLL must be set for either to be used.



# Other environment variables affect the memory allocated by the Ruby virtual machine for various tasks. This applies to MRI only.


# RUBY_THREAD_VM_STACK_SIZE
# The VM stack size used at thread creation: 128KB (32 bit CPU) or 256KB (64 bit CPU).

# RUBY_THREAD_MACHINE_STACK_SIZE
# The machine stack size used at creation: 512KB (32 bit CPU) or 1024KB (64 bit CPU).

# RUBY_FIBER_VM_STACK_SIZE
# VM stack size used at fiber creation: 64 KB or 128KB.

# RUBY_FIBER_MACHINE_STACK_SIZE
# The machine stack size used at fiber creation: 256KB for 32- or 64-bit CPU.


# The current value of these variables can be read using RubyVM::DEFAULT_PARAMS (in IRB).
