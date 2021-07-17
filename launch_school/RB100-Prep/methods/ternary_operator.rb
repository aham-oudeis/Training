
puts "Pick a number! "

input = gets.chomp.to_i

puts "Is #{input} divisible by 7? If yes, put 1; if no, put 0."

ans = gets.chomp.to_i
val = input % 7                  # find the remainder 
test = ans == 1 && val == 0      # checks if the answer matches the remainder
correct_ans = puts "That's right!"
incorrect_ans = puts "Oops! That's wrong"

test ? correct_ans : incorrect_ans # ternary operator