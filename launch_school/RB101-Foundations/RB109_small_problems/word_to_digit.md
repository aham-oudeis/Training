### Problem

Write a method that takes a sentence string as input, and returns the  same string with any sequence of the words 'zero', 'one', 'two',  'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a  string of digits.

```ruby
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
```



The hardest part of this problem lies in separating the `four` from `four.`

```ruby
def word_to_digit(str)
  str = str.dup
  convert_hash = 
  	%w(zero one two three four five six seven eight nine).zip(('0'..'9')).to_h
  convert_hash.keys.each do |num|
    str.gsub!(/\b#{num}\b/, hash[num])
  end
  str
end

def format_num(str)
  str = word_to_digit(str)
  str.gsub(/(\d ){9}\d/) do |match|
    arr_of_num = match.split.each_slice(3).to_a
    "(#{arr[0]}) #{arr[1]}-#{arr[2..].join}"
  end
end
```

