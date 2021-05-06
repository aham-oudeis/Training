=begin
Requirements
-the original array has to be modified
-the return array object must have the same object id as the input

Algorithm
-take the array and reassign the index by adding negative sign
-arr[0] = arr[0]
-arr[1] = arr[-1]
-arr[2] = arr[-2]

Possible Complications
-the array might be modifed so that it may repeat the same modifed item for the latter half
-to avoid the complication, we can create a new array 
-and replace the original array with the new array
-turns out this complication is avoided in Ruby
=end

# def reverse!(arr)
#   length = arr.length
#   temp_arr = []
#   index = 0
#   loop do
#     break if index == length
#     temp_arr[index] = arr[-(index + 1)]
#     index += 1
#   end
#   arr.replace(temp_arr)
# end

def reverse!(arr)
  length = arr.length
  left_index = 0
  right_index = -1
  loop do
    break if left_index >= (length / 2) 
    arr[left_index], arr[right_index] = arr[right_index], arr[left_index]
    left_index += 1
    right_index -= 1
  end
  arr
end

# def new_reverse(arr)
#   arr.length < 2 ? arr : [arr[-1]] + new_reverse(arr[1..-2]) + [arr[0]]
# end

# def reverse!(arr)
#   arr.replace(new_reverse(arr))
# end

list = [1,2,3,4]
result = reverse!(list)
puts result #== [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse!(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
puts reverse!(list) == [] # true
puts list == [] # true