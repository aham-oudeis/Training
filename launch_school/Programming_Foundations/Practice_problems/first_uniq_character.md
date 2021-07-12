```ruby
=begin
Write a function named first_non_repeating_letter that takes a string input, and returns the first character that is not repeated anywhere in the string.

For example, if given the input 'stress', the function should return 't', since the letter t only occurs once in the string, and occurs first in the string.

As an added challenge, upper- and lowercase letters are considered the same character, but the function should return the correct case for the initial letter. For example, the input 'sTreSS' should return 'T'.

If a string contains all repeating characters, it should return an empty string ("") or None -- see sample tests.

Problem:
Input: string
Output: the first case-sensitive letter that is non-repeating
Rules:
1. if no letters are non-repeating, then return an empty string
2. if more than one letters are non-repeating, then return the one that is  earlier in the string
3. a letter is said to be repeating if the case-insentive count of the letter is more than 1.
4. if a downcase letter is earlier, then return that.

Examples:

first_non_repeating_letter('aa') == ''
first_non_repeating_letter('a')=='a'
first_non_repeating_letter('stress')=='t'
first_non_repeating_letter('sTress') == 'T'
first_non_repeating_letter('moonmen')=='e'

ALGORITHM:

1. iterate through the  string and check the following condition
  test: does the count of the char in its downcase version in the downcase version of the string is 1
2. if the test returns true, then return that character
3. if not keep iterating
4. if the iteration is complete, then return an empty string.

=end

def first_non_repeating_letter(str)
  str_downcase = str.downcase
  str.each_char do |char|
    if str_downcase.count(char.downcase) == 1
      return char
    end
  end
  ''
end

p first_non_repeating_letter('aa') == ''
p first_non_repeating_letter('a')=='a'
p first_non_repeating_letter('stress')=='t'
p first_non_repeating_letter('sTress') == 'T'
p first_non_repeating_letter('moonmen')=='e'

```

