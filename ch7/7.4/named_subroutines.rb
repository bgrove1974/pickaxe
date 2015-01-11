# There's a trick that allows us to write subroutines inside regular expressions. Recall that we can invoke a named group using \g<name>, and we define the group using (?<name>...). Normally, the definition of the group is itself matched as part of executing the pattern. However, if you add the suffix {0} to the group, it means "zero matches of this group," so the group is not executed when first encountered.

sentence = %r{
  (?<subject>     cat     | dog     | gerbil      ){0}
  (?<verb>        eats    | drinks  | generates   ){0}
  (?<object>      water   | bones   | PDFs        ){0}
  (?<adjective>   big     | small   | smelly      ){0}
  (?<opt_adj>     (\g<adjective>\s)?              ){0}

  The\s\g<opt_adj>\g<subject>\s\g<verb>\s\g<opt_adj>\g<object>
}x 

md = sentence.match("The cat drinks water")
puts md 
puts "The subject is #{md[:subject]} and the verb is #{md[:verb]}."
puts " "

md = sentence.match("The big dog eats smelly bones")
puts md
puts "The last adjective in this sentence is #{md[:adjective]}."
puts " "

sentence =~ "The gerbil generates big PDFs"
puts "The gerbil generates big PDFs"
puts "And the object in this last sentence is #{$~[:object]}."
