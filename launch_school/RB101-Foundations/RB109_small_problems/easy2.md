```ruby
# How old is Teddy?

def print_teddy_age
  "Teddy is #{rand(20..200)} years old!"
  # "Teddy is #{(20..200).to_a.sample} years old!"
end

# Further Exploration
puts 'Please enter your name.'
name = gets.chomp.strip

def print_name_age(name = 'Teddy')
  "#{name.capitalize} is #{rand(20..200)} years old!"
end

print_name_age(name)

# How big is the room?

puts "Enter the length of the room in meters"
length = gets.chomp.to_f

puts "Enter the width of the room in meters"
width = gets.chomp.to_f

area_in_sq_meters = (length * width).round(2)
area_in_sq_feet = (area_in_sq_meters * 10.7639).round(2)

puts "The area of the room is #{area_in_sq_meters} square meters (#{area_in_sq_feet} square feet)"

# Tip Calculator

print "what's the bill? "
bill = gets.chomp.to_f

print "What is the tip percentage? "
tip_percent = gets.chomp.to_f
tip = tip_percent * bill / 100

puts "The tip is #{tip}"
puts "The total is #{tip + bill}"

# When will I retire?

require 'date'

print "What's your age? "
age = gets.chomp.to_i

print "At what age would you like to retire? "
retire_age = gets.chomp.to_i
remaining_years = retire_age - age
current_year = Date.today.year

puts "It's #{current_year}. You will retire in #{current_year + remaining_years}."
puts "You have #{remaining_years} years of work to go!"

# Odd Numbers

1.step(by: 2, to: 99) {|num| puts num}

(1..99).each {|num| puts num if num.odd? }

puts (1..99).select(&:odd?)

# Sum or Product of Consecutive

puts "Please enter an enter greater than 0"
num = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp.strip.downcase

shortcuts = {'s' => [:+ , 'sum'], 'p' => [:*, 'product']}
operation_sym = shortcuts[operation].first
to_do = shortcuts[operation].last

result = (1..num).reduce(&(operation_sym))

puts "The #{to_do} of numbers between 1 and #{num} is #{result}."

# Mutation


```

