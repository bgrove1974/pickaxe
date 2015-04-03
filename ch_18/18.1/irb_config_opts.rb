# In the descriptions that follow, a label of the form :XXX signifies a key used in the IRB.cof hash in an initialization file, and conf.xxx signifies a value that can be set interactively.
# The value in square brackets at the end of the option's description is the option's default.

:AUTO_INDENT / auto_indent_mode
  If true, irb will indent nested structures as you type them. [true]

:BACK_TRACE_LIMIT / back_trace_limit 
  Displays n initial and n final lines of backtrace. [16]

:CONTEXT_MODE 
  Specifies what binding to use for new workspaces: 0-> proc at the top level, 1-> binding in a loaded, anonymous file, 2-> per thread binding in a loaded file, 3-> binding in a top-level function. [3]

:DEBUG_LEVEL / debug_level 
  Sets the internal debug level to n. This is useful if you're debugging irb's lexer. [0]

:IGNORE_EOF / ignore_eof 
  Specifies the behavior of an end of file received on input. If true, it will be ignored; otherwise, irb will quit. [false]

:IGNORE_SIGINT / ignore_sigint 
  If false, ^C(ctrl+c) will quit irb. If true, ^C during input will cancel input and return to the top level; during execution, ^C will abort the current operation. [true]

:INSPECT_MODE / inspect_mode 
  Specifies how values will be displayed: true means use inspect, false uses to_s, and nil uses inspect in nonmath mode and to_s in math mode. [nil]

:IRB_RC 
  Can be set to a proc object that will be called when an irb session (or subsession) is started. [nil]

last_value 
  The last value output by irb. [...]

:LOAD_MODULES / load_modules 
  A list of modules loaded via the -r command-line option. [[]]

:MATH_MODE / math_mode 
  If true, irb runs with the math library loaded (described in the library section on pp 768) and does not use inspect to display values. [false]

prompt_c 
  The prompt for a continuing statement (for example, immediately after an if). [depends]

prompt_i 
  The standard, top-level prompt. [depends]

:PROMPT_MODE / prompt_mode 
  The style of prompt to display. [:DEFAULT]

prompt_s 
  The prompt for a continuing string. [depends]

:PROMPT 
  See 'Configuring the Prompt', on pp 261. [...]

:RC / rc 
  If false, do not load an initialization file. [true]

return_format 
  the format used to display the results of an expression entered interactively. [depends]

:SAVE_HISTORY / save_history 
  The number of commands to save between irb sessions. [nil]

:SINGLE_IRB 
  If true, nested irb sessions will all share the same binding; otherwise, a new binding will be created according to the value of :CONTEXT_MODE. [nil]

thread 
  A read-only reference to the currently executing Thread object. [current thread]

:USE_LOADER / use_loader 
  Specifies whether irb's own file reader method is used with load/require. [false]'

:USE_READLINE /use_readline 
  irb will use the readline library (described in the library section on pp 795) if available, unless this option is set to fale, in which case rreadline will never be used, or nil, in which case readline will not be used in inf-ruby-mode. [depends]

:USE_TRACER / use_tracer 
  If true, traces the execution of statements. [false]

:VERBOSE /verbose 
  In theory, switches on additional tracing when true; in practice, almost no extra tracing results. [true]

   