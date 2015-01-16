# If Ruby sees any splats on the right side of an assignment (that is, rvalues preceded by an asterisk,) each will be expanded inline into its constituent values during the evaluation of the rvalues and before the assignment to lvalues starts.

a,b,c,d,e = *(1..2),3,*[4,5]  # a=1, b=2, c=3, d=4, e=5
p a,b,c,d,e
puts " "

# Exactly one lvalue may be a splat. This makes it greedy -- it will end up being an array, and that array will contain as many of the corresponding rvalues as possible.
# If the splat is the last lvalue, it will soak up any rvalues that are left after assigning to previous lvalues:

a,*b = 1,2,3  # a=1, b=[2,3]
p a,b
a,*b = 1      # a=1, b=[]
p a,b 
puts " "

# If the splat is not the last lvalue, then Ruby ensures that the lvalues that follow it will all receive values from rvalues at the end of the right side of the assignment.
# The splat lvalue will soak up only enough rvalues to leave one for each of the remaining lvalues.

*a,b = 1,2,3,4        # a=[1,2,3], b=4
p a,b 
c,*d,e = 1,2,3,4      # c=1, d=[2,3], e=4
p c,d,e 
f,*g,h,i,j = 1,2,3,4  # f=1, g=[], h=2, i=3, j=4
p f,g,h,i,j
puts " "

# As with method parameters, you can use a raw asterisk to ignore some rvalues:

first,*,last = 1,2,3,4,5,6  # first=1, last=6
p first,last
