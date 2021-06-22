```ruby
# Sum of Sums

def sum_of_sums(arr)
  sum = 0
  arr.each_with_index do |num, idx|
    sum += arr[0..idx].sum
  end
  sum
end

def sum_of_sums(arr)
  sum = 0
  sliced_sum = 0
  arr.each_with_index do |num, idx|
    sliced_sum += num
    sum += sliced_sum
  end
  sum
end

# Madlibs

print "Enter a noun: "
noun = gets.chomp.strip.downcase

print "Enter a verb: "
verb = gets.chomp.strip.downcase

print "Enter an adjective: "
adj = gets.chomp.strip.downcase

print "Enter an adverb: "
adv = gets.chomp.strip.downcase

puts "Do you #{verb} your #{adj} #{noun} #{adv} through psychedelic passageway? That is an interesting way of doing things."

# Leading Substrings

def leading_substrings(str)
  (1..str.length).each_with_object([]) do |idx, collection|
    collection << str[0, idx]
  end
end

# All substrings

def substrings(str)
  (0...str.length).each_with_object([]) do |idx, collection|
    (idx...str.length).each do |limit|
      collection << str[idx..limit]
    end
  end
end

def substrings(str)
  (0...str.length).each_with_object([]) do |idx, collection|
    collection.concat(leading_substrings(str[idx..-1]))
  end
end

# fizzbuzz

def fizzbuzz(num1, num2)
  (num1..num2).map do |n|
    if n % 15 == 0
      'FizzBuzz'
    elsif n % 5 == 0
      'Buzz'
    elsif n % 3 == 0
      'Fizz'
    else
      n
    end
  end
end

# Double Char (part 1)

def repeater(str)
  str.chars.each_with_object('') do |char, string|
    string << char * 2
  end
end

# Double Consonants
CONSONANTS = ('a'..'z').to_a - %w(a e i o u)
def double_consonants(str)
  str.chars.each_with_object('') do |char, string|
    to_add = CONSONANTS.include?(char.downcase) ? char * 2 : char
    string << to_add
  end
end

# Reverse the Digits in a number

def reversed_number(int)
  int.to_s.reverse.to_i
end

# Get the middle character

def center_of(str)
  middle = str.length / 2
  str.length.odd? ? str[middle, 1] : str[middle - 1, 2]
end
```

