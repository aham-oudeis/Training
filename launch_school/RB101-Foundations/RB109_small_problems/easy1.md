```ruby
# Repeat yourself
def repeat(str, num)
 num.times {|_| puts str}
 # num.times {puts str}
end

# odd

def is_odd?(num)
  num.abs % 2 != 0
end

# list of digits

def digit_list(num)
  num.digits.reverse
  # num.to_s.chars.map(&:to_i)
end

# how many

def count_occurrences(vehicles)
  vehicles.each_with_object({}) do |vehicle, hash|
    hash.key?(vehicle) ? hash[vehicle] += 1 : hash[vehicle] = 1
  end
end

def count_occurrences(vehicles)
  vehicles = vehicles.map(&:downcase)
  vehicles.uniq.each_with_object({}) do |vehicle, hash|
    hash[vehicle] = vehicles.count(vehicle)
  end
end

# Reverse it (part 1)

def reverse_sentence(str)
  str.split.each_with_object([]) {|word, arr| arr.unshift(word)}.join(' ')
end

# Reverse it (part 2)

def reverse_words(str)
  transformed_words = str.split.map {|word| word.size > 4 ? word.reverse : word}
  transformed_words.join(' ')
end

# Stringy Strings

def stringy(num)
  half = num / 2
  string = '10' * half
  num.even? ? string : string + '1'
end

def stringy(num, prefix = 1)
  half = num / 2
  string = prefix == 1 ? '10' * half : '01' * half
  suffix = prefix == 1 ? '1' : '0'
  num.even? ? string : string + suffix
end

# Array Average

def average(arr)
  arr.sum * 1.0 / arr.size
end

# Sum of Digits

def sum(num)
	num.digits.sum
end

# What's my bonus?

def calculate_bonus(num, bool)
  bool ? num / 2 : 0
end
```

