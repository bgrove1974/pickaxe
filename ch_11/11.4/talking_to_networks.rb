# Ruby is fluent in most of the Internet's protocols, both low-level and high_level.

# For those who enjoy groveling around at the network level, Ruby comes with a set of classes in the socket library (described briefly in this book on pp 807 and in detail at http://pragprog.com/book/ruby3/programming-ruby-1-9?tab=tab-contents).

# These classes in the socket library give you access to TCP, UDP, SOCKS, and Unix domain sockets, as well as any additional socket types supported on your architecture.
# The library also provides helper classes to make writing servers easier.

# Here's a simple program that gets information about the book's user website on a local web server using the HTTP OPTIONS request:

require 'socket'

client = TCPSocket.open('127.0.0.1', 'www')
client.send("OPTIONS /~dave/ HTTP/1.0\n\n", 0)  # 0 means standard packet
puts client.readlines 
client.close

## Running this request on my machine returns 404 Not Found. The output in the book is:

# HTTP/1.1 200 Ok
# Date: Mon, 27 May 2013 17:31:00 GMT
# Server : Apache/2.2.22 (Unix) DAV/2 PHP/5.3.15 with Suhosin-Patch mod_ssl/2.2.22
# OpenSSL/0.9.8r
# Allow: GET, HEAD, POST, OPTIONS
# Content-Length: 0
# Connection: close
# Content-Type: text/html

# At a higher level, the lib/net set of library modules provides handlers for a set of application-level protocols (currently FTP, HTTP, POP, SMTP, and telnet).
# These are documented in the library section on pp 772.

# For example, the following program lists the images that are displayed in this book's home page.

require 'net/http'

http = Net::HTTP.new('pragprog.com', 80)
response = http.get('/book/ruby3/programming-ruby-1-9')

if response.message == "OK"
  puts response.body.scan(/<img alt=".*?" src="(.*?)"/m).uniq[0,3]
end
puts " "

## Again, running this request on my machine returns 404. Check the book for output. I think this issue has something to do with using httpseverywhere in my browser, but I am NOT going to monkey around with my protocols to get the book exercises running.

# Although attractively simple, this example could be improved significantly. In particular, it doesn't do much in the way of error handling. It should really report "Not Found" errors (the infamous 404) and should handle redirects (which happen when a web server gives the client an alternative address for the requested page).

# We can take this to a higher level still. By bringing the open-uri library into a program, the Object#open method suddenly recognizes http:// and ftp:// URLs in the filename. Not just that -- it also handles redirects automatically.

require 'open-uri'

open('https://pragprog.com') do |f|
  puts f.read.scan(/<img alt=".*?" src="(.*?)"/m).uniq[0,3]
end

# The third chunk of code produced the desired results because I specified 'https' instead of 'http' in line 51.
