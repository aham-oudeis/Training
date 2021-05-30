Count Letters in string

## Problem

-input: string

-output: hash

Requirements:

1. count the lowercase letters in a given string
2. the lowercase letter must be a symbol key and its value must be its count in the given string.

Clarifications:

* are there going to be uppercase letters?
* what about empty spaces?
* what about non-alphabetic characters?
* if there are uppercase letters, do they count as the same letter or not?

Data Structure and Algorithm

1. Convert the string into an array of characters.
2. create an empty hash
3. loop through the characters
   1. for each character, count the number of that character in the given string
   2. store that character count as the hash value for the character-converted-to-symbol
4. return the hash where all the values are stored

```ruby
def lettercount(str)
  letters = str.chars
  hash = {}
  letters.each do |item|
    hash[item.to_sym] = str.count(item)
  end
 	hash.select {|k, v| ('a'..'z').include?(k.to_s)}
end
```

