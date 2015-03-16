# irb uses an initialization file in which you can set commonly used options or execute any required Ruby statements.
# When irb is run, it will try to load an initialization file from one of the following sources in order:
# ~/.irbrc, .irbrc, irb.rc, _irbrc, and $irbrc.

# Within the initialization file, you may run any arbitrary Ruby code.
# You may also set configuration values.
# The list of configuration variables is given in 'irb Configuration Options', on pp 259 -- the values that can be used in an initialization file are the symbols (starting with a colon(:)).
# You use these symbols to set values into the IRB.conf hash.
# for example, to make SIMPLE the default prompt mode for all of your irb sessions, you could have the following in your initialization file:

# IRB.conf[PROMPT_MODE] = :SIMPLE

# As an interesting twist on configuring irb, you can set IRB.conf[IRB_RC] to a Proc object.
# This proc will be invoked whenever the irb context is changed and will receive the configuration for that context as a parameter.
# You can use this facility to change the configuration dynamically based on the context.
# For example, the following .irbrc file sets the prompt so that only the main prompt shows the irb level, but continuation prompts and the result still line up:

IRB.conf[:IRB_RC] = lambda do |conf|
  leader = " " * conf.irb_name.length
  conf.prompt_i = "#{conf.irb_name} --> "
  conf.prompt_s = leader + ' \-" '
  conf.prompt_c = leader + ' \-+ '
  conf.return_format  = leader + " ==> %s\n\n"
  puts "Welcome!"
end

# An irb session using this .irbrc file looks like the following:

$ irb 
Welcome!
irb --> 1 + 2
    ==> 3 

irb --> 2 +
    \-+   6
    ==> 8
