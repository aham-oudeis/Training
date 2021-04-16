# using next in the loop to remove a preferred letter
# from a given string

puts "Type something. Anything. "
str = gets.chomp.downcase

puts "Which letter do you want to remove? Print one letter."
remove_letter = gets.chomp.downcase

while remove_letter.length != 1
  puts "Which letter do you want to remove? Print one letter."
  remove_letter = gets.chomp.downcase
end

a = 0
loop do
  a += 1
  if str[a-1] == remove_letter
    next
  end

  print str[a-1]
  
  if a > str.length
    print ". "
    break
  end
end
