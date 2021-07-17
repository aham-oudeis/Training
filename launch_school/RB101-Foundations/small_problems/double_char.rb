# def repeater(str)
#   new_str = ''
#   str.chars.each {|char| new_str << char << char}
#   new_str
# end

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''

ALPHABETS = ('A'..'Z').to_a
VOWELS = %W(A E I O U)
CONSONANTS = ALPHABETS - VOWELS

def double_consonants(str)
  new_str = ''
  str.chars.each do |char|
      new_str << char 
      new_str << char if CONSONANTS.include?(char.upcase)
  end
  new_str
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""