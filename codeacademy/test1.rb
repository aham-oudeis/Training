puts "Welcome, dear! What's your name?"

user_input = gets.chomp

user_input.downcase!

if user_input.include? "s"
    print "Voila! Your name contains letter s"
end