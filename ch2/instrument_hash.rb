#!/usr/bin/ruby
inst_section = {
  'cello' => 'string',
  'clarinet' => 'woodwind',
  'drum' => 'percussion',
  'oboe' => 'woodwind',
  'trumpet' => 'brass',
  'violin' => 'string'
}
# Keys on left, values on right
# Keys in a particular hash must be unique

p inst_section['oboe']
p inst_section['cello']
p inst_section['bassoon']

inst_section2 = {
  :cello => 'string',
  :clarinet => 'woodwind',
  :drum => 'percussion',
  :oboe => 'woodwind',
  :trumpet => 'brass',
  :violin => 'string'
}

p inst_section2[:oboe]
p inst_section2[:cello]
p inst_section2[:bassoon]
p inst_section2['cello'] # strings are not the same as symbols

# Use name:value pairs to create a hash if the keys are symbols

inst_section3 = {
  cello:    'string',
  clarinet: 'woodwind',
  drum:     'percussion',
  oboe:     'woodwind',
  trumpet:  'brass',
  violin:   'string'
}

puts "An oboe is a #{inst_section3[:oboe]} instrument"
