```ruby
# welcome stranger

def greetings(arr, hash)
  puts "Hello, #{arr.join(' ')}! Nice to have a #{hash[:title]}"\
    " #{hash[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> Hello, John Q Doe! Nice to have a Master Plumber around.

# Double Doubles

def double_number?(int)
  str = int.to_s
  length = str.length
  half = length / 2
  
  length.even? && str[0, half] == str[half, half]
end

def twice(int)
  double_number?(int) ? int : int * 2
end

# Always returns negative

def negative(int)
  int <= 0 ? int : -int
end

# Uppercase Check

def uppercase?(str)
  str.chars.all? {|char| char == char.upcase}
end

# How long are you?

def word_lengths(str)
  return [] if str.empty?
  str.split.map {|word| "#{word} #{word.length}"}
end

# Name swapping

def swap_name(str)
  str.split.reverse.join(', ')
end

# Sequence Count

def sequence(n1, n2)
  (1..n1).map {|num| num * n2}
end

# Gradebook

def get_grade(n1, n2, n3)
  mean = (n1 + n2 + n3) / 3.0
  
  case mean
  when (90..100) then 'A'
  when (80...90) then 'B'
  when (70...80) then 'C'
  when (60...70) then 'D'
  else								'F'
  end
end

# Grocery List

def buy_fruit(list)
  list.flat_map {|fruit, quantity| [fruit] * quantity}
end

# Group Anagrams
    
def group_anagrams(arr)
  arr.group_by {|item| item.chars.sort.join}.values
end

def group_anagrams(arr)
  arr.each_with_object({}) do |item, group|
    sorted_letter = item.chars.sort.join
    if group.key?(sorted_letter)
      group[sorted_letter] << item
    else
      group[sorted_letter] = [item]
    end
  end
end

```

