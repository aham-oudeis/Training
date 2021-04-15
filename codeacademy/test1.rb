# puts "Welcome, dear! What's your name?"

# user_input = gets.chomp

# user_input.downcase!

# if user_input.include? "s"
#     print "Voila! Your name contains letter s"
# end

puts "Enter some text: "
text = gets.chomp

puts "Enter words to redact: "
redact = gets.chomp

words = text.split(" ")
words.each do |word| 
    if word != redact
        print word + " "
    else
        print "REDACTED" + " "
    end
end
  