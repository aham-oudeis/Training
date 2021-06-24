```ruby
=begin

Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

For example:

greatestProduct("123834539327238239583") // should return 3240
The input string always has more than five digits.

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

=end

def greatest_product(str)
  greatest_product = 0
  all_chars = str.chars
  
  (0..(all_chars.size - 5)).each do |idx|
    next_five = all_chars[idx, 5]
  	product = next_five.reduce(1) {|mult, num| mult * num.to_i}
  	greatest_product = product if product > greatest_product
	end
  greatest_product
end
  	
    
end

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0


```

