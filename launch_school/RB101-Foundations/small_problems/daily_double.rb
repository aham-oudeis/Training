def crunch(str)
  char_arr = ''
  str.each_char do |char|
    char_arr << char unless char_arr[-1] == char
  end
  char_arr
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''