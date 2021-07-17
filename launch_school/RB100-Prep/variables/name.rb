# ask user for their first and last name
# and greet them

puts "What is your first name?"
first_name = gets.chomp.downcase  # to ensure consistency
first_name.capitalize!            # capitalize in place

puts "What is your last name?"
last_name = gets.chomp.downcase
last_name.capitalize! 

puts "
  Hi #{first_name} #{last_name}! 
  I am pleased to see you! 
  I hope life is treating you well!"


# output the name 10 times

10.times {puts "\t#{first_name} #{last_name}"}

