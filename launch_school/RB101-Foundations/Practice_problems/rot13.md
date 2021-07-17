```ruby
=begin

ROT13 is a simple letter substitution cipher that replaces a letter with the letter 13 letters after it in the alphabet. ROT13 is an example of the Caesar cipher.

Create a function that takes a string and returns the string ciphered with Rot13. If there are numbers or special characters included in the string, they should be returned as they are. Only letters from the latin/english alphabet should be shifted, like in the original Rot13 "implementation".

rot13("test") == "grfg"

rot13("Test") == "Grfg" 

Problem
Input: string
Output: string
Rules:
1. for each letter, transform the letter into its corresponding encoding.
2. for the encoding, shift the letter by 13 steps
3. cases have to be preserved
4. non-alphabetic characters have to remain as they are

Components
1. have a system for converting the letter to another letter
2. Given that the encoding works with the relative position of the letter, create a hash to convert the letter to its encoded letter

'g': figure out its position, that is 7, add 13 to it, and convert it back to the letter. 

3. How to preserve the case: 

Algorithm
1. initialize a hash to convert from letter to number 
2. invert that hash to convert from number to letter
3. split the string into characters
4. transform each character as follows:
* if the character is a downcase, then do as follows:
** convert the character to its number
** add 13 to it
** take the modulo of the result with 26
** convert that number to a letter

* if the character is a upcase, then do the same but add an upcase to the result. 
* if the character is anything else, keep it. 
5. join the characters and return the string
=end

LETTERS_TO_NUM = ('a'..'z').zip((1..26)).to_h
NUM_TO_LETTERS = LETTERS_TO_NUM.invert


def letter_replacement(char)
    num  = LETTERS_TO_NUM[char]
    
    encoding_num = (num + 13) % 26
    
    NUM_TO_LETTERS[encoding_num]
end


def encode(char)
    if char.match?(/[a-z]/)
        letter_replacement(char)   
    elsif char.match?(/[A-Z]/)
        letter_replacement(char.downcase).upcase
    else
        char
    end
end

def rot13(str)
    characters  = str.chars
    characters.map {|char| encode(char)}.join
end

p rot13("test") == "grfg"

p rot13("Test") == "Grfg" 

```

