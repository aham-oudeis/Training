=begin
Given a string that includes alphanumeric characters ('3a4B2d') return the expansion of that string: The numeric values represent the occurrence of each letter preceding that numeric value. There should be no numeric characters in the final string. Empty strings should return an empty string.

The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears.

string_expansion('3D2a5d2f') == 'DDDaadddddff'
string_expansion('3abc') == 'aaabbbccc'       # correct
string_expansion('3abc') != 'aaabc'           # wrong
string_expansion('3abc') != 'abcabcabc'       # wrong

If there are two consecutive numeric characters the first one is ignored.
string_expansion('3d332f2a') == 'dddffaa'

If there are two consecutive alphabetic characters then the first character has no effect on the one after it.
string_expansion('abcde') == 'abcde'

Your code should be able to work for both lower and capital case letters.
string_expansion('') == ''


Problem
input: a string containing numbers and letters
output: only letters 
  Rules
  1. for each number preceding the letter, multiply the letter that many times and append it to the string.
  2. ignore the numbers other than the last number.

    That means, there are no two digits number at work
  3. if there is no number in the original string, return the string.

Examples:

'abc4G' => 'abcGGGG'
'3d332f3a' => 'dddffaaa'

Algorithm
1. initialize a register to 1
2. iterate through the string and check if the letter is a memeber of a digit.
3. if it is, convert the string to an integer and reassign the register to that number.
4. if it is not a number, then append the string multiplied by the register times.
5. return the new string aftert the iteration is over.

=end

def string_expansion(str)
  register = 1
  str.chars.each_with_object('') do |char, str|
    if ('0'..'9').include?(char)
      register = char.to_i
    else
      str << char * register
    end
  end
end

puts string_expansion('3D2a5d2f') == 'DDDaadddddff'
puts string_expansion('3abc') == 'aaabbbccc'       
puts string_expansion('3abc') != 'aaabc'       
puts string_expansion('3abc') != 'abcabcabc'   
puts string_expansion('3d332f2a') == 'dddffaa'
puts string_expansion('abcde') == 'abcde'
puts string_expansion('') == ''
puts string_expansion('3D2a5d2f') =='DDDaadddddff'
puts string_expansion('0d0a0v0t0y') ==''