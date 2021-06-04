Write a function 

```ruby
triple_double(num1, num2)
```

which takes numbers `num1` and `num2` and returns `1` if there is a straight triple of a number at any place in `num1` and also a straight double of the **same** number in `num2`.

If this isn't the case, return `0`

### Problem

Input: Two numbers

Output: 0 o 1 

​		Depending on the following condition:

1. if there is a consequetive three digit in the first number and there is a consequetive 

   two of the same digit in the second number

Clarifications:

* Are we always going to have numbers as input?

* Numbers are integers or can they be floats?

* what about four consequetive digits? would that count as having three or 

  would that ont count?

* what about three consequetive digits instead of two? 

  * 1233345, 1233381 => 1 or 0?
  * I'll assume that it means 'at least 2' and not just 'exactly 2'

Examples:

num1 = 1233345 => 3 of `3`

Num 2 = 1233381 => 3 of `3` 

return 1

### Data Structure and Algorithm

1. Convert the first and the second number into strings and then characters

Num1 = [1, 2, 3, 3, 3, 4, 5]

num2 = [1, 2, 3, 3, 8, 1]

2. loop through the first num array and find if some number repeats three times

   1. create a function to see if there is a repeating element in the array
      1. start a count at 0; reset the count when the element changes
      2. loop through the array of number and keep track of the index
      3. check if the current element is equal to the next element
      4. if it is equal, then increase the count by 1.
      5. then go to the next element and repeat 3 - 4.
      6. at the end of the iteration, if the count is 3 or > 3, then return the element.

3. suppose you find the repeating element, you can test if the element count in the 

   second num arrray is  2 or > 2

4. if the second array satisfies the condition, return 1; otherwise, return 0.

```ruby
def three_conseq(num)
  num_arr = num.to_s.chars
  repeat_digits = []
  num_arr.each_with_index do |d, i|
    if d == num_arr[i + 1] && d == num_arr[i + 2]
      repeat_digits << d
    end
  end
  repeat_digits
end

def two_conseq(num)
  num_arr = num.to_s.chars
  repeat_digits = []
  num_arr.each_with_index do |d, i|
    if d == num_arr[i + 1]
      repeat_digits << d
    end
  end
  repeat_digits
end

def triple_double(num1, num2)
  num1_triples = three_conseq(num1)
  num2_doubles = two_conseq(num2)
  
  (num1_triples & num2_doubles).empty? ? 0 : 1
end
```















```ruby
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and  num2 has straight double 99s

triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2

triple_double(12345, 12345) == 0

triple_double(666789, 12345667) == 1

```

