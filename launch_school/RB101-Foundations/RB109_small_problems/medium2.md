```ruby
# Longest Sentence

=begin
Components:
1. read the file
2. store it as a string.
3. split the string into sentences
4. split the sentences into words.
5. count the words
=end

text = File.read('p84.txt')
all_sentences = text.split(/!|\?|\./)

longest_sentence = all_sentences.max_by {|sentence| sentence.split.size}

# Now I know my ABC

PAIRS = [['B', 'O'],  ['X', 'K'], ['D', 'Q'], ['C', 'P' ], 
         ['N', 'A'], ['G', 'T'], ['R', 'E'], ['F', 'S'], 
         ['J', 'W'], ['H', 'U'], ['V', 'I'],  ['L', 'Y'], ['Z', 'M']]

def block_word(str)
  str = str.upcase
  PAIRS.none? {|one, other| str.count(one) + str.count(other) > 1}
end

# Lettercase Percentage Ratio

def letter_percentages(str)
  length = str.length
  all_chars = str.chars
  collection = {lowercase: 0, uppercase: 0, neither: 0}
  all_chars.each do |char|
    if char.match?(/[a-z]/i) == false
      collection[:neither] += 1
    elsif char.downcase == char
      collection[:lowercase] += 1
    else
      collection[:upcase] += 1
    end
  end
  collection.transform_values {|v| (v * 100)/length}
end

# Triangle Sides

def not_a_triangle?(sides)
  sides.max >= sides.min(2).sum ||
  sides.any? {|num| num <= 0}
end

def triangle(side1, side2, side3)
  all_sides = [side1, side2, side3]
  
  return :invalid if not_a_triangle?(all_sides)

  distinct_sides = all_sides.uniq.size
  
  case distinct_sides
  when 1
    :equilateral
  when 2
    :isosceles
  else
    :scalene
  end
end

# Tri-angles

def not_a_triangle?(angles)
  angles.any? {|int| int <= 0 } ||
    angles.sum != 180
end

def triangle?(ang1, ang2, ang3)
  all_angles = [ang1, ang2, ang3]
  return :invalid if not_a_triangle?(all_angles)
  
  if all_angles.any? { |n| n > 90 }
    :obtuse
  elsif all_angles.any?{ |n| n == 90 }
    :right
  else
    :acute
  end
end

# Unlucky days
require 'date'

def friday_13th(year)
  (1..12).select {|month| Date.new(year, month, 13).friday?}.size
end

# Further Exploration
def five_fridays?(year, month)
  start_date = Date.new(year, month, 1)
  last_date = 
    if month < 12
      Date.new(year, month + 1, 1) - 1
    else
      Date.new(year + 1, 1, 1) - 1
    end
  
  (start_date..last_date).select {|day| day.friday?}.size == 5
end

def five_fridays(year)
  (1..12).select {|month| five_fridays?(year, month)}.size
end

# Next Featured Number

def featured?(num)
  return false if num.even? || num % 7 != 0
  
  num.digits == num.digits.uniq
end

def featured(num) 
  multiple_of_seven = ((num + 1) / 7.0).ceil * 7
  
  featured_num  = 
  	multiple_of_seven.odd? ? multiple_of_seven : multiple_of_seven + 7

  loop do 
    break if featured?(featured_num)
    return 'No such number' if featured_num.digits.size > 10
    featured_num += 14
  end
  featured_num
end


# Bubble_sort

def bubble_sort!(arr)
  size = arr.size
  loop do
    changes = 0
    (count...size).each do |idx|
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        changes += 1
      end
    end
    size -= 1
  	break if changes.zero?
  end
end

def bubble_sort(arr)
  arr = arr.dup
  count = 0
  size = arr.size
  loop do
    changes = 0
    (count...(size - 1)).each do |idx|
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        changes += 1
      end
    end
    size -= 1
  	break if changes.zero?
  end
  arr
end

# Sum square difference

def sum_square_difference(n)
  numbers = (1..n).to_a
  (numbers.sum ** 2) - (numbers.map {|n| n**2}.sum)
end

    
    
```

