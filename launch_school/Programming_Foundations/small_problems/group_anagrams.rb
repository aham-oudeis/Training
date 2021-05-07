=begin
**Problem**
-input is an arry of words of varying sizes
-output has to be arrays of words that are anagrams

**Essentials
-anagram is a word with the same letters and its occurences
-that means a sorted word equals all of its anagrams
-if x is an anagram of y, then sorted x is equal to sorted y
-then how does one classify different anagrams?

**Data Structure and Algorithms
-initialize a new hash
-loop through the given array
-turn each word into a sorted array of characters
-use that sorted array of characters as a hash_key
-in that hash key, put all woords when sorted is equal to the key
-at the end, we should have a hash with all the words grouped by anagrams
=end

def group_anagrams(arr)
  anagrams_groups =  (arr.each_with_object({}) do |item, anagrams|
                          key = item.chars.sort
                          if anagrams[key].nil?
                            anagrams[key] = [item]
                          else
                            anagrams[key] << item
                          end
                        end)

  anagrams_groups.each {|k, v| p v}
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live', 'fowl','veil', 'wolf', 'diet', 'vile', 'edit', 'tide', 'flow', 'neon']

group_anagrams(words)