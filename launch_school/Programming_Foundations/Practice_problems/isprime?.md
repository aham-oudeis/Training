Is_prime

## Problem

Input: number

output: true or false based on whether or not it is a boolean.

```ruby
# the lowest divisor is 2. 
# if the number is not divisible by anything below its half, then it's a prime
# if the number is divisible by even number, then it has to be divisible by 2
# we only have to check if the number is divisible by odd numbers

def is_prime(num)
  half = num.abs / 2
  return true if [2, 3, 5, 7].include?(num)
  return false if [0, 1].include?(num)
  (2..half).select {|n| n == 2 || n.odd?}.each do |i|
      return false if num.abs % i == 0
  end
  true
end
```



