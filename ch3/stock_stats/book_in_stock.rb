#!/usr/bin/ruby

# Inventory control for a secondhand bookstore

# This class represents the data for one book
class BookInStock
  attr_reader :isbn, :price 

  def initialize(isbn, price)
    @isbn  = isbn
    @price = Float(price)
  end
end



#class BookInStock # Class names start with upper-case letter
  
#  attr_reader   :isbn # shortcut for writing accessor methods
                      # :isbn is a symbol meaning the name isbn; plain isbn means the value
                      # attr_reader doesn't declare instance variables, it just creates accessor methods
#  attr_accessor :price # replaces def price=(new_price), below

#  def initialize(isbn, price) # method names start with lower-case letter
#    @isbn = isbn # @ means instance variable
#    @price = Float(price) # @ means instance variable
#  end
  
  # The following methods for isbn and price are replaced by attr_reader and attr_accessor, above

  #def isbn # 'isbn' and 'price' are accessor methods. These accessor methods are called attributes 
  #  @isbn
  #end
  #def price # attributes are externally visible facets of an object that
  #  @price  # allow the outside world to interact with the object
  #end

  # The following method is replaced by attr_accessor, above

  #def price=(new_price) # create a method whose name ends with an equals sign
  #  @price = new_price  # these methods can be used as the target of assignments
  #end

#  def price_in_cents # acces the price as an exact number of cents rather than a floating-point integer
#    Integer(price*100 + 0.5)
#  end

  # Use an attribute method to create a virtual instance variable
  # Internally, price_in_cents has no corresponding instance variable
#  def price_in_cents=(cents) # allow people to assign to our virtual attribute
#    @price = cents / 100.0   # map the value to the instance variable internally
#  end

  #def to_s # override the default implementation of to_s in 'puts' method to give a better rendering of objects
  #  "ISBN: #{@isbn}, price: #{@price}"
  #end
#end

#book = BookInStock.new("isbn1", 33.80)
#puts "ISBN           = #{book.isbn}"
#puts "Price          = #{book.price}"
#puts "Price in cents = #{book.price_in_cents}"
#book.price_in_cents = 1234
#puts "Price          = #{book.price}"
#puts "Price in cents = #{book.price_in_cents}"
#book.price = book.price * 0.75  # discount price
#puts "New price = #{book.price}"

#b1 = BookInStock.new("isbn1", 3)
#puts b1 

#b2 = BookInStock.new("isbn2", 3.14)
#puts b2

#b3 = BookInStock.new("isbn3", "5.67")
#puts b3

