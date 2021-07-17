**Problem**

How to create a new array with one of its element moved around.

```ruby
def rotate(arr)
  arr[1..] << arr[0]
  # arr[1..].append(arr[0])
  # arr[1..] + arr[0, 1]
end

# if we are rotating a string:

def rotate(str)
  arr = str.chars
  arr[1..].append(arr[0]).join
end

def rotation(str, num)
  num.times {str = rotate(str)}
  str
end

def rotate(arr)
  arr[1..] << arr[0]
  # arr[1..].append(arr[0])
  # arr[1..] + arr[0, 1]
end

def rotate_rightmost_digits(number, digit)
  num_arr = number.to_s.chars
  length = num_arr.length
 	keep_idx = length - digit
  unchanged = num_arr[...keep_idx]
  changed = rotate(num_arr[keep_idx..])
  (unchanged + changed).join.to_i
end

def rotate_rightmost_digits(number, digit)
  num_arr = number.to_s.chars
  num_arr[-digit..-1] = rotate(num_arr[-digit..-1])
  num_arr.join.to_i
end

def max_rotation(num)
  length = num.to_s.length
  length.downto(1) {|i| num = rotate_rightmost_digits(num, i)}
  num
end

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917
```

