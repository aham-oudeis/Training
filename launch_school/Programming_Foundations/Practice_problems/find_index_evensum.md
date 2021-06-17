```ruby
=begin
Problem
-find the index for which the sum of all numbers on the left side is equal to the sum of all numbers on the right side

input: array
output: integer
	Rules
	1. if the array is empty, the sum is 0 
	2. if there is no index that satisfies the condition, return -1
	3. else, return the index that satisfies the given condition
	4. ignore the number at the index

Clarification
-if the array sums up to 0, should we return the last index?

Examples:
[1, 2, 3, 4, 3, 2, 1] => 3 bc left side [1, 2, 3].sum = [3, 2, 1].sum
[1, 2, 7, 8, 14] => -1, bc no index satisfies the given condition

Data Structure and Algorithm
-working with arrays

1. Initialize a new array containing numbers from 0 to (array.size - 1)
2. iterate through this new arrray and for each element do as follows:
	1. slice the array on the left side of that index
	2. slice the array on the right side of that index
	3. check if the array sums are the same.
	4. return the num if it satisfies the condition
3. if the iteration completes, return -1.
=end

def find_even_index(arr)
  (0...arr.size).each do |num|
    return num if arr[0...num].sum == arr[(num + 1)..-1].sum
  end
  -1
end
```

