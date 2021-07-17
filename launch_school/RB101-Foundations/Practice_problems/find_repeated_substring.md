```ruby
=begin
Problem
1. check if some substring proper of the string can generate the whole string
2. substring proper means that the whole string cannot be counted as a substring

Data Structure and Algorithm
1. initialize an empty substring.
2. loop through the string up to half its length
3. reassign the substring to the first character and see if the character repeated length times is equal to the string; if equal, then return true.
4. reassign the substring to the first two characters and see if the character repeated (length / 2) times is equal to the string; if equal, then return true.
5.if the loop ends, then return false
=end

def find_repeated_substring(str)
  length = str.length
  count = 1
  loop do
    substring = str[0, count]
    test = substring * (length / count) == str
    return test if test
    count += 1
    break if count == (length / 2) + 1
  end
	false
end
```

