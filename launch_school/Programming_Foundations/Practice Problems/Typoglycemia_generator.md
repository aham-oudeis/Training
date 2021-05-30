**Background**
 There is a message that is circulating via public media that claims a  reader can easily read a message where the inner letters of each words  is scrambled, as long as the first and last letters remain the same and  the word contains all the letters.

Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a  similar pattern, but instead of scrambled or reversed, ours will be  sorted alphabetically

**Requirement**
 return a string where:

1. the first and last characters remain in original place for each word
2. characters between the first and last characters must be sorted alphabetically
3. punctuation should remain at the same place as it started, for example: shan't -> sahn't

**Assumptions**

1. words are seperated by single spaces
2. only spaces separate words, special characters do not,  for example: tik-tak -> tai-ktk
3. special characters do not take the position of the non special characters, for example: -dcba  ->  -dbca
4. for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.) 
5. ignore capitalisation



```ruby
def scramble_chars(word)
  chars = word.chars
  letters = chars.select {|i| letter?(i)}
  scrambled_letters = 
  	letters[0] + letters[1...-1].sort + letters[-1]
  
  chars.map {|char| letter(char) ? scrambled_letters.shift : char}
  		 .join
end

def letter?(char)
  ('a'..'z').include?(char)
end
    
def scramble_words(sentence)
	words_array = sentence.split
  scrambled_chars = 
  words_array.map { |word| scramble_one(word) }.join(' ')
end
	
```

