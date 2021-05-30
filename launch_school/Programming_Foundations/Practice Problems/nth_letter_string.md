nth_letter_of_each_word

### Problem

input: array
Output: string

	* the string is a result of concatanating nth letter of each word
	* first letter of the first element, second letter of the second element
	* in terms of index, it will be 0 -> 0, 1 -> 1, and so on

clarifications:

* what if the 4th element has only 2 letters?
* What about an empty array?

Test cases:

```ruby
["yoda", "best", "has"]  -->  "yes"
'y' from 'yoda' [0]
'e' from 'best'	[1]
's' from 'hash' [2]
```

### Data Structure and Algorithm

1. initialize an empty string
2. loop through the given array and keep track of the index
   1. for index 0, append `element[0][0]`
   2. do 1 for each element in the array
3. output the string

```ruby
def nth_char(arr)
  count = 0
  arr.each_with_object('') do |word, str|
    str << word[count]
    count += 1
  end
end

def nth_char(arr)
  arr.each_with_object('').with_index do |(word, str), idx|
    str << word[idx]
  end
end

def nth_char(arr)
  arr.map.with_index { |word, idx| word[idx] }.join
end
```

