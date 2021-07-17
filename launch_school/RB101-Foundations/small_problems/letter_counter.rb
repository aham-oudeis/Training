=begin
-the problem requires that the string is broken into words array
-each word has to be counted for length
-each length is stored as key, and its count is stored as value
=end

def word_sizes(str)
  words_length_arr = str.split.map {|word| word.length}
  words_length_arr.each_with_object({}) {|num, hash| hash[num] = words_length_arr.count(num)}
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}