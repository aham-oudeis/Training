# count = 1

# loop do
#   puts "#{count} is #{count.odd? ? 'Odd' : 'Even'}"
#   count += 1
#   break if count == 6
# end

# loop do
#   number = rand(100)
#   puts number
#   break if number.between?(0, 10)
# end

# process_the_loop = [true, false].sample

# loop do
#   if process_the_loop == true
#     puts "The loop was processed!"
#   else
#     puts "The loop wasn't processed!"
#   end
  
#   break
# end

# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i

#   if answer.to_i == 4
#     puts "That's correct!"
#     break
#   end

#   puts "Wrong Answer. Try again!"
# end

# numbers = []

# loop do
#   puts 'Enter any number:'
#   input = gets.chomp.to_i
#   numbers << input
#   break if numbers.size == 5
# end

# puts numbers

# names = ['Sally', 'Joe', 'Lisa', 'Henry']

# loop do
#   puts names.shift()
#   break if names.empty?
# end

# 5.times do |index|
#   break if index > 2
#   puts index 
# end


# 5.times do |index|
#   puts index if index > 2
# end

# number = 0

# until number == 10
#   number += 1
#   next if number.odd?
#   puts number
# end

# number_a = 0
# number_b = 0

# loop do
#   number_a += rand(2)
#   number_b += rand(2)
#   next if number_a < 5 || number_b < 5
#   puts "Number 5 is reached!"
#   break
# end

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

count = 1

while count < 3
  greeting
  count += 1
end