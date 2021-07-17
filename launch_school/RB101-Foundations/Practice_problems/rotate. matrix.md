```ruby
=begin
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

rotate90!(matrix1)
rotate90!(matrix2)

p matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]

Problem
Input: multi-dimensional array
Output: mutated array by rotating it.
  Rules:
  * take all the columns of the matrix and reverse it and make it a row

Example:
matrix2 = 
[
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

* 0 index element from index 0 aray
* 0 index element from index 1
* 1 index element from index 0 array
* 1 index element from index 1
* 2 index element from index 0 array
* 2 index element from index 1
* 3 index element from index 0 array
* 3 index element from index 1

Algorithm
matrix1 = 
[
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
* initialize an empty array to create a rotated matrix
* iterate through the index from 0 to the length of the first nested array (0..3)
* initiaize a row variable to contain the elements from the inner iteration.
* iterate through the index from 0 to the length of the matrix (0..3)
  ** on each inner iteration, append the element using matrix[inner_index][outer_index] to a row varible initialized to an empty array
  1. row << matrix[0][0] 
  2. row << matrix[1][0]
  3. row << matrix[2][0] 
  [1, 4, 3]
  ** append the row after reversing it to the rotated matrix
  [3, 4, 1]
* once the iteration is complete, replace the given matrix with the rotated matrix
=end

def rotate90!(matrix)
  rotated_matrix = []
  
  (0...matrix.first.size).each do |outer_index|
    row = []
    (0...matrix.size).each do |inner_index|
      row << matrix[inner_index][outer_index]
    end
    rotated_matrix << row.reverse
  end
  matrix.replace(rotated_matrix)
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

rotate90!(matrix1)
rotate90!(matrix2)

p matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]

# 27:10

```

