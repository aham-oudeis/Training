```ruby
# Combine Two lists

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

def interleave(arr1, arr2)
  arr1.each_with_object([]).with_index do |(el, arr), idx|
    arr << el
    arr << arr2[idx]
  end
end

# Lettercase Counter

def letter_case_count(str)
  length = str.length
  counts = {}
  counts[:lowercase] = str.scan(/[a-z]/).size
  counts[:uppercase] = str.scan(/[A-Z]/).size
  counts[:neither] = length - counts[:lowercase] - counts[:uppercase]
  counts
end

# Capitalize Words
def word_cap(str)
  str.split.map(&:capitalize).join(' ')
end

UPCASE = ('A'..'Z').to_a
DOWNCASE = ('a'..'z').to_a

UP_TO_DOWN = UPCASE.zip(DOWNCASE).to_h
DOWN_TO_UP = DOWNCASE.zip(UPCASE).to_h

def cap(word)
  chars = word.chars
  chars[0] = DOWN_TO_UP[chars[0]] if DOWNCASE.include?(chars[0])
  chars.join
end

def word_cap(str)
  str.split.map {|word| cap(word)}.join(' ')
end

# Swap Case

def swapcase(str)
  swap_chars = 
    str.chars.map do |char|
      if UPCASE.include?(char)
        UP_TO_DOWN[char]
      elsif DOWNCASE.include?(char)
        DOWN_TO_UP[char]
      else
        char
      end
    end
  swap_chars.join
end
    
# Staggered Caps

def staggered_case(str)
  str.downcase.chars.map.with_index {|char, idx| idx.even? ? char.upcase : char}.join
end

# Staggered Caps (Part 2)

def staggered_case(str, first_case = 'up')
  str_chars = 
    str.downcase.chars.map.with_index do |char, idx|
      if first_case == 'up'
        idx.even? ? char.upcase : char
      else
        idx.odd? ? char.upcase : char
      end
    end
  str_chars.join
end

# Multiplicative Average

def show_multiplicative_average(arr)
  mult_avg = arr.reduce(&:*) / arr.size.to_f
  puts "The result is #{format("%.3f", mult_avg)}"
end

# Multiply lists

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map {|nest_arr| nest_arr.reduce(&:*)}
end

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Find middle word

def find_middle_word(str)
  words = str.split
  return puts "No middle word" if words.size.even?
  half_idx = words.size / 2 
  words[half_idx]
end

```

