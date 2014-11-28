#!/usr/bin/ruby

# The reference section has a list of the methods implemented by the class Hash on page 521.
# Hashes can use any object as an index (aka key).

# This example uses hash literals - a list of key/value pairs between braces.

h = { 'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine' }
p h.length  # => 3
p h['dog']  # => "canine"
h['cow'] = 'bovine'
h[12]    = 'dodecine'
h['cat'] = 99
p h # => {"dog"=>"canine", "cat"=>99, "donkey"=>"asinine", "cow"=>"bovine", 12=>"dodecine"}

# This is a shortcut we can use if the keys are symbols.
h = { :dog => 'canine', :cat => 'feline', :donkey => 'asinine' }

# We can also write the literal by moving the colon to the end of the symbol and dropping the '=>'.
h = { dog: 'canine', cat: 'feline', donkey: 'asinine' }
