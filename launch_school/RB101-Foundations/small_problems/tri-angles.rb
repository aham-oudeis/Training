=begin
A triangle is classified as follows:

    right One angle of the triangle is a right angle (90 degrees)
    acute All 3 angles of the triangle are less than 90 degrees
    obtuse One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

=end

def is_not_a_triangle?(angles_arr)
  (angles_arr.reduce(:+) != 180) || (angles_arr.any? {|angle| angle <= 0})
end

def triangle_classification(a, b, c)
  angles_arr = [a, b, c]

  case
  when is_not_a_triangle?(angles_arr)   then :invalid
  when angles_arr.include?(90)          then :right
  when angles_arr.all? {|ang| ang < 90} then :acute
  else                                       :obtuse
  end
end

p triangle_classification(60, 70, 50) == :acute
p triangle_classification(30, 90, 60) == :right
p triangle_classification(120, 50, 10) == :obtuse
p triangle_classification(0, 90, 90) == :invalid
p triangle_classification(50, 50, 50) == :invalid

