# def divisors(num)
#   (1..(num/2)).each_with_object([]) do |item, collection|
#     collection << item if (num % item) == 0
#   end + [num]
# end

# Optimized by reducing the problem into half

def divisors(num)
  half =
    (1..(num**(1.0/2))).each_with_object([]) do |item, collection|
      collection << item if (num % item) == 0
    end

  half | half.reverse.map { |item| num / item }
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute