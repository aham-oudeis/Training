=begin
Given this data structure write some code to return an array which contains only the hashes where all the integers are even.
-the problem is of selection
=end

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

=begin
the central problem with select is that it only sees two elements in
the array and does not go deeper in the second hash
if we only wanted to select among the two, this would be fine
=end

# p (arr.select do |hash|
#     arr_w_values = hash.values.flatten
#     arr_w_values.all?(&:even?)
# end)

# a bit more concise
p arr.select {|hash| hash.values.flatten.all?(&:even?)}

# but a more interesting versioon of the problem
# is about returning something like this
# [{b: [2, 4, 6]}, {d: [4]}, {e: [8]}, {f: [6, 10]}]

# p (arr.each_with_object([]) do |hash, array|
#     hash.each do |k, v|
#       inner_hash = {k => v}
#       # or, inner_hash[k] = v
#       array << inner_hash if v.all?(&:even?)
#     end
# end)