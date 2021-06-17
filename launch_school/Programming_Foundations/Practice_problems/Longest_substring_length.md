Longest_substring_length

```ruby
def palindrome?(str)
  str == str.reverse
end

def substrings(str)
  (1..str.size).each_with_object([]) do |num, arr|
    num_size_substrings = str.chars.each_cons(num).map(&:join)
    arr.concat(num_size_substrings)
  end
end

def find_longest_substring(str)
  substrings(str).select {|string| palindrome?(string)}.max_by(&:length)
end
```

