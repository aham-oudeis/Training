```
# Find the longest substring in alphabetical order.
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

def longest(str)
	chars = str.chars
	previous = ''
	cons_substrings =
    chars.each_with_object(['']) do |char, arr|
      char >= previous ? arr[-1] << char : arr << char
      previous = char
    end
  cons_substrings.max_by(&:length)
end
```