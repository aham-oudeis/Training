def rotate_array(arr)
  arr[1..] << arr[0]
end

def rotate_string(str)
  rotate_array(str.chars).join
end

# p rotate_string("Peter")
# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p x
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

def rotate_rightmost_digits(num_arr, int)
  arr_slice = num_arr[-int..]
  remainder_arr = num_arr[0...-int]
  result = remainder_arr + rotate_array(arr_slice)
  result
end

def num_to_arr(num)
  num.digits.reverse
end

def to_string(arr)
  arr.join
end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

def max_rotation(num)
  num_arr = num.digits.reverse
  count = num_arr.size
  loop do
    num_arr = rotate_rightmost_digits(num_arr, count)
    count -= 1
    break if count == 0
  end
  num_arr.join
end

p max_rotation(700005291) 

# 000052917
# 0000529170
# 0005291700
# 0002917005
# 0002170059
# 0002100597
# 0002105970
# 0002105709
# 0002105790


# p max_rotation(3) == 3
# p max_rotation(3500) #== 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845