# def negative(num)
#   num <= 0 ? num : -num
# end

# p negative(5) == -5
# p negative(-3) == -3
# p negative(0) == 0      # There's no such thing as -0 in ruby

# def sequence(num)
#   if num > 0
#     1.upto(num).to_a
#   else
#     1.upto(num.abs).map {|i| -i}.reverse + [0, 1]
#   end
# end

# p sequence(-5) #== [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]

def uppercase?(str)
    str == str.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true