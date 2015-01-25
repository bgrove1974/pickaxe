# But I miss my C++ iostream

# Just as you can append an object to an array using the << operator, you can also append an object to an output IO stream:

endl = "\n"
STDOUT << 99 << " red balloons" << endl

# Again, the << method uses to_s to convert its arguments to strings before printing them.

# Although we started off disparaging the poor << operator, there are actually some good reasons for using it.
# Because other classes (such as String and Array) also implement a << operator with similar semantics, you can quite often write code that appends to something using << without caring whether it is added to an array, a file, or a string. This kind of flexibility also makes unit testing easy. We discuss this idea in greater detail in the chapter on duck typing on pp 343.
 