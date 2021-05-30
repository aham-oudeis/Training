Find_all_pairs

### Problem 

Input: array of integers

Output: count all pairs and return their count

	* empty array or with single element: return 0

Clarifications

-does the array contain distinct values, such as [1, 1, 1, 2, 1, 1]?

-if the array contains different values, count just the number of pairs. 

-if there are two 2s and four 3s, then return 1 + 2 = 3.

### Examples

[1, 1, 2, 2, 2, 2, 3, 3, 3, 3] = 5

### Data Structures and Algorithms

1. make a list of uniq elements
2. start a count at 0
3. start a loop
   1. loop through the list of unq elements
   2. count the number of first element
   3. divide the count by 2 and add it to the count
   4. go to the next element and repeat 3
   5. repeat the process till the last element of the array
   6. break the loop
4. whatever is the value of the count at the end must be the return value

```ruby
def pairs(arr)
  unique_arr = arr.uniq
  count = 0
  unique_arr.each do |item|
    count += arr.count(item) / 2
  end
  count
end
```

