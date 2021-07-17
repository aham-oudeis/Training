# def word_to_digit(str)
#   str = str.dup
#   hash =
#   	%w(zero one two three four five six seven eight nine).zip(('*0'..'*9')).to_h
#   hash.keys.each do |num|
#     str.gsub!(/\b#{num}\b/i, hash[num.downcase])
#   end
#   str
# end

def format_phone(str)
  hash =
  	%w(zero one two three four five six seven eight nine).zip(('0'..'9')).to_h

  phone_pattern =
    /((zero|one|two|three|four|five|six|seven|eight|nine)\s){9}((zero|one|two|three|four|five|six|seven|eight|nine)(\s|\.|;|\?))/i

  str = str.gsub(/[\s]+/,' ')
  str.gsub(phone_pattern) do |match|
    arr = match.split
               .map {|word| hash[word.downcase]}
               .each_slice(3)
               .map(&:join)
    "(#{arr[0]}) #{arr[1]}-#{arr[2..].join} "
  end
end

STRING_DIGITS = {'zero' => '0',
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
  }

# NOTE: we are destructively mutating the same string. hence the use of gsub! and not gsub.

def word_to_digit(string)
  STRING_DIGITS.keys.each do |key|
  string.gsub!(/\b#{key}\b/i, STRING_DIGITS[key])  # question 1: dealing with uppercased and capitlaized word numbers
  end
  string.gsub!(/(\d)\s/, '\1') # question 2 : eliminating the space between each number.

  string.gsub!(/\b(\d{3})(\d{3})(\d{4})\b/, '(\1) \2-\3') # question 3: formatting our digits to our liking.
end

p word_to_digit('9 1 1 Please call me at the freight station at 9 1 1 five Five five seven seven SIX one two three four 9 1 1. Thanks. Zero four. 1 2 3 4 5 6 7 8 9 0.') #== '9 1 1 Please call me at the freight station at 9 1 1 (555) 776-1234 9 1 1. Thanks. 04. 1 2 3 4 5 6 7 8 9 0.'
