```ruby
=begin
Problem
-input: two strings
-output: true or false
	Rules:
	1. if both strings have some common substring
	2. cases of the strings do nont matter.
	3. the common substring must be more than a letter long
	4. empty substrings do not have anything in common with other strings

Data Structure: Arrays

Key problem:
-create substrings of the given strings

Algorithm:
1. determine the smallest string
2. create an array containing all the substrings of the smallest string
		1. loop through the array containing all the characters.
		2. slice the string starting from 0 to the lengh - 1.
		3. then slice the string starting from 1 to the length - 1.
		4. iterate till the end of the string
3. iterate through the array containing all the substrings of length more than 2 and check if the string is a member of the other string. 
4. return true if there is any; otherwise, false.

=end

## well, well; it could be solved by just checking for the shorest substring.
def substrings(str)
  chars = str.chars
  (2..(str.size)).each_with_object([]) do |num, arr|
    substrings_per_count = chars.each_cons(num).map(&:join)
    arr.concat(substrings_per_count)
  end
end

def substring_test(str1, str2)
	substrings = substrings(str1).map(&:downcase)
  str2.downcase!
  substrings.any? {|str| str2.include?(str)}
end

# if i were to want to return the longest common substring

def longest_common_substring(str1, str2)
  substrings = substrings(str1)
  substrings.select {|str| str2.downcase.include?(str.downcase)}.max_by(&:length)
end
```

