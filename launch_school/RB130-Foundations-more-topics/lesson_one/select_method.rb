 # select method

 sample = [1, 2, 3, 4, 5]

 p sample.select { |num| num.odd? }

 # Output: [1, 3, 5]
 # Return: [1, 3, 5]

# def select(array)
#   selection = []

#   index = 0
#   while index < array.size do
#     current_item = array[index]
#     selection << current_item if yield(current_item)

#     index += 1
#   end

#   selection
# end

def select(array)
  selection = []

  for item in array
    selection << item if yield(item)
  end

  selection
end

p select(sample) { |num| num.odd? }

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true