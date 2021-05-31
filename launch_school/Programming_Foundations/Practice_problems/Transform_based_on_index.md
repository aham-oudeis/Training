Transform_based_on_index

```ruby
p accum("abcd") == "A-Bb-Ccc-Dddd"
p accum("RqaEzty") == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
p accum("RqaEzty") == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
```

Algorithm

1. break the string into characters
2. for eah character in the array, transform the character as follows:
   1. for the character `c` and index `i`, capitalize `c` and add lowercase `c` i times to the character
   2. return the arrray
3. join the return array with '-'

```ruby
def accum(str)
  chars = str.chars
  chars.map.with_index do |char, index|
    char.upcase + (char.downcase * index)
  end.join('-')
end
  
```

