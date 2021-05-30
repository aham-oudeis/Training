Alphabet_symmetry

### Problem

Input: array of words

Output: array of numbers such that:

	* each number counts of number of characters in the word that occupy the same index as in the alphabet
	* For each letter check if it's index is the same as its alphabet's index

Some important parts:

1. we have to test for the index of the character
2. test if that index matches with it's alphabet's index

Clarfications

-could we have empty arrays?

-could we have arrays with nil as its element?

## Data Structure and Algorithm

1. initialize a hash by mapping alphabets with their respective position in the alphabet
2. Loop through the given array and for each element do the following test:
   1. separate the word element into characters
   2. For each character, check if it's (index + 1) == Hash[character]
   3. select all the elements that return true
   4. count the number of true
   5. return that count for each iteration
3. from each iteration, take the number and populate an array

```ruby
ALPHABET_INDEX = ('a'..'z').zip(1..26).to_h
def solve(arr)
  arr.map do |word|
    word.chars.count.with_index dp |char, idx| 	
      ALPHABET_INDEX[char] == idx + 1
    emd
  end
end
```

