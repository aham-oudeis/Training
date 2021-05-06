
def word_sizes(str)
  clean_str = str.gsub(/[^[\s]a-z]/i, "")
  words_length_arr = clean_str.split.map {|word| word.length}
  words_length_arr.each_with_object({}) {|num, hash| hash[num] = words_length_arr.count(num)}
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}
