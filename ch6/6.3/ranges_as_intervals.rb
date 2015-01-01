# We can also use range as an interval test: seeing whether some value falls within the interval represented by the range. We do this using the case equality operator, ===.

puts (1..10)    === 5
puts (1..10)    === 15
puts (1..10)    === 3.14159
puts ('a'..'j') === 'c'
puts ('a'..'j') === 'z'

# This is most often used in case statements:
puts "What is your car's age (in years)?"
car_age = gets.to_f  
case car_age
when 0...1
  puts "Mmm.. new car smell"
when 1...3
  puts "Nice and new"
when 3...10
  puts "Reliable but slightly dinged"
when 10...30
  puts "Bucket"
else
  puts "Vintage gem"
end

# Note the use of exclusive ranges in the previous example. If we had used inclusive ranges instead, an answer like 9.5 would not fall within any of the ranges and trigger the else clause.
