require_relative 'show_regexp'

# We know that the vertical bar (|) is special, because our line-splitting pattern had to escape it with a backslash. That's because an unescaped vertical bar, as in |, matches either the construct that precedes it or the construct that follows it.

a = "red ball blue sky"
p show_regexp(a, /d|e/)
p show_regexp(a, /al|lu/)
p show_regexp(a, /red ball|angry sky/)

# There's a trap for the unwary here, because | has a very low precedence. The last example in the previous lines matches 'red ball' or 'angry sky', not 'red ball sky' or 'red angry sky'. To match 'red ball sky' or 'red angry sky', you'd need to override the default precedence using grouping.
