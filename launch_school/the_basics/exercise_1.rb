# adding two strings

puts "Gagan " + "Sapkota"

# finding each digit of a four digits number

a_number = 3736

one_place_digit      = a_number % 10
ten_place_digit      = (a_number % 100)/10.to_i
hundred_place_digit  = (a_number % 1000)/100.to_i
thousand_place_digit = (a_number % 10000)/1000.to_i 

puts thousand_place_digit
puts hundred_place_digit
puts ten_place_digit
puts one_place_digit

# hash to store movies and dates

movies = {
  Dark_Knight: 2012,
  Incendies: 2010,
  Dogtooth: 2009,
  Barbarian_Invasions: 2003,
  Rashomon: 1950,
  Taste_of_Cherry: 1997,
  Malena: 2000
}

movies.each_value {|v| puts v}

v_array  = []

movies.each_value {|v| v_array.push(v)}

puts v_array

# calculates the factorial

def factoryal(num)
  num = num.to_i
  if num  == 0 | 1
    return 1
  else
    return num * factoryal(num-1)
  end
end

puts factoryal(5)
puts factoryal(6)
puts factoryal(7)
puts factoryal(8)

# squares of three numbers and outputs the result

three_numbers = [23, 3, 17]

three_numbers.each {|n| puts n*n} 

# the error says that at line 2 there is a misplaced bracket ')' 
# where it should be }