=begin
Write a method that takes a string as argument, and returns true if all parentheses in the string are properly matching_symmetric_pair, false otherwise. To be properly matching_symmetric_pair, parentheses must occur in matching '(' and ')' pairs.

**Problem**
-input: a string
-output: boolean
-test if the string has matching symmetric_pair
  --the start of the symmetric_pair is "("
  --and the end of the symmetric_pair iis ")"
  --merely having an even number of symmetric_pair wouldn't work
  --equal number of symmetric_pair + the start symmetric_pair is "("

Clarifications
-what if the string does not have parenthesis?
-what if the string is an empty string?

***Examples and test cases***

matching_symmetric_pair?("(((0)))") == true
matching_symmetric_pair?("ansome))((") == false
matchiing_symmetric_pair?("symmetric_pair()()") == true
matching_symmetric_pair?("solution()())") == false

**Data Structures and Algoriths***
-without regex: split the string into an array
-test if the index of '(' is lesser than the idex of ')'
-then teest if the count of '(' is equal to the count of ')'
-if both true, then true; otherwise false
=end

# def matching_symmetric_pair?(str)
#   count = 0
#   symmetric_pair = 0

#   loop do
#     case str[count]
#     when '(' then symmetric_pair += 1
#     when ')' then symmetric_pair -= 1
#     end

#     count += 1
#     break if count >= str.size || symmetric_pair < 0
#   end

#   symmetric_pair ==  0
# end

# p matching_symmetric_pair?('What (is) this?') == true
# p matching_symmetric_pair?('What is) this?') == false
# p matching_symmetric_pair?('What (is this?') == false
# p matching_symmetric_pair?('((What) (is this))?') == true
# p matching_symmetric_pair?('((What)) (is this))?') == false
# p matching_symmetric_pair?('Hey!') == true
# p matching_symmetric_pair?(')Hey!(') == false
# p matching_symmetric_pair?('What ((is))) up(') == false

def matching_pairs?(str, left_pair, right_pair)
  count = 0
  symmetric_pair = 0

  loop do
    case str[count]
    when left_pair then symmetric_pair += 1
    when right_pair then symmetric_pair -= 1
    end

    count += 1
    break if count >= str.size || symmetric_pair < 0
  end

  symmetric_pair ==  0
end

p matching_pairs?('this is a bit weird {', '{', '}')