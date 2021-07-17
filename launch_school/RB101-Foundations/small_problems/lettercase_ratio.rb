=begin
Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

**Problem**
-input = string
-output = hash
  keys: lowercase, uppercase, neither
  values: % of lowercase letters, % of uppercase letters, and % of the remainder

clarifications:
-is the input always a string?
-can the input be an empty string?

**Data Structure and Algorithm**
-split the string into characters (stored in array)
-loop through the string using the method count and test each element
=end

def letter_percentages(str)
  total_length = str.size
  lowercase = Rational((str.count("\\a-z") * 100), total_length).to_f.round(2)
  uppercase = Rational((str.count("\\A-Z") * 100), total_length).to_f.round(2)
  neither = 100 - lowercase - uppercase

  { lowercase: lowercase, uppercase: uppercase, neither: neither}
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }