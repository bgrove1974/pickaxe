#!/usr/bin/ruby

require 'csv' # standard CSV library
require_relative 'book_in_stock' # needs BookInStock class

# This class consolidates and summarizes CSV data feeds
class CsvReader
  def initialize # initialize method is always private
    @books_in_stock = [] # initialize an array of values in an instance variable
  end

  def read_in_csv_data(csv_file_name) # iterate over the rows and extract the values by name
    CSV.foreach(csv_file_name, headers: true) do |row| # tell CSV library to open the file with the given name
      @books_in_stock << BookInStock.new(row["ISBN"], row["Price"]) # extract data, use the data to create a new 
    end                                                             # BookInStock object, then append that object
  end                                                               # to the @books_in_stock variable

  def total_value_in_stock
    sum = 0.0
    @books_in_stock.each {|book| sum += book.price}
    sum
  end

  def number_of_each_isbn

  end
end

# We can call this class using something like this:
#reader = CsvReader.new
#reader.read_in_csv_data("file1.csv")
#reader.read_in_csv_data("file2.csv")
#    :       :                :
#puts "Total value in stock = #{reader.total_value_in_stock}"

