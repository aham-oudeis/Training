```ruby
# 8-shaped stars

=begin
1. line one has three stars each separated by three spaces
2. line two has three stars each separated by 1 space
3. line three has three stars each separated by 0 space
4. line four has 9 stars separated by 0 space
5. starting line 5 is the flipped imaage of 1 to 3.

total lines below the middle line = num / 2

on the first line below the middle line, there are three stars separated by 0 spaces
then there are three stars separated by 1 space
then there are thrree stars separated by 2 spaces
then there are thrree stars separated by 3 spaces

Four lines: spaces = 4 - line number

For a given odd number, we can divide the star into three parts
	1. first half
	2. middle part
	3. second half
Where first half is the mirror image of the second half.

For the first half, if the given number is n, then the first half will have n / 2 lines.
	1. for each line, there will be three stars separated by (n/2 - line) spaces
the middle part will be on the n + 1 / 2 line
the second half can be developed from the first half. How?
  How to get [4, 3, 2, 1] from [6, 7, 8, 9] when the given integer is 9? 
    4 = 9 + 1 - 6
    3 = 9 + 1 - 7
	This works for 7 as well: [3, 2, 1] --> [5, 6, 7]
	3 = 7 + 1 - 5
	2 = 7 + 1 - 6
	1 = 7 + 1 -  7
  Hence, we can do as follows:
  when the line number is greater than the middle number, then ressign the line number
	
=end

def star(n)
  mark = '*'
  middle = (n + 1) / 2
  half_top = middle - 1
  
  (1..n).each do |line|
    line = n + 1 - line if line > middle
    spaces = " " * (half_top - line) unless line == middle
    pattern = 
    	line < middle ? ([mark] * 3).join(spaces): mark * n
 		x
    puts pattern.center(n)
  end
  nil
end


# Transpose 3 * 3 Matrix
[[1, 2, 3]			 [[1, 4, 7]	
 [4, 5, 6]		--> [2, 5, 8]
 [7, 8, 9]]				[3, 6, 9]]

def transpose(matrix)
  (0...matrix[0].size).each_with_object([]) do |idx1, new_matrix|
    row = []
    (0...matrix.size).each do |idx2|
      row << matrix[idx2][idx1]
    end
    new_matrix << row
  end
end

# the following works too but does not generalize to all matrices
def transpose(matrix)
  (0...matrix[0].size).each_with_object([[],[],[]]) do |idx1, new_matrix|
    (0...matrix.size).each do |idx2|
      new_matrix[idx1] << matrix[idx2][idx1]
    end
  end
end

def switch!(matrix, idx1, idx2)
  matrix[idx1][idx2], matrix[idx2][idx1] = 
   matrix[idx2][idx1], matrix[idx1][idx2]
end

def transpose!(matrix)
  (0...matrix.size).each do |idx1|
    (idx1+1...matrix.size).each do |idx2|
      switch!(matrix, idx1, idx2)
    end
  end
  nil
end

# Rotating Matrices

def rotate_ninety(matrix)
  (0...matrix[0].size).each_with_object([]) do |idx1, new_matrix|
    row = []
    (0...matrix.size).each do |idx2|
      row << matrix[idx2][idx1]
    end
    new_matrix << row.reverse # rotate 90
  end
end

# Further exploration

def rotate(matrix, int)
  return 'invalid rotation' if int % 90 != 0
  num_of_rotation = int / 90
  num_of_rotation.times {matrix = rotate_ninety(matrix)}
  matrix
end

# Merge Sorted Lists

def merge(list1, list2)
  index = 0 # keeping track of the position in list2
 
  merged_list = 
    list1.each_with_object([]) do |item, collection|
      # short-circuiting to avoid nil comparision
      while index < list2.size && item > list2[index]
        collection << list2[index]
        index += 1
      end
      collection << item
    end
 
  merged_list += list2[index..-1])
end

merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 1], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]

# Merge Sort

def merge_sort(arr)
  return arr if arr.size <= 1
  half_index = arr.size / 2
  left_half = arr[0...half_index]
  right_half = arr[half_index...arr.size]
  
  sorted_left_half = merge_sort(left_half)
  sorted_right_half = merge_sort(right_half)
  
  merge(sorted_left_half, sorted_right_half)
end
```

