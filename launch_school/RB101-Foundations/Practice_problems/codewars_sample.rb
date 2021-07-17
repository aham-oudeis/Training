=begin
**Problem**
-make an array with n elemments
-all elements are of same length
-first element contains   '*' in the middle
-second element contains '***' in the middle and so on
-length of each element is the total number of * in its final element
-the last element has (2 * n - 1) number of stars where n is the size of the array
-
=end

# Mexican Wave
=begin
**Problem**
input: a string
output: an array with string.size number of element
        each element is transformed:
          the first element has its first letter upcased
          the second element has its second letter upcased

**Data Structure and Algorithms**
-initialize an array, say, wave
-iterate through the string
-on each iteration, change the string into array, upcase its corresponding elemtent
-join the resulting array and push it to the wave array
=end
# def dirReduc(arr)
#   dir_stack  = []
#   pairs = {'EAST' => 'WEST', 'WEST' => 'EAST',
#             'SOUTH' => 'NORTH', 'NORTH' => 'SOUTH'}
#   arr.each do |item|
#     if dir_stack.last == pairs[item]
#       dir_stack.pop
#     else
#       dir_stack.push(item)
#     end
#   end
#   dir_stack
# end

# p dirReduc(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"])

# def encrypt_one(str)
#   chars = str.chars
#   arr = [[],[]]

#   chars.each_with_index do |item, index|
#     arr[0].push(item) if index.odd?
#     arr[1].push(item) if index.even?
#   end

#   arr.join
# end

# def encrypt(str, num)
#   num == 1 ? encrypt_one(str) : encrypt(encrypt_one(str), num - 1)
# end

# def decrypt_one(str)
#   half = str.size / 2
#   partition = [str[...half].chars, str[half..].chars]
#   reconstructed = []
#   str.chars.each_with_index do |item, index|
#     reconstructed << partition[0].shift if index.odd?
#     reconstructed << partition[1].shift if index.even?
#   end
#   reconstructed.join
# end

# def decrypt(str, num)
#   if num == 1
#     decrypt_one(str)
#   else
#     decrypt(decrypt_one(str), num - 1)
#   end
# end

# a = encrypt("This is a test!", 1) #== "hsi  etTi sats!"

# b = encrypt("This is a test!", 2) #-> "hsi  etTi sats!" -> "s eT ashi tist!"

# puts a
# puts b

# puts decrypt(a, 1)
# puts decrypt(b, 2)

=begin
**Problem**
input: array
output: string with extracted range

key_step: iterate through the list and check if the next number is consequetive num

the main difficulty lies in doing this check and appending the relevant integers

**Algorith**
1. initialize an array
2, iterate through the given array
3. add the first item to the initialized array as a nested array
4. if the second item is a consequetive number, then check for the next item
5. if the next item is not a consequetive number, then take the last number
  and append it to the current sub-array and go to the consequetive number
6. push the consequetive number as a nested array and repeat 4-6
7. when the iteration is complete, transform the array as follows:
  i. if the sub-array contains a single element, then return the element
  ii. if the sub-array contains two elements, return a string joining two elements with a dash
8. join all the elements in the array
=end

# def join_by_range(arr)
#   arr.map {|grp| grp.size < 2 ? grp[0].to_s : grp[0].to_s + "-" + grp[-1].to_s}
#      .join(",")
# end

# def slice_by_range(arr)
#   arr.each_with_object([]) do |arr, new_arr|
#     if arr.size == 1
#       new_arr << arr
#     elsif arr.size == 2
#       new_arr << [arr.first] << [arr.last]
#     else
#       new_arr << [arr.first, arr.last]
#     end
#   end
# end

# def slice_if_consequent(arr)
#   interim = []
#   arr.each_with_index do |item, idx|
#     item != arr[idx - 1] + 1 ? interim << [item] : interim[-1] << item
#   end
#   interim
# end

# def solution(arr)
#   join_by_range(slice_by_range(slice_if_consequent(arr)))
# end

# nums = [-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]

# p solution(nums)
=begin
**Problems**
-inputs: number(length 1 to 8
-output: all possible combinations based on neighbor numbers
-we have to generate an array with all possible combinations

**examples**

12 = [12, 22, 42, 11, 13, 15]
=end
require 'pry'

POSSIBLES = { "0"=>["0", "8"],
              "1"=>["1", "2", "4"],
              "2"=>["1", "2", "3", "5"],
              "3"=>["2", "3", "6"],
              "4"=>["1", "4", "5", "7"],
              "5"=>["2", "4", "5", "6", "8"],
              "6"=>["3", "5", "6", "9"],
              "7"=>["4", "7", "8"],
              "8"=>["5", "7", "8", "9", "0"],
              "9"=>["6", "8", "9"] }

# def recursive_product(arr, size)
#   if size == 1
#     arr.flatten
#   else
#     mid_arr = [arr[0].product(arr[1]).map {|sub_arr| sub_arr.join}] +
#                arr.slice(2..-1)

#     recursive_product(mid_arr, size - 1)
#   end
# end

# def get_pins(observed)
#   alternatives = observed.chars.map {|d| POSSIBLES[d]}
#   recursive_product(alternatives, observed.to_s.size)
# end

def get_pins(observed)
  alternatives = observed.chars.map {|d| POSSIBLES[d]}
  if alternatives < 2
    alternatives.flatten
  else
    alternatives.reduce(&:product).map(&:join)
  end
end

p get_pins('01021')

# 369

# ["11", "22", "44", "12", "21", "14", "41", "24", "42"],