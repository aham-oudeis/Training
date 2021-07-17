# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# def select_fruit(hash)
#   selected_fruit = {}
#   keys_arr =  hash.keys
#   counter = 0

#   loop do
#     current_key = keys_arr[counter]
#     selected_fruit.merge!(hash.slice(current_key)) if hash[current_key] == 'Fruit'

#     counter += 1
#     break if counter == keys_arr.size
#   end

#   selected_fruit
# end

# puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# def double_numbers!(numbers)
#   # numbers.map {|i| i * 2}
#   # or, in terms of a loop way
#   count = 0
#   loop do
#     numbers[count] = numbers[count] * 2
#     count += 1
#     break if count == numbers.size
#   end
#   numbers
# end

# my_numbers = [1, 4, 5, 7, 9, 12]

# p double_numbers!(my_numbers)
# p my_numbers

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# def general_select_fruit(hash, criterion)
#   selected_fruit = {}
#   keys_arr =  hash.keys
#   counter = 0

#   loop do
#     current_key = keys_arr[counter]
#     selected_fruit[current_key] = hash[current_key] if hash[current_key] == criterion

#     counter += 1
#     break if counter == keys_arr.size
#   end

#   selected_fruit
# end

# puts general_select_fruit(produce, 'Vegetable') # => {"apple"=>"Fruit", "pear"=>"Fruit"}


def multiply_items(numbers, multiple)
  # numbers.map {|i| i * multiple}
  # or, in terms of a loop way
  arr = []
  count = 0
  loop do
    arr[count] = numbers[count] * multiple
    count += 1
    break if count == numbers.size
  end
  arr
end

my_numbers = [1, 4, 5, 7, 9, 12]

p multiply_items(my_numbers, 3)

p my_numbers
