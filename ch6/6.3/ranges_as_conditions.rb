# Ranges can also be used as conditional expressions. Here, they act as a kind of toggle switch -- they turn on when the condition in the first part of the range becomes true, and they turn off when the condition in the second part becomes true.
# For example, the following code fragment prints sets of lines from standard input, where the first line in each set contains the word 'start' and the last line contains the word 'end'.

while line = gets
  puts line if line =~ /start/ .. line =~ /end/
end

# Behind the scenes, the range keeps track of the state of each of the tests.
