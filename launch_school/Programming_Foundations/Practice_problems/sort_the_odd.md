```ruby
=begin
You will be given an array of numbers. You have to sort the odd numbers in ascending order while leaving the even numbers at their original positions.

Examples
[7, 1]  =>  [1, 7]
[5, 8, 6, 3, 4]  =>  [3, 8, 6, 5, 4]
[9, 8, 7, 6, 5, 4, 3, 2, 1, 0]  =>  [1, 8, 3, 6, 5, 4, 7, 2, 9, 0]

Problem
input: unordered array
output: array with only the odd numbers sorted
	Rules
	-keep the even numbers in their place

Examples
[5, 8, 6, 3, 4]  =>  [3, 8, 6, 5, 4], because
1. 8, 6, 4 are in their own place
2. 5, 3 are sorted

Essential:
1. keep the even integers intact by tagging each number with their index
2. move around the odd integers

Algorithm
1. select the odd numbers and assign it to a new variable 'odd'
2. sort the array 'odd'
3. transform the given array as follows:
	1. if the element is odd, shift 'odd' and use the shifted element
	2. if the element is even, append the current element.
=end

def sort_array(arr)
  odd = arr.select {|n| n.odd?}.sort
  arr.each_with_object([]) |n, sorted_arr|
    n.odd? ? sorted_arr << odd.shift : sorted_arr << n
	end
end

def sort_array(arr)
  odd = arr.select {|n| n.odd?}.sort
  arr.map |n|
    n.odd? ? odd.shift : n
	end
end
```

