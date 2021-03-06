Given integer array nums, return the third maximum number in this array. If the third maximum does not exist, return the maximum number.

You are not allowed to sort the array

```ruby
p third_max([3,2,1]) == 1
p third_max([1,2]) == 2
p third_max([2,2,3,1]) == 1
p third_max([1, 3, 4, 2, 2, 5, 6]) == 4
```



Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

```ruby
def sub_arrays(arr)
	1.upto(arr.size).each_with_object([]) do |num, new_arr|
    new_arr.concat(arr.each_cons(num))
  end 
end

def minSubLength(arr, num)
  sub_arrays = sub_arrays(arr)
  sub_arrays.select {|sub_arr| sub_arr.sum >= num}.min_by {|sub_arr| sub_arr.size}
end

p minSubLength([2,3,1,2,4,3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0
```



