# At the heart of the Ruby encoding system is the Encoding class.
# For a nice, easy read on encodings, character sets, and Unicode, you could take a look at Joel Spolsky's 2003 article on the Web at http://www.joelonsoftware.com/articles/Unicode.html.
# Objects of class Encoding each represent a different character encoding.
# The Encoding.list method returns a list of the built-in encodings, and the Encoding.aliases method returns a hash where the keys are aliases and the values are the corresponding base encoding.
# We can use these two methods to build a table of known encoding names:

encodings = Encoding 
              .list 
              .each.with_object({}) do |enc, full_list|
                  full_list[enc.name] = [enc.name]
              end

Encoding.aliases.each do |alias_name, base_name|
  fail "#{base_name} #{alias_name}" unless encodings[base_name]
  encodings[base_name] << alias_name
end

puts(encodings
      .values
      .sort_by {|base_name, *| base_name.downcase}
      .map do |base_name, *rest|
        if rest.empty?
          base_name
        else
          "#{base_name} (#{rest.join(', ')})"
        end
      end)

# Table 8, Encodings and their aliases, on pp 241 shows the output, wrapped into columns.

# However, that's not the full story.
# Encodings in Ruby can be dynamically loaded -- Ruby actually comes with more encodings than those shown in the output from this code.

# Strings, regular expressions, symbols, I/O streams, and program source files are all associated with one of these encoding objects.

# Encodings commonly used in Ruby programs include ASCII(7-bit characters), ASCII-8BIT (which is a useful Ruby fantasy that will be discussed a bit later), UTF-8, and Shift JIS.
