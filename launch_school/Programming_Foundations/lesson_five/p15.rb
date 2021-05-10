=begin
Given this data structure write some code to return an array which contains only the hashes where all the integers are even.
-the problem is of selection
=end

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# the central problem with select is that it only sees two elements in the 
# array and does not go deeper in the second hash
# if we only wanted to select among the two, this would be fine

# p (arr.select do |hash|
#   arr_w_values = hash.values
#   if arr_w_values.size < 1
#     arr_w_values.all?(&:even?)
#   else
#     arr_w_values.map {|nest_arr| nest_arr.all?(&:even?)}.all?
#   end
# end)

# but it seems like the problem is about returning something like this 
# [{b: [2, 4, 6]}, {d: [4]}, {e: [8]}, {f: [6, 10]}]

# p (arr.each_with_object([]) do |hash, array|
#       array << (hash.each_with_object({}) do |(k, v), inner_hash|
#                   inner_hash[k] = v if v.all?(&:even?)
#                 end)
#     end)

# that does something but not what I want; it creates an empty hash for 
# each hash pair even if does not have even numbers in its values

p (arr.each_with_object([]) do |hash, array|
    hash.each do |k, v|
      inner_hash = {k => v}
      # inner_hash[k] = v
      array << inner_hash if v.all?(&:even?)
    end
end)