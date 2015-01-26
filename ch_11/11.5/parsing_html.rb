# Having read HTML from a website, you might want to parse information out of it. Often, simple regular expressions do the job.
# In the example that follows, we're using the %r{...} regular expression literal, because the match contains a forward slash character, and regular expressions are complicated enough without having to add extra backslashes.

require 'open-uri'
page = open('https://pragprog.com/titles/ruby3/programming-ruby-1-9').read
if page =~ %r{<title>(.*?)</title>}m 
  puts "Title is #{$1.inspect}"
end
puts " "

# But regular expressions won't always work. For example, if someone had an extra space in the <title> tag, the match would have failed.
# For real-world use, you probably want to use a library that can parse HTML (and XML) properly. Although not part of Ruby, the Nokogiri library is very popular. It's a very rich library -- we'll only scratch the surface here. Documentation is available inside the gem.

require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open("https://pragprog.com/"))

puts "Page title is " + doc.xpath("//title").inner_html

# Output the first paragraph in the div with an id="copyright"
# (nokogiri supports both xpath and css-type selectors)
puts doc.css('div#copyright p')

# Output the second hyperlink in the site-links div using xpath and css
puts "\nSecond hyperlink is"
puts doc.xpath('id("site-links")//a[2]')
puts doc.css('#site-links a:nth-of-type(2)')

# Nokogiri can also update and create HTML and XML.
