```ruby
=begin
Key Problem:
1. Test if all the characters of the second string are present in the first string.
2. Make sure that the all the repeated occurences are counted.
=end

def scramble(str1, str2)
  uniq_chars = str2.chars.uniq
  
  uniq_chars.all? {|char| str1.count(char) >= str2.count(char)}
end
```

