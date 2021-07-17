pets = ['cat', 'dog', 'fish', 'lizard']

# my_pets = pets.select {|pet| pet if pet == 'fish' || pet == 'lizard'}

# my_pets.pop
# puts my_pets
# puts "I have a #{my_pets[0]}."

# my_pets = pets[2..3]
# my_pets.pop
# my_pets.append(pets[1])
# puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}"

# colors = ['red', 'yellow', 'purple', 'green']

# colors.each {|col| puts "I am the color #{col}"}

# numbers = [1, 2, 3, 4, 5]

# doubled_numbers = numbers.map {|num| num * 2}

# p doubled_numbers

# numbers = [5, 9, 21, 26, 39]

# div_by_three = numbers.select {|n| n if n % 3 == 0}

# p div_by_three

# a_list = ['Dave', 7, 'Miranda', 3, 'Jason', 11]

# new_list = []

# a_list.each_with_index do |i, j|
#   next if j.odd?
#   new_list[j] = [a_list[j], a_list[j+1]]
# end

# new_list = new_list.select {|set| set if set != nil}

# p new_list
# p new_list.flatten

car = {
  type:    'sedan',
  color:   'blue',
  mileage: 80_000,
  year:    2003
}

car.delete(:mileage)

p car