**Problem**

input: integer

Output: integer with the following specification

	* if the number is odd length or the number is not a double number, return the number multiplied by 2.
	* if the number is a double number, return the same number

**Essentials**

1. First, we need method to test if the number if a double number
2. Second, we need a if/else statements to control which one we check

**Data structure and algorithms**

1. Check if the number has odd number of digits.
   1. convert the number to a string
   2. check the length of the string
2. If it does, return number * 2
3. Check if the number is a double number
   1. slice the string into half
   2. check if the two slices are identical

4. if identical, it's a double number; returrn the same number.

5. Else, it's not. Return the number * 2. 

```ruby
def double_number?(str, length)
  return false if length.odd?
  left, right = str.chars.each_slice(length/2).to_a
  left == right
end

def twice(num)
  str = num.to_s
  length = str.length

  double_number?(str, length) ? num : (num * 2)
end

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10
```

