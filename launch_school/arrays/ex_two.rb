=begin
some common methods: 
.first, .last, .pop(), .push(), .detele(), .at(index)
.detele_at(), .unshift(), .each, .map, .collect
.uniq, .select, .flatten, .to_s
.each_index, .each_with_index, .include?, .product()
=end

arr = [[1, 2, 3], [4, 5]]

arr.index(5) # returns nil, bc there is no 5 in the first level

# how to change the value of an item

names = ['joe', 'brady', 'jimmy', 'margaret', 'jody', 'katie']

# if we want to change the value of margaret to millie, then

names[names.index('margaret')] = 'millie'

p names.include?('margaret')

p names.include?('millie')

# how to use .each_with_index

names.each_with_index {|v, i| p "#{i}: #{v.capitalize}"}


# iterating over an array and creating a new array

og_array = Array(1..10)

nw_array = og_array.map {|n| n + 2}

p og_array, nw_array