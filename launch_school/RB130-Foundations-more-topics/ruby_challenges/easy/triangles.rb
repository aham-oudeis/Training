=begin
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.
=end

class Triangle
  attr_reader :kind, :sides

  def initialize(*args)
    display_error_message_if_invalid(args)
    @sides = args
  end

  def kind
    uniq_sides = sides.uniq.size
    case uniq_sides
    when 1    then 'equilateral'
    when 2    then 'isosceles'
    when 3    then 'scalene'
    end
  end

  def display_error_message_if_invalid(args)
    if not_three_sides?(args)
      raise ArgumentError, "A triange must have exactly three sides."
    elsif not_positive_side?(args)
      raise ArgumentError, "A triangle's side must be a positive number"
    elsif sum_of_two_sides_less_or_equal_than_third(args)
      raise ArgumentError, "Sum of any two sides must be greater than the third."
    end
  end

  def not_three_sides?(args)
    args.size != 3
  end

  def not_positive_side?(args)
    args.any? { |length| length <= 0 }
  end

  def sum_of_two_sides_less_or_equal_than_third(args)
    side1, side2, side3 = args.sort

    (side1 + side2) <= side3
  end
end

scalene = Triangle.new(3, 4, 5)
p scalene.kind