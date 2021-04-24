# puts "Welcome, dear! What's your name?"

# user_input = gets.chomp

# user_input.downcase!

# if user_input.include? "s"
#     print "Voila! Your name contains letter s"
# end


# puts "Enter some text: "
# text = gets.chomp

# puts "Enter words to redact: "
# redact = gets.chomp

# words = text.split(" ")

# # we could substitute the curly braces with do-end pair
# words.each { |word| 
#   if word != redact
#     print word + " "
#    else
#      print "REDACTED" + " "
#    end }
  

# pets = Hash.new

# pets['Mitthu'] = "Cat"

# puts pets['Mitthu']

num_list = (1..16).to_a

def alphabetize(arr, rev=false)
  arr.sort!
  if rev == true
      return arr.reverse!
  else
    return arr
  end

end

puts alphabetize(num_list)
