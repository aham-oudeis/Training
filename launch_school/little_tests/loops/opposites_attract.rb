# # a program that requests two integers from the user, adds them together, and then displays the result. Furthermore, insist that one of the integers be positive, and one negative; however, the order in which the two integers are entered does not matter.


first_integer = nil
second_integer = nil

def valid_int?(num_str)
  num_str.to_i.to_s == num_str && num_str != '0'
end

def input_number
  puts "Please input the either a positive or negative integer: "
  integer = gets.chomp
  return integer.to_i if valid_int?(integer)
  puts "Invalid Input."
  input_number
end

loop do 
  first_integer = input_number
  second_integer = input_number  
  # check if the two numbers are both positive or both negative
  if first_integer*second_integer > 0
    puts "Make sure that one of your numbers is positive and another negative."
  else 
    outcome = first_integer + second_integer
    puts "The sum of #{first_integer} and #{second_integer} is #{outcome}"
    break
  end
end
