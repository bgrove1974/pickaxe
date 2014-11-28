#!/usr/bin/ruby

# The reference section lists the mothods in the class Array on page 421.

# We can index arrays with a pair of numbers, [start, count]
a = [ 1, 3, 5, 7, 9 ]
p a[1, 3]   # => [3, 5, 7]
p a[3, 1]   # => [7]
p a[-3, 2]  # => [5, 7]

# We can index arrays using ranges; 2 periods include the end position, 3 periods does not.
a = [ 1, 3, 5, 7, 9 ]
p a[1..3]   #=> [3, 5, 7]
p a[1...3]  #=> [3, 5]
p a[3..3]   #=> [7]
p a[-3..-1] #=> [5, 7, 9]

# The [] operator has a corresponding []= operator which lets you set elements in the array.
a = [ 1, 3, 5, 7, 9 ]
a[1] = 'bat'
p a #=> [1, "bat", 5, 7, 9]
a[-3] = 'cat'
p a #=> [1, "bat", "cat", 7, 9]
a[3] = [ 9, 8 ]
p a #=> [1, "bat", "cat", [9, 8], 9]
a[6] = 99
p a #=> [1, "bat", "cat", [9, 8], 9, nil, 99]

# If the index to []= is two numbers(a start and a length) or a range, then those elements in the original array
# are replaced by whatever is on the right side of the assignment.
# If the length is zero, the right side is inserted into the array before the start position; no elements are removed.
# If the right side itself is an array, its elements are used in the replacement.
# The array size is automatically adjusted if the index selects a different number of elements than are available
# on the right side of the assignment.
a = [ 1, 3, 5, 7, 9 ]
a[2, 2] = 'cat'
p a #=> [1, 3, "cat", 9]
a[2, 0] = 'dog'
p a #=> [1, 3, "dog", "cat", 9]
a[1, 1] = [ 9, 8, 7 ]
p a #=> [1, 9, 8, 7, "dog", "cat", 9]
a[0..3] = []
p a #=> ["dog", "cat", 9]
a[5..6] = 99, 98
p a #=> ["dog", "cat", 9, nil, nil, 99, 98]

# Use push and pop to add elements to and remove elements from the end of an array.
stack = []
stack.push "red"
stack.push "green"
stack.push "blue"
p stack #=> ["red", "green", "blue"]

# stack.pop removes the last element of an array first (LIFO)
stack.pop #=> "blue"
stack.pop #=> "green"
stack.pop #=> "red"
p stack #=> []

# Use unshift and shift to add elements to and remove elements from the head of an array.
# Combine shift and push, and you have a FIFO queue.
queue = []
queue.push "red"
queue.push "green"
queue.shift #=> "red"
queue.shift #=> "green"
p queue

# The 'first' and 'last' methods return (but don't remove) the n entries at the head or end of an array.
array = [ 1, 2, 3, 4, 5, 6, 7 ]
p array.first(4)  #=> [1, 2, 3, 4]
p array.last(4)   #=> [4, 5, 6, 7]
