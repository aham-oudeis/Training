# create a countdown based on a provided number

puts "Where do you want to start the countdown?"

num = gets.chomp.to_i

# for i in (1..num).to_a.reverse
#   if i == 4       # skip number 4 from the countdown
#     next
#   end
#   puts i
# end

# using recursion

def countdown(num)
  if num == 1
    p num
  else 
    p num 
    countdown(num-1)
  end
end

countdown(num)
