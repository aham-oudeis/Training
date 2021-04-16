# greetings for a name

puts "What is your name?"
name = gets.chomp.downcase.capitalize

def greeting(who)
  p "Hello, #{who}! You're awesome!"
end

greeting(name)  

# x = 4
# puts x = 2
# p name = "Joe"
# four = "four"
# print something = "nothing"