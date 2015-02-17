# encoding: sjis

require_relative 'iso-8859-1'
require_relative 'utf'

def show_encoding(str)
  puts "'#{str.bytes.to_a}' (#{str.size} chars, #{str.bytesize} bytes) " + "has encoding #{str.encoding.name}"
end

puts show_encoding(STRING_ISO)
puts show_encoding(STRING_U)
puts show_encoding("cat")
