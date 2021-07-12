```ruby
# determine Missing letter
# ##1
# Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.

# You will always get an valid array. And it will be always exactly one letter be missing. The length of the array will always be at least 2.
# The array will always contain letters in only one case.
# =end

# determine_missing_letter(['a','b','c','d','f']) == 'e' 
# determine_missing_letter(['O','Q','R','S']) == 'P'
# determine_missing_letter(["a","b","c","d","f"]) == "e"
# determine_missing_letter(["O","Q","R","S"]) == "P"

=begin
Determine Missing Letter
Problem
Input: a sorted array of letters with one missing letter
Output: a string, i.e. the missing letter

Algorithm:
1. initialize two variables, first_letter and last_letter, to the first and the last element of the given array
2. create a range from the first to the last letter and convert it into an array
3. substract the given array from this newly constructed array
4. and return the first element from the array returned by this substraction
=end

def determine_missing_letter(array)
  first = array.first
  last = array.last
  ((first..last).to_a - array)[0]
end

##2
# # Given two arrays of strings a1 and a2 return a sorted array r in alphabetical order of the strings of a1 which are substrings of strings of a2.

# substrings(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "live", "strong"]
# substrings(["tarp", "mice", "bull"], ["lively", "alive", "harp", "sharp", "armstrong"]) == []
# substrings(["delta", "gamma", "alpha", "beta"], ["alphabetical", "beta-carotene", "gamma rays", "deltoid"]) == ["alpha", "beta", "gamma"]
# substrings(["albe", "negam"], ["alphabetical", "beta-carotene", "gamma rays", "deltoid"]) == []

=begin
substrings
Input: two arrays
Return: one sorted array 
	Rules
	* the returned array must contain the elements from the first array which are the substring of some element in the second array
  * the returned array must be sorted in ascending order

Algorithm
* initialize the variable collection to the return value of invoking the select method on the first array and passing in the block as follows:
* for the block parameter (string), check if any (any?) of the words in the second array results a match when the block parameter (string2) is passed as an argument.
* this selects all the elements which return true
* sorted this collection and return it
=end

def substrings(arr1, arr2)
  collection = 
    arr1.select do |string|
      arr2.any? {|string2| string2.match?(string)}
    end
  collection.sort
end

=begin
Preserve Punctuation
Problem
Input: an array of words with punctuation
Return: a new array with the following transformation applied to it:
	Rules:
	* all the letters are placed in reverse order
  * all the punctuation stay in the same place

Algorithm
* define a helper function 'transform_one(word)' as follows:
	** initialize all_chars variable to the return value of converting the string to characters
	** initialize a variable (only_Letters) to the collection of letters from the word
  **. this can be done by converting the word into characters and selecting only the ones that are included in the array containing all the alphabets
  ** or, by checking if the character returns true when the character is matched with the regex pattern for alphabet (char.match?(/[a-z]/i)).
  ** reverse the array of letters so derived and store it in the same 
  ** initialize an empty string (result_string)
	** iterate through the array containing all the characters of the given word
  ** if the character is from the alphabet array, shift the only_letters and append the return value of shifting to the result_string.
  ** if the character is not from the alphabet array, append the current character to the result_string.
  ** return. the result_strng

* for the main method do as follows
 ** iterate through the given array and transform (by invoking map on) the array by passing each element through the helper function "transform_one(word)". 
 
=end

def transform_one(word)
  all_chars = word.chars
  all_letters = all_chars.select {|char| char.match?(/[a-z]/i)}.reverse
  
  all_chars.each_with_object('') do |char, string|
    if char.match?(/[a-z]/i)
      string << all_letters.shift
    else
      string << char
    end
  end
end



