# a = [1, 3, 5, 7, 9]

# i = 0

# until i == (a.size)
#   puts a[i]
#   i += 1
# end

# for i in 1..100
#   puts i if i % 2 != 0
# end

friends = ['Sarah', 'John', 'Hannah', 'Ruby']

# for frn in friends
#   puts "Hello, " + frn
# end

# friends.each {|f| puts "Hello, " + f}

count = 1

# loop do
#   puts count.even? ? ("#{count} is even") : ( "#{count} is odd")
#   count += 1
#   break if count > 5
# end

# loop do
#   number = rand(100)
#   puts number
#   break if (number <= 11) & (number >= 0)
# end

# process_the_loop = [true, false].sample

# if process_the_loop == true
#   puts "The loop was proceessed"
# else
#   puts "The loop wasn't processed"
# end

# loop do
#   puts "What does 2 + 2 equal?"
#   answer = gets.chomp.to_i
#   if answer == 4
#     puts "Correct!"
#     break
#   end
  
#   puts "Wrong answer! Try again!"
# end

# friends = ['Sarah', 'John', 'Hannah', 'Ruby']
# loop do
#   puts friends.shift
#   break if friends.size == 0
# end

# 5.times do |idx|
#   p idx
#   break if idx == 2
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
#   next if (number_a != 5) & (number_b != 5)
#   puts number_a, number_b
#   puts "Number 5 has reached!"
#   break
# end

# def greeting
#   puts 'Hello!'
# end

# number_of_greetings = 2

# while number_of_greetings > 0
#   puts greeting
#   number_of_greetings -= 1
# end

# puts "Type anything you want!"

# inp_str = gets.chomp

# puts inp_str

# puts "What is your age in years?"

# age = gets.chomp.to_i

# puts "You are #{age * 12} months old!"

# ans = nil

# loop do 
#   puts "Do you want to print something? (y/n)"
#   ans = gets.chomp.downcase
#   # %w(y n) means an array with elements y and n
#   break if %w(y n).include?(ans)      
#   puts "Invalid input! Pease enter y or n"
# end

# puts "something"  if ans == 'y'

# loop do
#   puts ">> How many output lines do you want? Enter a number >= 3: "

#   num = gets.chomp.to_i

#   if num >= 3 
#     num.times {puts "This is fantastic!"}
#     break
#   else
#     puts "Not enough!"
#   end
# end

## asking for user password

# names_n_password = {"slow_chaos": "secreTT"}

# loop do
#   puts "Please enter your user name: "
#   user_name = gets.chomp
#   puts "Please enter your password: "
#   user_password = gets.chomp
#   break if names_n_password[user_name.to_sym] == user_password
#   puts "Authentication failed!"
# end

# puts "Welcome!"

## a program for division
# numerator = nil
# denominator = nil

# def valid_num?(num_str)
#   num_str.to_i.to_s == num_str
# end

# loop do
#   puts "Please input the numerator: "
#   numerator = gets.chomp
#   if valid_num?(numerator)
#     numerator = numerator.to_i
#     break
#   end
#   puts "Invalid input!"
# end

# loop do
#   puts "Please input the denominator: "
#   denominator = gets.chomp
  
#   if denominator.to_i == 0
#     puts "A denominator of 0 is not allowed!"
#   elsif valid_num?(denominator)
#     denominator = denominator.to_i
#     break
#   else
#     puts "Invalid input!"
#   end
# end

# puts "#{numerator} divided by #{denominator} is #{numerator/denominator.to_f}"



# loop do
#   puts ">> How many output lines do you want? Enter a number >= 3: "

#   num = gets.chomp
#   break if num.downcase == 'q'
#   num = num.to_i
#   if num >= 3 
#     num.times {puts "This is fantastic!"}
#   else
#     puts "Not enough!"
#   end
# end




