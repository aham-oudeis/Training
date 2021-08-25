# each method for an array

sample = [1, 2, 3, 4, 5]

# sample.each do |num|
#   puts (num ** 2)
# end

# Output : 1, 4, 9, 16, 25 on each line
# Return : [1, 2, 3, 4, 5]

# Custom `each` method

# def each(iterable)
#   index = 0

#   while index < iterable.size do
#     yield(iterable[index])

#     index += 1
#   end

#   iterable
# end

def each(iterable)
  for item in iterable
    yield(item)
  end

  iterable
end

each(sample) do |num|
  puts (num ** 2)
end