=begin
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

**Problems**
-input: integer
-output: intger
  --an odd number that is a multiple of 7
  --with no repeat digit

Essentiials:
-(given number / 7) * 7 gives us the inger that is
-lower or equal to the given intger that is divisible by 7
-next product is result + 7
-check if it is odd and if its digits are all uniq
-if it passes, return the numbeer; otherwise, add 7 and test the number
=end

def uniq?(num)
  num.digits == num.digits.uniq
end

def featured(num)
  mult_of_seven = 7 + ((num /  7) * 7)
  next_odd_mult_of_seven =
    mult_of_seven.odd? ? mult_of_seven : mult_of_seven + 7

  loop do
    if next_odd_mult_of_seven.to_s.size >= 11
      return "There is no featured number after #{num}"
    end

    return next_odd_mult_of_seven if uniq?(next_odd_mult_of_seven)

    next_odd_mult_of_seven += 14
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements