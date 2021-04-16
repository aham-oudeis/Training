
# takes a string and returns all caps version
# only if the string is less than 10 characters

puts "Type something. Anything."

str = gets.chomp

if str.length < 10 
  str.upcase!
else 
  str.downcase! 
end

p str