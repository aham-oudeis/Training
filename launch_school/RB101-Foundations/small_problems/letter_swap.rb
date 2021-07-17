=begin
-basically, the given string can be split into words
-each word can be mapped by swapping the first and last letter
-how does one do the swapping?
-assign the first and last letter to different variables
-then reassign those letters back to the string 
=end
def swap_one(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(str)
  if str.length < 1
    str
  else
    words_arr = str.split(" ")
    words_arr.map! {|word| swap_one(word)}
    words_arr.join(' ')
  end
end

puts swap('Oh what a wonderful day it is') #== 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'