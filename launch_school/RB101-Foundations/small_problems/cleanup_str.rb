=begin
-the basic problem is of substituting non-alphanumeric characters with spaces
-if there are consequetive spaces, remove them and have only one
  --this is the most challenging part of the assignment.
  --there has to be a space where there was non-alphanumeric character 
  --(split and join is not going to work)
  --and there cannot be spaces more than one
=end

ALPHABETS = ('a'..'z').to_a + ('A'..'Z').to_a

def cleanup(str)
  # str_w_spaces = str.gsub(/[^a-zA-Z]/, ' ')
  # str_w_spaces.gsub(/[\s]+/, " ")
  # or
  # str.gsub(/[^a-z]/i, ' ').squeeze(' ß')
  str.gsub(/[^a-z]/i, ' ').gsub(/[\s]+/, " ")
end

# def cleanup(str)
#   cleanup_arr = []
#   str.chars.each do |char|
#     if ALPHABETS.include?(char)
#       cleanup_arr << char
#     else
#       cleanup_arr << ' ' unless cleanup_arr.last == ' '
#     end
#   end
#   cleanup_arr.join
# end

puts cleanup("---what's my +*& line?") == ' what s my line '