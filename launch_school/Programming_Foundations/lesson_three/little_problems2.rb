# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ages.include?('Spot')

# munsters_description = "The Munsters are creepy in a good way."

# puts munsters_description.swapcase

# puts munsters_description.capitalize

# puts munsters_description.downcase

# puts munsters_description.upcase

# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "The munsters are creepy in a good way."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# additional_ages = { "Marilyn" => 22, "Spot" => 237 }

# ages.update(additional_ages)  

# puts ages
# puts additional_ages

# advice = "Few things in life are as important as house training your pet dinosaur."

# puts advice.include?('Dino')

# 100.times do |number| 
#   if number < 50 
#     puts (" " * number + "The Flintstones Rock!")
#   else
#     puts (" " * (100-number) + "The Flintstones Rock!")
#   end
# # end

# puts "the value of 40 + 2 is ", 40 + 2

# puts "the value of 40 + 2 is #{40 + 2}."

# def factors(number)
#   divisor = 1
#   factors = []
#   if number == 0
#     [0]
#   else
#     until divisor > number
#       factors << number / divisor if number % divisor == 0
#       divisor += 1
#     end 
#     factors
#   end
# end

# def factors(number)
#   if number == 0
#     puts "Please input a positive number!"
#   else
#     number = number.abs
#     (1..number).select {|n| number % n == 0}
#   end
# end

# puts factors(-60)



# def fib(first_num, second_num)
#   limit = 15
#   fib_seq = [first_num, second_num]
#   while first_num + second_num <= limit
#     sum = first_num + second_num
#     fib_seq.push(sum)
#     first_num = second_num
#     second_num = sum
#   end
#   fib_seq
# end

# result = fib(2, 5)
# puts "result is #{result}"

# def fun_with_ids
#   a_outer = 42
#   b_outer = "forty two"
#   c_outer = [42]
#   d_outer = c_outer[0]

#   a_outer_id = a_outer.object_id
#   b_outer_id = b_outer.object_id
#   c_outer_id = c_outer.object_id
#   d_outer_id = d_outer.object_id

#   puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
#   puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
#   puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
#   puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
#   puts

#   1.times do
#     a_outer_inner_id = a_outer.object_id
#     b_outer_inner_id = b_outer.object_id
#     c_outer_inner_id = c_outer.object_id
#     d_outer_inner_id = d_outer.object_id

#     puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
#     puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
#     puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
#     puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block."
#     puts

#     a_outer = 22
#     b_outer = "thirty three"
#     c_outer = [44]
#     d_outer = c_outer[0]

#     puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
#     puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
#     puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
#     puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
#     puts


#     a_inner = a_outer
#     b_inner = b_outer
#     c_inner = c_outer
#     d_inner = c_inner[0]

#     a_inner_id = a_inner.object_id
#     b_inner_id = b_inner.object_id
#     c_inner_id = c_inner.object_id
#     d_inner_id = d_inner.object_id

#     puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
#     puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
#     puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
#     puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)."
#     puts
#   end

#   puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
#   puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
#   puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
#   puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."
#   puts

#   puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
#   puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
#   puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
#   puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
# end

# fun_with_ids
def is_an_ip_number?(str)
  (0..255).include?(str.to_i)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  
  # test to see if any of the array of strings is not an ip_number
  test = (dot_separated_words.map {|word| is_an_ip_number?(word)}).include?(false)
  
  dot_separated_words.size == 4 && !test
end

puts dot_separated_ip_address?("12.15.24.219")