# # str = 'The grass is green'

# # puts str[4, 8] # puts 8 characters starting from index 4
# # puts str[4..8] # puts characters between 4 and 8 inclusive.

# # str = 'How do you get to Carnegie Hall?'
# # arr = str.split(' ') # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
# # arr.join        # => "HowdoyougettoCarnegieHall?"

# # puts arr.join

# # str = "joe's favorite color is blue"
# # str[0] = 'J'
# # str # => "Joe's favorite color is blue"

# # puts str.split.map(&:capitalize).join(' ')

# loop do
#   number = rand(1..100)   # a random number between 1 and 10
#   puts number
#   puts 'Hello!'
#   if number < 15
#     puts 'Exiting...'
#     break
#   end
# end

# objects = ['hello', :key, 10, [], nil]
# counter = 0

# loop do
#   break if counter == objects.size
#   puts objects[counter].class
#   counter += 1
# end

# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# the problem lies at the level of individual words
# that means the string needs to be broken down into individual words
# each individual word is passed through a filter to test it is a palindrome
# if it is, then it is changed to upcase. 
# first we need a method for testing palindrome
# gotta be careful about the different cases of the words
# cases shouldn't matter
# take the string, break it into words, and map it by passing it through filter

# def palindrome?(str)
#   #case insensitive palindrome test
#   str.downcase == str.reverse.downcase
  
#   # a case sensitive would be:
#   # str == str.reverse
# end

# def palindrome_upcase(str)
#   palindrome?(str) ? str.upcase : str
# end


# def change_me(str)
#   palindrome_proc = proc {|item| palindrome_upcase(item)}

#   str.split.map(&palindrome_proc).join(' ')
# end

# puts change_me("")
# puts change_me("We will meet at noon") == "We will meet at NOON"
# puts change_me("No palindromes here") == "No palindromes here"
# puts change_me("") == ""
# puts change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"


def palindrome?(str)
  #case insensitive palindrome test
  # str.downcase == str.reverse.downcase
  
  # a case sensitive would be:
  str == str.reverse if str.size > 1
end

# palindrome substrings problem with looping method

def palindrome_substrings(str)
  palindrome_substrings = []
  size = str.size
  idx_limit = str.size - 1
  return palindrome_substrings if size == 0
  
  loop do
    break if idx_limit == 0
    string = str[..idx_limit]
    # puts string
    length = string.size
    palindrome_substrings << string if palindrome?(string)
    count = 1

    loop do
      break if count >= length - 1
      sub_string = string[count..]
      # puts sub_string
      palindrome_substrings << sub_string if palindrome?(sub_string)

      count += 1
    end

    idx_limit -= 1
  end

  palindrome_substrings
end

# Palindrome substrings problem with a bit of recursion

# def palindrome_substrings(str)
#   arr_palin_substrs = []
#   size = str.size
#   return arr_palin_substrs if size == 0

#   if size == 2
#     arr_palin_substrs << str if palindrome?(str)
#     arr_palin_substrs
#   else
#     idx = size - 1
#     loop do
#       break if idx == 0
#       arr_palin_substrs << str[..idx] if palindrome?(str[..idx])
#       idx -= 1
#     end

#     arr_palin_substrs + palindrome_substrings(str[1..])
#   end
  
# end

p palindrome_substrings('pupupllel')

# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

puts palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# puts palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# puts palindrome_substrings("palindrome") == []
# puts palindrome_substrings("") == []