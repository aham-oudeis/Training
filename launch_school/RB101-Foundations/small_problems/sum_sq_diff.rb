=begin
Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

**Problem**
-input: an integer
-output: an intger with following specifications
  --difference betweeen square of sum of the first n positive integers
    and the sum of the squares of the first n positive integers

Clarifications:
-should o be considered? no worries with that, returns 0
-how big of a number should we expect as an input?
-should we accomodate the possibility of negative integer as input?

Examples and test cases:
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150

Essentials:
-generate numbers up to n starting from 1
-take the sum of the array and square it
-create another array by mapping squares of the items of the original array
-take the sum of the elements
-substract one from the other

Data Structures and Algorithm:
-generate numbers up to n starting from 1
-take the sum of the array and square it
-create another array by mapping squares of the items of the original array
-take the sum of the elements
-substract one from the other
=end

def sum_square_difference(num)
  square_of_sum = ((1..num).reduce(:+)) ** 2
  sum_of_squares = ((1..num).map {|i| i ** 2}).reduce(:+)

  square_of_sum - sum_of_squares
end

p sum_square_difference(3) == 22
# -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
