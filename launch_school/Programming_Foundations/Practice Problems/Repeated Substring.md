Repeated Substring

For a given nonempty string `s` find a minimum substring `t` and the maximum number `k`, such that the entire string `s` is equal to `t` repeated `k` times. The input string consists of lowercase latin letters. Your function should return a tuple (in Python) `(t, k)` or an array (in Ruby and JavaScript) `[t, k]`

#### Problem

Input: string
Output: array with a substring and the number of times it repeats

Requirements:

1. when there is no sub-string repetition, then return [str, 1]
2. Empty string: 

#### Data Structure and Algorithm

1. Initialize the variable Repetition = 1
2. Loop through the string slice by slice
   1. in the first iteration, initialize a variable `str` and assign it to the first character and count its number
   2. if the number of `str` is the size of the string, then change the value of repetition to the (size of the string / size of `str`)
   3. then return  [str, repetition]
   4. if not, go to the nex iteration: take first two character and assign it to `str` and repeat 2 - 4
   5. the iteration breaks off when the size of `str` equal to the size of the main string. 
   6. return `str` and its repetition

```ruby
def f(string)
  size = string.size
  string.each_char.with_index do |_, idx|
    str = string[0..idx]
    length = str.length
    frequency = string.scan(str).size
    if frequency * length == size
      return [str, (size / length)]
    end
  end
end
```





