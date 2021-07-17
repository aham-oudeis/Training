=begin
Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.
=end
INT_WORDS = %W(zero one two three four five six seven eight nine)
INTEGERS = ('0'..'9')
WORDS_TO_INTEGERS = INT_WORDS.zip(INTEGERS).to_h

# def word_to_digit(str)

#   str.split.map do |item| 
#     if INT_WORDS.include?(item)
#       "#{WORDS_TO_INTEGERS[item]}"
#     elsif INT_WORDS.include?(item.delete('.'))
#       "#{WORDS_TO_INTEGERS[item.delete('.')]}."
#     else
#       item
#     end
#   end.join(' ')

# end


def word_to_digit(str)
  altered_str = str.dup
  
  WORDS_TO_INTEGERS.each do |word, integer|
    altered_str.gsub!(word, integer)
  end

  altered_str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'