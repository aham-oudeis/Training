```ruby
def rotate_array(arr)
  arr[1..-1].push(arr[0])
  # arr[1..-1] + [arr[0]]
end

# further exploration

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_num(int)
  rotate_string(int.to_s).to_i
end

# Rotation (Part 2)

def rotate_rightmost_digits(int, digits)
  unmodified_slice = int.to_s[0...-digits]
  working_slice = int.to_s[-digits..-1]
  
  rotated = unmodified_slice + rotate_string(working_slice)
	rotated.to_i  
end

def rotate_rightmost_digits(int, digits)
  all_digits = int.to_s.chars
  all_digits[-digits..-1] = rotate_array(all_digits[-digits..-1])
  all_digits.join.to_i
end

# Rotation (part 3)

def max_rotation(int)
  num_str = int.to_s
  (num_str.length).downto(1) do |digits|
    int = rotate_rightmost_digits(int, digits)
  end
  int
end

def rotate_right(arr, digits)
  arr[-digits..-1] = rotate_array(arr[-digits..-1])
  arr
end

def max_rotation(int)
  all_digits = int.to_s.chars
  
  (all_digits.length).downto(2) do |rot_digits|
    all_digits = rotate_right(all_digits, rot_digits)
  end
  all_digits.join.to_i
end

# 1000 lights

def left_on(num)
  lights = [false] * num
  
  1.upto(num) do |n|
    lights.map!.with_index do |state, idx|
      !state if idx % n == 0
    end
  end
  (1..num).select {|index| lights[idx]}
end

# Diamonds

def diamonds(int)
  0.upto(int/2) {|n| puts ("*" * (2*n + 1)).center(int)}
  (int/2 - 1).downto(0) {|n| puts ("*" * (2*n + 1)).center(int)}
end

# Word to Digit
CONVERSION = %w(zero one two three four five six seven eight nine).zip(('0'..'9')).to_h
    
def word_to_digit(str)
  CONVERSION.keys.each do |word|
    str = str.gsub(/\b#{word}\b/, conversion[word])
  end
  str
end

# Fibonacci Recursion

def fibonacci(num)
  num <= 2 ? 1 : fibonacci(num - 2) + fibonacci(num - 1)
end

# Transpose (3 * 3)

def transpose(arr)
  (0...arr.size).each_with_object([]) |index1, collection|
    row = []
    (0...arr.size).each do |index2|
      row << arr[index2][index1]
    end
    collection << row
	end
end

def transpose!(arr)
  (0...arr.size).each do |index1|
    (index1...arr.size).each do |index2|
      arr[index1][index2], arr[index2][index1] = arr[index2][index1], arr[index1][index2] 
    end
	end
  nil
end


matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# debug

def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])
```