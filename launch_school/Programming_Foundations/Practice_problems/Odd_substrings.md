Non-even substrings

## Problem

Given a string of integers, return the number of odd-numbered substrings that can be formed. 

For example, in the case of `"1341"`, they are `1, 1, 3, 13, 41, 341, 1341`, a total of `7` numbers. 

Input: a string

Output: integer; number of odd substrings.

​	-that means, we will have to extract all the substrings from the string

​	-check if each individual substring is odd

​	-return the count of the odd substrings.

Test Cases:

`solve("1341") = 7`.

1341 => [1, 13, 134, 1341, 3, 34, 341, 4, 41, 1 ]

​		 => 1 + 1 + 0 + 1 + 1 + 0 + 1 + 0 + 1 + 1

​		=> 7

Data Structure and Algorithm

- we will have to extract all the substrings to an array
- convert the string to integers
- check if the integers are odd
- select the odd ones and return the count

Algorithm:

1. Extracting all the substrings
   1. initialize an empty array
   2. start a loop
   3. begin with the first index and slice the string starting from 1 to the last index
      1. start another loop 
      2. initialize the last index to be 0
      3. for each iteration, slice from the first to the last index
      4. on each iteration, append the string to the empty array
   4. select the odd elements from the array
   5. return the number of odd elements

```ruby
def sub_strings(str)  
 	(0..(str.size - 1)).each_with_object([]) do |idx, arr|
    count = idx
  	loop do 
      arr << str[idx..count]
      count += 1
      break if count == str.size
    end
	end
end
    
def solve(str)
  sub_strings = sub_strings(str)
  sub_strings.count {|num| num.to_i.odd?}
end
```

