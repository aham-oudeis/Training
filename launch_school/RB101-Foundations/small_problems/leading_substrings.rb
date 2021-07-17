def leading_substrings(str)
  str.size <= 1 ? [str] : (leading_substrings(str[..-2]) + [str])
end

def substrings(str)
  str.size <= 1 ? [str] : (leading_substrings(str) + substrings(str[1..]))
end

# p leading_substrings('abc') == ['a', 'ab', 'abc']
# p leading_substrings('') #== ['a']
# p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]