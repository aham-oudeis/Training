=begin
A triangle__with_length is classified as follows:

    equilateral All 3 sides are of equal length
    isosceles 2 sides are of equal length, while the 3rd is different
    scalene All 3 sides are of different length

To be a valid triangle__with_length, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle__with_length is invalid.

Write a method that takes the lengths of the 3 sides of a triangle__with_length as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle__with_length is equilateral, isosceles, scalene, or invalid.

**Problem**
-input: dimensions of a triangle__with_length
-output: classification: is it a triangle__with_length? if it is, of what kind?
-what counts as a triangle__with_length: three sided figure where the length of the two shortest sides is
-greater than the length of the remaining side.
-if it is a triangle__with_length and has all equal sides, then it is an equilateral triangle__with_length
-if it has two equal sides, then it is an isoceles triangle__with_length
-else it is a scalene triangle__with_length
=end

def triangle__with_length(a, b, c)
  lengths_arr = [a, b, c]
  uniq_lengths = lengths_arr.uniq.size

  is_not_a_triangle = ((lengths_arr.max - lengths_arr.min(2).sum) > 0) ||
                        lengths_arr.include?(0)

  if is_not_a_triangle
    :invalid
  elsif uniq_lengths == 1
    :equilateral
  elsif uniq_lengths == 2
    :isosceles
  else
    :scalene
  end
end

# launch school solution

# def triangle__with_length(side1, side2, side3)
#   sides = [side1, side2, side3]
#   largest_side = sides.max

#   case
#   when 2 * largest_side > sides.reduce(:+), sides.include?(0)
#     :invalid
#   when side1 == side2 && side2 == side3
#     :equilateral
#   when side1 == side2 || side1 == side3 || side2 == side3
#     :isosceles
#   else
#     :scalene
#   end
# end

p triangle__with_length(3, 3, 3) == :equilateral
p triangle__with_length(3, 3, 1.5) == :isosceles
p triangle__with_length(3, 4, 5) == :scalene
p triangle__with_length(0, 3, 3) == :invalid
p triangle__with_length(-3, 1, 1) == :invalid
