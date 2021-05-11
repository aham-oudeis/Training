=begin
**Problem**
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:MB:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

-the blocks of letter are given in terms of pairs
-for each word we have to test if the word contains both letters
-from one block. 
-if the word contains two letters from the same block, then return false
-otherwise, return true
-since the letter are given only in uppercase, the issue probably isn't
-about matching only the uppercases, but this point can be clarified more

**Examples**

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true
block_word?('must') == true

**Algorith**
-the fundamental issue is about matching pattern
-if I were to be more fluent with regex, there might be a quicker solution
-let's attempt more of a sequential reasoning
-first make a pair of letters that cannot be co-present
-this array will contain 13 elements 
-and each element contains a pair of letters that cannnot be co-present
-for any given word, create  am arry of all non-overlapping letter 
-combinations and loop through the forbidden combination array 
-and test if any of the element is present in the word combinations array
=end

FORBIDDEN_COMBS_PARTIAL = %w(B G V X R L D F Z C J N H).zip(%w(O T I K E Y Q S M P W A U))

FORBIDDEN_COMBS = FORBIDDEN_COMBS_PARTIAL + FORBIDDEN_COMBS_PARTIAL.map(&:reverse)

def letter_combinations(word)
  letters = word.upcase.chars
  letter_combination_array = []
  letters.each_with_index do |item, idx|
    letter_combination_array += [item].product(letters[idx+1..])
  end
  letter_combination_array
end

def block_word?(word)
  letter_combination_array = letter_combinations(word)
  FORBIDDEN_COMBS.all? do |item|
    letter_combination_array.include?(item) == false
  end
end

p block_word?('BATCH') == true

p block_word?('BUTCH') == false

p block_word?('jest') == true

p block_word?('must') == true

  