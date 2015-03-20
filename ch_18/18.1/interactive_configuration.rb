# Most configuration values are also available while you are running irb.
# The list in irb Configuration Options, on pp 259 shows these values as conf.xxx.
# For example, to change your prompt back to SIMPLE, you could use the following:

⇒  irb
2.2.1 :001 > 1 +
2.2.1 :002 >   2
 => 3 
2.2.1 :003 > conf.prompt_mode = :SIMPLE
=> :SIMPLE
>> 1 +
?> 2
=> 3
>> exit
