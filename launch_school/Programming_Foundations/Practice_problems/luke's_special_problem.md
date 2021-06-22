=begin
Suppose there is a string with words that contain letters and numbers.
Return an array where all the letters and numbers are separate strings.

separate_string("924hello w0rld11         2029krnk359kndfka39knfls") ==
[924, "hello", "w", 0, "rld", 112029 "krnk" 359, "kndfka", 39, "knfls"]
separate_string("hello924 world") == ["hello", 924, "world"]

Problem
Input: string with alphabets and numbers
Output: an array containing numbers converted to integers and consequetive strings

Rules
1. keep the numbers and strings separate
2. Ignore the spaces

Algorithm
Iterate through the characters in the string and do as follows:
1. if the character is a number, create a running register that can keep track of the digits

2. when the character is an alphabet, convert the register into an integer and then append it to the array.

3. if it is a character, keep appending the characters to a string
4. return the array that collects all the strings and numbers

=end

def separate_string(str)
  str = str.delete(" ")
  collection = []
  number = ''
  string = ''

  str.chars.each do |char|
    if char.match?(/[0-9]/)
      if number.empty?
        collection << string
        string = ''
      end
      number << char
    else
      if string.empty?
        collection << number.to_i
        number = ''
      end
      string << char
    end
  end

  collection << number if number != ''
  collection << string if string != ''
  collection.delete_at(0)
  collection

end

# "43lol"
# "105hello"

p ('43297agahl2847'.chars.slice_when do |first, second|
  (("a".."z").include?(first) && ("0".."9").include?(second)) ||
    (("a".."z").include?(second) && ("0".."9").include?(first))
end).map(&:join)


# separate_string("hello924hi world") == ["hello", 924, "hi", "world"]


# p separate_string("924hello w0rld11         2029krnk359kndfka39knfls") == [924, "hellow", 0, "rld", 112029, "krnk", 359, "kndfka", 39, "knfls"]



# def sum_of_integers(string)
#   sum = 0
#   current_number = ''
#   string.chars.each do |char|
#     if ('0'..'9').include?(char)
#       current_number += char
#     else
#       sum += current_number.to_i
#       current_number = ''
#     end
#   end
#   sum += current_number.to_i
# end


# p sum_of_integers("HE2LL3O W1OR5LD") == 11
# p sum_of_integers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635
# p sum_of_integers("HELLO WORLD!") == 0
# p sum_of_integers("HELLO WORLD77!") == 77
# p sum_of_integers("HELLO WORLD77") == 77