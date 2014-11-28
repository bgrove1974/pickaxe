#!/usr/bin/ruby

# Iterators are methods that return successive elements from
# some kind of collection, such as an array:
animals = %w( ant bee cat dog )      #create an array
animals.each {|animal| puts animal } #iterate over the contents

[ 'cat', 'dog', 'horse' ].each {|name| print name, " " }
5.times { print "*" }
3.upto(6) {|i| print i }
('a'..'e').each {|char| print char }
puts
