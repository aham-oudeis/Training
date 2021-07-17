```ruby
# ASCII value

def ascii_value(str)
  return 0 if str.empty?
  str.chars.map {|char| char.ord}.sum
end

def ascii_value(str)
  return 0 if str.empty?
  str.each_char.inject {|sum, char| char.ord}
end

# After Midnight

def time_of_day(num)
  quotient, minutes = num.divmod(60)
  hour = quotient % 24
  
  format("%02d:%02d", hour, minutes)
end

# Letter swap

def swap(str)
  str.split.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end.join(' ')
end

# Clean up the words

def cleanup(str)
  str.chars.each_with_object('') do |char, str|
    if ('a'..'z').include?(char)
      str << char
    else
      str << ' ' unless str[-1] == ' '
    end
  end
end

def cleanup(str)
  str.gsub(/[^a-zA-Z]+/, ' ')
end

# Letter Counter (part 1)

def word_sizes(str)
  str.split.map(&:length).each_with_object({}) do |num, hash|
    hash.key?(num) ? hash[num] += 1 : hash[num] = 1
	end
end

# Letter Counter (part 2)

def word_sizes(str)
  words_lengths = 
    str.split.map do |word|
      word.delete("^a-zA-Z").length
    end
  
  words_lengths.each_with_object({}) do |num, hash|
    hash.key?(num) ? hash[num] += 1 : hash[num] = 1
	end
end

# Alphabetical Numbers

NUMS = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeeen eighteen nineteen)

def alphabetic_number_sort(arr)
  arr.sort_by {|num| NUMS[num]}
  # further exploration
  # NUMS.zip((0..19)).sort.map(&:last)
end

# Daily Double

def crunch(str)
  str.chars.each_with_object('') do |char, str|
    str << char unless char == str[-1]
  end
end

# Bannerizer

def print_in_box(str)
  text_length = str.length
  padding = " "
  
  horizontal_line = "+" + '-' * (text_length + 2) + '+'
  empty_line = "|" + ' ' * (text_length + 2) + '|'
  text = "|" + padding + str + padding + "|"
  
  1.upto(5) do |num|
    if num == 3
      output = text
    elsif [1, 5].include?(num)
      output = horizontal_line
    else
      output = empty_line
    end
    puts output
	end
end




```

