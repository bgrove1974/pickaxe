# As Daniel Berger pointed out (http://www.oreillynet.com/ruby/blog/2007/10/fun_with_unicode_1.html), we can now do fun things with method and variable names:

# encoding: utf-8
def ∑(*args)
  args.inject(:+)
end

puts ∑ 1, 3, 5, 9

# Of course, this way can lead to some pretty obscure and hard-to-use code.
# For example, is the summation character in the previous code a real summation, \u2211, or a Greek sigma, \u03a3?
# Just because we can do something doesn't mean we necessarily should.
