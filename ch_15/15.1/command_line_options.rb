# The following is a list of command line options starting at pp 210:

# -0[octal]
# The 0 flag (the digit zero) specifies the record separator character (\0, if no digit follows). -00 indicates paragraph mode: records are separated by two successive default record separator characters. \0777 reads the entire file at once (because it is an illegal character). Sets $/.

# -a 
# Autosplit mode when used with -n or -p; equivalent to executing $F = $_.split at the top of each loop iteration.

# -C directory
# Changes working directory to directory before executing.

# -c 
# Checks syntax only; does not execute the program.

# --copyright 
# Prints the copyright notice and exits.

# -d, --debug 
# Sets $DEBUG and $VERBOSE to true. This can be used by your programs to enable additional tracing.

# --disable-all
# Disable the rubygems and RUBYOPT options (see the following descriptions).

# --disable-gems
# Stops Ruby from automatically loading RubyGems from require. There is a corresponding --enable-gems option.

# --disable-rubyopt
# Prevents Ruby from examining the RUBYOPT environment variable. You should probably set this in an environment you want to secure. There is a corresponding --enable-rubyopt option.

# --dump-option...
# Tells Ruby to dump various items of internal state. options... is a comma or space separated list containing one or more of copyright, insns, parsetree_with_comment, syntax, usage, version, and yydebug. This is intended for Ruby core developers.

# --enable-all
# Enable the rubygems and RUBYOPT options (see the following descriptions).

# --enable-gems
# Allows Ruby to automatically load RubyGems from require. There is a corresponding --disable-gems option.

# --enable-rubyopt
# Allows Ruby to use the RUBYOPT environment variable. (This is the default). You should probably disable this option in an environment you want to secure.

# -E encoding, --encoding encoding, --encoding=encoding
# Specifies the default character encoding for data read from and written to the outside world. This can be used to set both the external encoding (the encoding to be assumed for file contents) and optionally the default internal coding (the file contents are transcoded to this when read and transcoded from this when written). The format of the encoding parameter is -E external, -E external:internal, or -E :internal. See Chapter 17, Character Encoding, pp 239 for details. See also -U.

# -e 'command'
# Executes 'command' as one line of Ruby source. Several -e's are allowed, and the commands are treated as multiple lines in the same program. If 'programfile' is omitted when -e is present, execution stops after the -e commands have been run. Programs run using -e have access to the old behavior of ranges and regular expressions in conditions -- ranges of integers compare against the current input line number, and regular expressions match against $_.

# --external-encoding=encoding 
# Specifies the default external coding for the program.

# -F pattern 
# Specifies the input field separator ($;) used as the default for split (affects the -a option).

# -h, --help
# Displays a short help screen.

# -I directories
# Specifies directories to be prepended to $LOAD_PATH ($:). Multiple -I options may be present. Multiple directories may appear following each -I, separated by a colon on Unix-like systems and by a semicolon on DOS/Windows systems.

# -i[extension]
# Edits ARGV files in place. For each file named in ARGV, anything you write to standard output will be saved back as contents of that file. A backup copy of the file will be made if 'extension' is supplied:
# $ ruby -pi.bak -e "gsub(/Perl/, 'Ruby')" *.txt

# --internal-encoding=encoding 
# Specifies the default internal coding for the program.

# -l 
# Enables automatic line-ending processing; sets $\ to the value of $/ and chops evry input line automatically.

# -n 
# Assumes a while gets; ...; end loop around your program. For example, a simple grep command could be implemented as follows:
# $ ruby -n -e "print if /wombat/"  *.txt 

# -p
# Places your program code within the loop while gets; ...; print; end.
# $ ruby -p -e "$_.downcase!" *.txt

# -r library
# Requires the named library or gem before executing.

# -S 
# Looks for the program file using the RUBYPATH or PATH environment variable.

# -s 
# Any command-line switches found after the program filename, but before any filename arguments or before a --, are removed from ARGV and set to a global variable named for the switch. In the following example, the effect of this would be to set the variable $opt to "electric":
# $ ruby -s prog -opt=electric ./mydata 

# -Tlevel 
# Sets the safe level, which among other things enables tainting and untrusted checks (see Chapter 26, Locking Ruby in the Safe, on pp 409). Sets $SAFE.

# -U 
# Sets the default internal encoding to UTF-8. See Chapter 17, Character Encoding, on pp 239 for details. See also -E.

# -v, --verbose 
# Sets $VERBOSE to true, which enables verbose mode. Also prints the version number. In verbose mode, compilation warnings are printed. If no program filename appears on the command line, Ruby exits.

# --version
# Displays the Ruby version number and exits.

# -w 
# Enables verbose mode. Unlike -v, reads program from standard input if no program files are present on the command line. We recommend running your Ruby programs with -w.

# -W level
# Sets the level of warnings issued. With a 'level' of two (or with no level specified), equivalent to -w -- additional warnings are given. If 'level' is 1, runs at the standard (default) warning level. With -W0, absolutely no warnings are given (including those issued using Object#warn).

# -X directory
# Changes working directory to 'directory' before executing. This is the same as -C directory.

# -x[directory]
# Strips off the text before #!ruby line and changes working directory to 'directory' if given.

# -y, --yydebug
# Enables yacc debugging in the parser (waaay too much information).
