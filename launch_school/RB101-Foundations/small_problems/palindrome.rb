
def cleanup(str)
  # delete all non-alphabetic characters
  # str.gsub(/[^a-z]/i, '')

  # or, replace all non-alphanumeric character with space
  # str.gsub(/[^a-z]/i, ' ')
  
  # to remove non-alphanumeric character
  str.gsub(/[^a-z0-9]/i, '')
end

def palindrome?(str)
  #case insensitive palindrome test
  # str.downcase == str.reverse.downcase && str.size >= 2
  
  # a case sensitive would be:
  str == str.reverse && str.size >= 2
end

def leading_substrings(str)
  str.size <= 1 ? [str] : (leading_substrings(str[..-2]) + [str])
end

def substrings(str)
  str.size <= 1 ? [str] : (leading_substrings(str) + substrings(str[1..]))
end

def palindromes(str)
  substrings(cleanup(str)).select {|item| palindrome?(item)}
end

p palindromes('abcd99') #== []
p palindromes('madam') #== ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') #== [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]