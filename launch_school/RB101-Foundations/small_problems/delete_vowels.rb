# This is a prroblem of transformation
# whatever is passed, the element gets transformed

def remove_vowels(arr)
  vowels = %(aeiou)
  arr.map {|item| item.delete('a' 'e' 'i' 'o' 'u' 'A' 'E' 'I' 'O' 'U')}
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']