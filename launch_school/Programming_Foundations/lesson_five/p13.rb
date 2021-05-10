=begin
Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.
=end

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# arr.sort_by do |nest_arr|
#   nest_arr.select {|num| num.odd?}
# end

# more compact

p arr.sort_by {|nest_arr| nest_arr.select(&:odd?)}
