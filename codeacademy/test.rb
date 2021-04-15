print "We are going to see if the first number you offer is perfectly divisible by the second number. Pick a number.\n"
a = Integer(gets.chomp)

print "Pick a second number.\n"

b = Integer(gets.chomp)

c = a % b

if c == 0
    print "#{a} is strictly divisible by #{b}"

elsif c == 1
    print "#{a} is just a bit shy of being perfectly divisible by #{b}. #{a} is divided by #{b} leaves #{c} as a remainder"

else
    print "#{a} is divided by #{b} leaves #{c} as a remainder"

end