#!/usr/bin/ruby

num_pallets = 0
weight      = 0
while weight < 100 and num_pallets <= 5
  pallet = next_pallet() # undefined method 'next_pallet' for main:Object (NoMethodError)
  weight += pallet.weight
  num_pallets += 1
end
