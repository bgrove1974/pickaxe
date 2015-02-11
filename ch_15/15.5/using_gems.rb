# Once a gem is installed, you use require to load it into your program:

require 'builder'

xml = Builder::XmlMarkup.new(target: STDOUT, indent: 2)
xml.person(type: "programmer") do
  xml.name do
    xml.first "Ben"
  end
  xml.location "Nevada"
  xml.preference("ruby")
end
